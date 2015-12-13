from debian:jessie

RUN echo "deb http://httpredir.debian.org/debian jessie-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list
RUN apt-get update -yyq
RUN apt-get -yy -t jessie-backports install collectd
