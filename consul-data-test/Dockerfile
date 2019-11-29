from busybox

RUN mkdir -p /usr/share/nginx/html
RUN mkdir -p /etc/xivo-auth/conf.d
RUN mkdir -p /usr/local/etc/haproxy/
RUN mkdir /config

ADD config-auth/ /etc/xivo-auth/conf.d
ADD auth-web/ /usr/share/nginx/html
ADD quebec/ /config
ADD template/ /config

VOLUME /usr/share/nginx/html
VOLUME /etc/xivo-auth/conf.d
VOLUME /config
VOLUME /usr/local/etc/haproxy

CMD sh -c 'while true; do sleep 10; done'
