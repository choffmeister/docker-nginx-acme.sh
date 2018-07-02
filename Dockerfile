FROM nginx:alpine

RUN apk --no-cache --update add curl openssl socat git
RUN cd /tmp \
 && git clone https://github.com/Neilpang/acme.sh.git \
 && cd acme.sh \
 && ./acme.sh --install --home /opt/acme.sh \
 && rm -rf /tmp/acme.sh

COPY docker-entry.sh /docker-entry.sh
COPY cron.sh /cron.sh
WORKDIR /etc/nginx/conf.d
COPY default.conf /etc/nginx/conf.d/default.conf

VOLUME /root/.acme.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/docker-entry.sh"]
