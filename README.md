# nginx-acme.sh

```
# example.conf
server {
    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/domain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/domain.com/privkey.pem;

    root /usr/share/nginx/html;
    index index.html;
}
```

```
# see https://github.com/Neilpang/acme.sh for more info
docker run -d \
	  -p 80:80 \
	  -p 443:443 \
	  -v "$(PWD)/example.conf:/etc/nginx/conf.d/example.conf:ro" \
	  -v "$(PWD)/acme.sh:/acme.sh" \
	  --name nginx-acme.sh-test \
	  choffmeister/nginx-acme.sh:latest
	  --issue -d my.domain.com
```
