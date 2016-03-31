## Image to build from sources

FROM debian:jessie
MAINTAINER Sylvain Boily "sboily@proformatique.com"

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Add dependencies
RUN apt-get -qq update
RUN apt-get -qq -y install \
    wget \
    git \
    python-pip \
    apt-utils \
    libncurses-dev \
    uuid-dev \
    libjansson-dev \
    libxml2-dev \
    libsqlite3-dev \
    build-essential \
    curl \
    liblua5.1-dev \
    lua5.1 \
    libssl-dev \
    libcurl4-gnutls-dev \
    libsrtp0-dev \
    libtiff-dev \
    libspandsp-dev 

# Install pjproject
WORKDIR /usr/src
RUN wget http://www.pjsip.org/release/2.4.5/pjproject-2.4.5.tar.bz2
RUN tar -xjvf pjproject-2.4.5.tar.bz2
WORKDIR /usr/src/pjproject-2.4.5
ENV CFLAGS -DPJ_HAS_IPV6=1
RUN ./configure --prefix=/usr --enable-shared --disable-sound --disable-resample --disable-video --disable-opencore-amr
RUN make dep
RUN make
RUN make install
RUN ldconfig

# Install Asterisk
WORKDIR /usr/src
RUN wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-13-current.tar.gz
RUN tar xfvz asterisk-13-current.tar.gz
WORKDIR /usr/src/asterisk-13.8.0
RUN ./configure
RUN make
RUN make install
RUN make samples
RUN make config

# Install XiVO confgend client
WORKDIR /usr/src
RUN git clone https://github.com/xivo-pbx/xivo-confgend-client.git
WORKDIR /usr/src/xivo-confgend-client/
RUN apt-get -y -qq install python-dev
RUN pip install -r requirements.txt
RUN python setup.py install
WORKDIR /root

# Clean
RUN rm -rf /usr/src/*

EXPOSE 5060/udp
EXPOSE 5038
EXPOSE 8888

CMD asterisk -dvf
