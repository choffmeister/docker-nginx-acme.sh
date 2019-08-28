# nginx-acme.sh

```
# conf.d/example.conf
server {
    listen 443 ssl;
    ssl_certificate /root/.acme.sh/domain.com/fullchain.cer;
    ssl_certificate_key /root/.acme.sh/domain.com/domain.com.key;

    root /usr/share/nginx/html;
    index index.html;
}
```

```
# see https://github.com/Neilpang/acme.sh for more info
docker run -d \
    -p 80:80 \
    -p 443:443 \
    -v "$(PWD)/conf.d:/etc/nginx/conf.d:ro" \
    -v "$(PWD)/acme.sh:/root/.acme.sh" \
    --name nginx-acme.sh-test \
    choffmeister/nginx-acme.sh:latest \
    "--issue -d domain.com -d my.domain.com --staging" \
    "--issue -d domain2.com -d my.domain2.com --staging"
```
