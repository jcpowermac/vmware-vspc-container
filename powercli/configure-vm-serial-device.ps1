#!/usr/bin/pwsh
# Modified:
# https://communities.vmware.com/thread/577036

# Virtual Serial Port Concentrator
$vspcip = "172.31.54.119"
# Virtual Serial Port Concentrator
$folder = "openshift-infra-id"

$dev = New-Object VMware.Vim.VirtualDeviceConfigSpec
$dev.operation = "add"
$dev.device = New-Object VMware.Vim.VirtualSerialPort
$dev.device.key = -1
$dev.device.backing = New-Object VMware.Vim.VirtualSerialPortURIBackingInfo
$dev.device.backing.direction = "server"
$dev.device.backing.serviceURI = "vmware-vspc"
$dev.device.backing.proxyURI = "telnet://$($vspcip):13370"
$dev.device.connectable = New-Object VMware.Vim.VirtualDeviceConnectInfo
$dev.device.connectable.connected = $true
$dev.device.connectable.StartConnected = $true
$dev.device.yieldOnPoll = $true

$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.DeviceChange += $dev


(Get-Folder -Name $folder | Get-VM) | ForEach-Object -Process {
    $_.ExtensionData.ReconfigVM($spec)
}

