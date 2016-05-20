FROM baselibrary/baseimage:1.0.0
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Version
ENV CONSUL_MAJOR   0.6
ENV CONSUL_RELEASE 0.6.4

## Packages
RUN set -x \
	&& curl -fSL "https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64" -o /usr/bin/confd  \
	&& curl -fSL "https://releases.hashicorp.com/consul/${CONSUL_RELEASE}/consul_${CONSUL_RELEASE}_linux_amd64.zip" -o consul.zip \
	&& chmod a+x /usr/bin/confd \
	&& unzip consul.zip -d /usr/bin/ \
	&& rm consul.zip

## Configs
ADD config /etc/confd

## Scripts
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x            /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

VOLUME ["/var/lib/consul"]

CMD ["consul", "agent", "-config-file", "/etc/consul/server.json"]


