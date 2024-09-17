PRODUCT=fake-server
TAG = $(shell git describe --always --abbrev --tags --long)
PRIVATE_DOCKER_REPO = ghcr.io/sudhanshuraheja

docker_build:
	docker buildx build -t $(PRODUCT):$(TAG) . --load
	docker tag $(PRODUCT):$(TAG) $(PRODUCT):latest

docker_push:
	docker buildx build -t $(PRIVATE_DOCKER_REPO)/$(PRODUCT):$(TAG) . --push
