#!/bin/bash

IMAGE=vmware-vspc

podman build -t ${IMAGE} -f Dockerfile .
podman rm -f ${IMAGE}

podman run --name ${IMAGE} -d -p 13370:13370 ${IMAGE}
