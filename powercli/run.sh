#!/bin/bash

IMAGE=quay.io/jcallen/vmware-vspc-powercli
NAME=vmware-vspc-powercli

#podman build -t ${IMAGE} -f Dockerfile .
podman rm -f ${NAME}

podman run -d --rm --name ${NAME} ${IMAGE}

podman exec -it --name ${NAME} pwsh
