#!/bin/bash

IMAGE=powercli

podman build -t ${IMAGE} -f Dockerfile .
podman rm -f ${IMAGE}

podman run -it --rm --name ${IMAGE} ${IMAGE}
