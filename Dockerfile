FROM nginx:alpine

RUN apk --no-cache --update add curl openssl socat git
RUN cd /tmp \
 && git clone https://github.com/Neilpang/acme.sh.git \
 && cd acme.sh \
 && git checkout -b release 3.0.2 | head -n10 \
 && ./acme.sh --install --home /opt/acme.sh \
 && rm -rf /tmp/acme.sh

COPY docker-entry.sh /docker-entry.sh
COPY cron.sh /cron.sh
COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /etc/nginx/conf.d

VOLUME /root/.acme.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/docker-entry.sh"]
