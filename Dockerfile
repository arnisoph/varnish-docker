FROM alpine:3.3
MAINTAINER Arnold Bechtoldt <mail@arnoldbechtoldt.com>

RUN apk add --update varnish && rm -rf /var/cache/apk/*

CMD /usr/sbin/varnishd -f /etc/varnish-custom/default.vcl
