#requires -version 3
<#
.SYNOPSIS
  Script Installs Latest Version of SSMS
.DESCRIPTION
  Script Downloads the Latest SSMS from Microsoft and Install it Silently
.INPUTS
  None
.OUTPUTS
  Log file stored in C:\Windows\Temp\SSMS_Install.log
.NOTES
  Version:        1.0
  Author:         Alexander Marrero
  Creation Date:  4/13/2020
  Purpose/Change: Initial script development

#>
#Download Latest SSMS

function Check_Program_Installed( $programName ) {
  $wmi_check = (Get-WMIObject -Query "SELECT * FROM Win32_Product Where Name Like '%$programName%'").Length -gt 0
  return $wmi_check;
  }

$test =  Check_Program_Installed("SQL Server Management Studio")

if ($test = $false)
{
#Script
"$(Get-Date): Changing to Temp Directory" | Out-File $env:TEMP\SSMS_Install.log -Append

Set-Location -path $env:TEMP

"$(Get-Date): Downloading Latest SSMS Files from Microsoft" | Out-File $env:TEMP\SSMS_Install.log -Append

curl.exe -L https://aka.ms/ssmsfullsetup --output SSMS_Install.exe

"$(Get-Date): Executing Silent Install" | Out-File $env:TEMP\SSMS_Install.log -Append

./SSMS_Install.exe /quiet /norestart /log $env:TEMP\SSMS_install_log.log
}



 


