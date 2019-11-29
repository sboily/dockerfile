from gliderlabs/alpine

WORKDIR /usr/src
ADD https://github.com/hashicorp/consul-replicate/releases/download/v0.2.0/consul-replicate_0.2.0_linux_amd64.tar.gz /usr/src/
RUN tar xfvz consul-replicate_0.2.0_linux_amd64.tar.gz
RUN mv consul-replicate_0.2.0_linux_amd64/consul-replicate /usr/bin

RUN rm -rf consul-replicate*

ADD ./config /config
ONBUILD ADD ./config /config

CMD consul-replicate -log-level debug -config /config/replicate.hcl
