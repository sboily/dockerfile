## Image to build from sources

FROM debian:stable
MAINTAINER Sylvain Boily "sylvain@wazo.io"

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Add dependencies
RUN apt-get -qq update \
    && apt-get -qq -y install \
       wget \
       git \
       python-pip \
       apt-utils \
       libncurses-dev \
       uuid-dev \
       libxml2-dev \
       libsqlite3-dev \
       build-essential \
       curl \
       liblua5.1-dev \
       lua5.1 \
       libssl-dev \
       libcurl4-gnutls-dev \
       libsrtp2-dev \
       libtiff-dev \
       libedit-dev \
       vim \
       libspandsp-dev

# Install Asterisk
WORKDIR /usr/src
RUN wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current.tar.gz
RUN tar xfvz asterisk-16-current.tar.gz
WORKDIR /usr/src/asterisk-16.6.2
RUN ./configure --with-pjproject-bundled --with-jansson-bundled
RUN make
RUN make install
RUN make samples
RUN make config

# Install XiVO confgend client
WORKDIR /usr/src
RUN git clone https://github.com/wazo-pbx/xivo-confgend-client.git
WORKDIR /usr/src/xivo-confgend-client/
RUN apt-get -y -qq install python-dev
RUN pip install -r requirements.txt
RUN python setup.py install
WORKDIR /root

# Clean
RUN apt-get clean
RUN rm -rf /usr/src/*

EXPOSE 5060/udp
EXPOSE 5038
EXPOSE 8888

CMD asterisk -dvf
