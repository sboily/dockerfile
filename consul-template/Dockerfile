from hashicorp/consul-template:alpine

ADD ./config /config
ONBUILD ADD ./config /config

CMD consul-template -log-level debug -config /config/template.hcl
