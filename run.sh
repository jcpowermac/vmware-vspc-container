#!/bin/bash

#IMAGE=vmware-vspc
IMAGE="quay.io/jcallen/vmware-vspc:latest"
NAME="vmware-vspc"

#podman build -t ${IMAGE} -f Dockerfile .
podman rm -f ${NAME}

podman run --name ${NAME} -d -p 13370:13370 ${IMAGE}
