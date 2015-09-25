from haproxy

WORKDIR /usr/src
ADD https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_amd64.tar.gz /usr/src/
RUN tar xfvz consul-template_0.10.0_linux_amd64.tar.gz
RUN mv consul-template_0.10.0_linux_amd64/consul-template /usr/bin

RUN rm -rf consul-template*

RUN mkdir /var/run/haproxy/

ADD ./config /config
ONBUILD ADD ./config /config

CMD consul-template -log-level debug -config /config/template.hcl
