.PHONY: build docker clean

DOCKER_REPOSITORY=registry.cn-beijing.aliyuncs.com/gldsg-lpd
VERSION=heima
docker_base:
	docker build \
		-f Dockerfile.base \
		-t $(DOCKER_REPOSITORY)/databox-videobox-web-base:${VERSION} \
		.
docker_web:
	docker build \
		-f Dockerfile \
		-t $(DOCKER_REPOSITORY)/edge_databox-videobox-web:$(VERSION) \
		.


docker_push:
	docker push $(DOCKER_REPOSITORY)/edge_databox-videobox-web:$(VERSION) \


clean:
	rm -f rules
