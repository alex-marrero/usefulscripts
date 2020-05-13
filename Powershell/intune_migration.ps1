<#	
	.NOTES
	===========================================================================
	 Created on:   	4/6/2020
	 Created by:   	Alexander Marero
	 Organization: 	Mednax Services Inc
	 Filename:      intune_migration.ps1
	===========================================================================
	.DESCRIPTION
        Script Looks at all Registry keys for Automatic MDM Enrollment using Azure AD Usure Credentials

        Can only be ran on Windows 10 Devices, will only run once to enable settings in registry.

#>


#Variables
$intune_keys = Get-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\MDM
$intune_keys_path = 'HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\MDM\'
$AutoEnrollKey = 'AutoEnrollMDM'
$AADCredType = 'UseAADCredentialType'
$test_keys = (Test-Path $intune_keys_path)


"$(Get-Date): Checking for Auto Enrol MDM Keys" | Out-File "$env:TEMP\intune_migration.log" -Append

"$(Get-Date): Getting current key status for Keys" | Out-File "$env:TEMP\intune_migration.log" -Append

if ($test_keys = 'False') 
    {
    "$(Get-Date): Intune Keys Do Not Exist, Creating keys" | Out-File "$env:TEMP\intune_migration.log" -Append 
    New-Item -Path HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\ -Name 'MDM' -Force
    New-ItemProperty -Path $intune_keys_path -Name $AutoEnrollKey -Value 1
    New-ItemProperty -Path $intune_keys_path -Name $AADCredType -Value 1
    }else{"$(Get-Date): Intune Keys Exist, Exiting Scipt" | Out-File "$env:TEMP\intune_migration.log" -Append
} 

    "$(Get-Date): Checking to see if Auto MDM Enrollment is set" | Out-File "$env:TEMP\intune_migration.log" -Append
    
if ($intune_keys.AutoEnrollMDM = 0) 
    {
        "$(Get-Date): Currently not Setup for Auto Enrollment, setting up" | Out-File "$env:TEMP\intune_migration.log" -Append
        Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\MDM -Name AutoEnrollMDM -Value 1 | Out-Null 
    }
    
     
    "$(Get-Date): Validating Enrollment is Under User Credential" | Out-File "$env:TEMP\intune_migration.log" -Append
    
if ($intune_keys.UseAADCredentialType = 0)
    {
        "$(Get-Date): Enrollment Credential is not set to User, correcting" | Out-File "$env:TEMP\intune_migration.log" -Append
        Set-ItemProperty -Path HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\MDM -Name UseAADCredentialType -Value 1 | Out-Null
    }
    
    "$(Get-Date): MDM Enrollment is set to Auto, Exiting" | Out-File "$env:TEMP\intune_migration.log" -Append

