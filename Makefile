PLATFORMS ?= linux/amd64,linux/arm/v7,linux/arm64
DOCKER_REGISTRY ?= docker.io

all:
	docker buildx build . "--platform=${PLATFORMS}" --tag "$(DOCKER_REGISTRY)/synesthesiam/marytts:5.2" --push

.PHONY: local
local:
	docker build . -f Dockerfile.local -t 'synesthesiam/marytts:5.2'
