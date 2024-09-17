PRODUCT=fake-server
TAG = $(shell git describe --always --abbrev --tags --long)
PRIVATE_DOCKER_REPO = ghcr.io/sudhanshuraheja

build:
	docker build -t $(PRODUCT):$(TAG) . --load
	docker tag $(PRODUCT):$(TAG) $(PRODUCT):latest

run:
	docker run -p 5999:5999 -d --name fake-server fake-server:latest bun run dev

push:
	docker build -t $(PRIVATE_DOCKER_REPO)/$(PRODUCT):$(TAG) . --push
