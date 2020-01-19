# vmware-vspc-container
OpenStack's VMware Virtual Serial Port Concentrator container

[![Docker Repository on Quay](https://quay.io/repository/jcallen/vmware-vspc/status "Docker Repository on Quay")](https://quay.io/repository/jcallen/vmware-vspc)

## Prerequisites

- Container runtime (tested with podman)

## Setup

VMware Documentation:

https://docs.vmware.com/en/VMware-vSphere/6.7/com.vmware.vsphere.vm_admin.doc/GUID-C6FBCF66-5796-4EE6-BF47-4DCAA9DCD1E3.html

### ESXi Firewall

#### Manual
- Click on host -> Configure -> Firewall -> Edit...
  Enable "VM serial port over network" and "VM serial port connected to vSPC"

#### Scripted
See `./powercli/configure-host-firewall.ps1`

### Virtual Machine

#### Manual
- Right click on virtual machine -> "Edit Settings..." -> Add New Device (serial)


- Use Network
- Direction: Server
- Port URI: vmware-vspc
- Use Virtual Serial Port Concentrator
- vSPC URI: telnet://container_host_ip_address:13370
- I/O Mode: enabled

#### Scripted
See `./powercli/configure-vm-serial-device.ps1`

### Container
Use `./run.sh` to build, destroy and start container

## TODO
- Use certificates

