# nginx-acme.sh

```
# example.conf
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
	  -v "$(PWD)/example.conf:/etc/nginx/conf.d/example.conf:ro" \
	  -v "$(PWD)/acme.sh:/root/.acme.sh" \
	  --name nginx-acme.sh-test \
	  choffmeister/nginx-acme.sh:latest
	  --issue -d my.domain.com
```
