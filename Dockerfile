FROM debian:jessie
MAINTAINER Arnold Bechtoldt <mail@arnoldbechtoldt.com>

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update -qq && \
    apt-get upgrade -yV -o DPkg::Options::=--force-confold && \
    apt-get install -yV -o DPkg::Options::=--force-confold \
        varnish && \
    apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use something this in your sub-image:

#RUN date +'%s' > /etc/varnish/secret
#CMD /usr/sbin/varnishd \
#  -F \
#  -S /etc/varnish/secret \
#  -T localhost:6082 \
#  -a 0.0.0.0:8484 \
#  -f /etc/varnish/default.vcl \
#  -f /etc/varnish/default.vcl \
#  -s malloc,256m && \
