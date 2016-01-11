FROM debian:jessie
MAINTAINER Arnold Bechtoldt <mail@arnoldbechtoldt.com>

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update -qq && \
    apt-get upgrade -yV -o DPkg::Options::=--force-confold && \
    apt-get install -yV -o DPkg::Options::=--force-confold \
        varnish && \
    apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /usr/sbin/varnishd -F -f /etc/varnish-custom/default.vcl
