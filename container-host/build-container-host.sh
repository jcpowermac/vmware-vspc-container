#!/bin/bash
export GOVC_URL=vcenter
export GOVC_USERNAME="administrator@vsphere.local"
export GOVC_PASSWORD=""
export GOVC_INSECURE=1
export GOVC_DATACENTER=dc1
export GOVC_DATASTORE=datastore1
export GOVC_CLUSTER=cluster1


URL_TO_FCCT=https://github.com/coreos/fcct/releases/download/v0.2.0/fcct-x86_64-unknown-linux-gnu
URL_TO_OVA=https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/31.20200113.3.1/x86_64/fedora-coreos-31.20200113.3.1-vmware.x86_64.ova
URL_TO_BINARY=https://github.com/vmware/govmomi/releases/download/v0.22.1/govc_linux_amd64.gz

if [ ! -f govc  ]; then
    echo "Downloading govc..."
    curl -L ${URL_TO_BINARY} | gunzip > govc
    chmod +x govc
fi

if [ ! -f fedora-coreos.ova ]; then
    echo "Downloading Fedora CoreOS OVA..."
    wget --show-progress -nc -O fedora-coreos.ova ${URL_TO_OVA}
fi
if [ ! -f fcct ]; then
    echo "Downloading fcct..."
    wget --show-progress -nc -O fcct ${URL_TO_FCCT}
    chmod +x fcct
fi

./govc import.ova -name vspc fedora-coreos.ova

CONFIG_DATA=$(./fcct -strict < fcos.yaml | base64 -w0 -)

./govc vm.change -vm vspc \
    -e guestinfo.ignition.config.data=${CONFIG_DATA} \
    -e guestinfo.ignition.config.data.encoding="base64"


