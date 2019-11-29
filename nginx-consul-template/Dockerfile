from quintana/consul-template

RUN apk update
RUN apk add nginx
RUN mkdir /run/nginx
RUN rm /etc/nginx/conf.d/*

CMD nginx && consul-template -config /config/template.hcl -log-level=info
