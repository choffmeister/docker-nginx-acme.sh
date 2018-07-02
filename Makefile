IMAGE=choffmeister/nginx-acme.sh
TAG=latest

build:
	docker build -t "$(IMAGE):$(TAG)" .

publish: build
	docker push "$(IMAGE):$(TAG)"

test: build
	docker run --rm -it \
	  -v "$(PWD)/example.conf:/etc/nginx/conf.d/example.conf:ro" \
	  -p 80:80 \
	  -p 443:443 \
	  --name nginx-acame.sh-test \
	  "$(IMAGE):$(TAG)" \
	  --issue -d domain.com --staging
