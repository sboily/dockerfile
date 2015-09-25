FROM debian:wheezy
MAINTAINER Sylvain Boily "sboily@avencall.com"

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Add dependencies
RUN apt-get -qq update && \
      apt-get -qq -y install \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php5-xmlrpc \
        make

# Activate rewrite apache module
RUN a2enmod rewrite

# Add apache config
ADD apache/default /etc/apache2/sites-available/
ONBUILD ADD apache/* /etc/apache2/sites-available/

# Install siremis
ADD http://siremis.asipto.com/pub/downloads/siremis/siremis-4.2.0.tgz /usr/src/
WORKDIR /usr/src
RUN tar xfvz siremis-4.2.0.tgz
RUN mv siremis-4.2.0 /var/www
WORKDIR /var/www/siremis-4.2.0
RUN make prepare
RUN make chown

# Clean
RUN rm /usr/src/siremis-4.2.0.tgz
RUN apt-get -y -qq remove make
RUN apt-get clean

EXPOSE 80

CMD apache2 -k start -DFOREGROUND
