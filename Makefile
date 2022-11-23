IMAGE=ghcr.io/choffmeister/nginx-acme.sh
TAG=latest

build:
	docker buildx build --platform=linux/amd64 -t "$(IMAGE):$(TAG)" . --load

publish:
	docker buildx build --platform=linux/amd64 -t "$(IMAGE):$(TAG)" . --push

test: build
	docker run --rm -it \
	  -v "$(PWD)/example.conf:/etc/nginx/conf.d/example.conf:ro" \
	  -p 80:80 \
	  -p 443:443 \
	  --name nginx-acme.sh-test \
	  "$(IMAGE):$(TAG)" \
	  "--issue --dns dns_dgon -d domain.com --staging" \
	  "--issue --dns dns_dgon -d domain2.com --staging"
