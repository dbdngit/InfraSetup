
[CmdletBinding()]
param (
)

#-workingDirectory $(System.DefaultWorkingDirectory)
Write-Output "Azure working directory: $env:System_DefaultWorkingDirectory"
Select-AzSubscription -SubscriptionId $env:sub_id

Write-Output "Env prefix: $($env:env_prefix)"

Write-Output "Env suffix: $($env:env_suffix)"

Write-Output "Location code: $($env:location_code)"

$rgName = 'rg-' + $env:env_prefix + '-' + $env:location_code + '-' + $env:env_suffix  


$winDiaFilePath = "$($env:System_DefaultWorkingDirectory)/_01-LGRI-ALPS-Infra/LGRI-ALPS-Infra-Code/01.Infra/20.AlpsWinSnrVM/Powershell/WinDiagnostics.json"

Write-Output "1. Start Install Windows diagnostics on..."
Set-AzVMDiagnosticsExtension -ResourceGroupName $rgName -VMName $env:vm_name -StorageAccountName $env:diagnostics_storage_name -DiagnosticsConfigurationPath $winDiaFilePath
Write-Output "End Install Windows diagnostics on..."
