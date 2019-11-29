from quintana/kamailio

MAINTAINER Sylvain Boily "sylvain@wazo.io"

ENV VERSION 0.23.0

WORKDIR /usr/src
ADD https://releases.hashicorp.com/consul-template/${VERSION}/consul-template_${VERSION}_linux_amd64.tgz /usr/src/
RUN tar xfvz consul-template_${VERSION}_linux_amd64.tgz
RUN mv consul-template /usr/bin

ADD ./config/kamailio/* /etc/kamailio/
ADD ./config/consul-template/* /config/

EXPOSE 5060/udp

CMD kamailio && consul-template -log-level debug -config /config/template.hcl
