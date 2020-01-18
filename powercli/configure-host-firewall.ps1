#!/usr/bin/pwsh

Get-VMHost | ForEach-Object -Process {
    Get-VMHostFirewallException -vmhost $_ | where {$_.Name.Contains("serial")} |
    ForEach-Object -Process {
        $_ | Set-VMHostFirewallException -Enable $true
    }
}
