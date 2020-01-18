## PowerCLI scripts

Review each script before execution.  They are simple
and may need modification.  Both require
`Connect-VIServer` to be executed beforehand.

#### configure-host-firewall.ps1
Every ESXi host will be modified within vCenter
to enable firewall rules for the network serial port.

#### configure-vm-serial-device.ps1
Each virtual machine in a specific folder will be
configured for a network serial port configured
for a vSPC.
