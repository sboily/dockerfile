from debian:buster

MAINTAINER Sylvain Boily "sylvain@wazo.io"

RUN apt-get -yqq update
RUN apt -yqq install kamailio \
                     kamailio-postgres-modules

EXPOSE 5060

CMD kamailio -ddDDe
