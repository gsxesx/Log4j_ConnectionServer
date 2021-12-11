## Assumes all keys exist
## Version 1.0 | 12.11.21
## Copyright Matt Langguth | @GSXESX

## VMware Reference KB: https://kb.vmware.com/s/article/87073
##

## Set Value MessageBusService
$MessageBusService = Get-ItemPropertyValue -Path "HKLM:\Software\VMware, Inc.\VMware VDM\plugins\wsnm\MessageBusService\Params\" -Name "JVMOptions"
$UpdatedValue1 = $MessageBusService + " -Dlog4j2.formatMsgNoLookups=true"
Set-ItemProperty -Path "HKLM:\Software\VMware, Inc.\VMware VDM\plugins\wsnm\MessageBusService\Params\" -Name "JVMOptions" -Value $UpdatedValue1

## Set Value TomcatService
$TomcatService = Get-ItemPropertyValue -Path "HKLM:\Software\VMware, Inc.\VMware VDM\plugins\wsnm\TomcatService\Params\" -Name "JVMOptions"
$UpdatedValue2 = $TomcatService + " -Dlog4j2.formatMsgNoLookups=true"
Set-ItemProperty -Path "HKLM:\Software\VMware, Inc.\VMware VDM\plugins\wsnm\TomcatService\Params\" -Name "JVMOptions" -Value $UpdatedValue2

## Set Value TunnelService
$TunnelService = Get-ItemProperty -Path "HKLM:\Software\VMware, Inc.\VMware VDM\plugins\wsnm\TunnelService\Params\" -Name "JVMOptions"
$UpdatedValue3 = $TunnelService + " -Dlog4j2.formatMsgNoLookups=true"
Set-ItemProperty -Path "HKLM:\Software\VMware, Inc.\VMware VDM\plugins\wsnm\TunnelService\Params\" -Name "JVMOptions" -Value $UpdatedValue3

restart-service "VMware Horizon View Connection Server" -Force
