<#	
	.NOTES
	===========================================================================
	 Created on:   	4/1/2020
	 Created by:   	Alexander Marero
	 Organization: 	Mednax Services Inc
	 Filename:      Escow_BDE 	
	===========================================================================
	.DESCRIPTION
        Script Looks at all Bitlocker Volumnes if it does not have a RecoveryPassword one will be created. The script then adds each Recovery Password to Azure.

#>


	 "$(Get-Date): Getting all volumes" | Out-File "$env:TEMP\escrowkeys.log" -Append

	Get-BitLockerVolume | where-object { $_.ProtectionStatus -eq "On" -or $_.EncryptionPercentage -gt 0 } | select * | % {
	     "$(Get-Date): Getting all current RecoveryPassword protector IDs for $($_.MountPoint)" | Out-File "$env:TEMP\escrowkeys.log" -Append
	    $protectorIDs = $_.KeyProtector | Where-Object {$_.KeyProtectorType -eq "RecoveryPassword"}
	     "$(Get-Date): Checking to see if we have a RecoveryPassword" | Out-File "$env:TEMP\escrowkeys.log" -Append
	    if ($protectorIDs.count -lt 1) { 
	     "$(Get-Date): No Current Recovery Password Protectors exist, creating one" | Out-File "$env:TEMP\escrowkeys.log" -Append
	    Add-BitLockerKeyProtector -MountPoint $_.MountPoint -RecoveryPasswordProtector | Out-Null 
	     "$(Get-Date): Get the IDs for the new protector" | Out-File "$env:TEMP\escrowkeys.log" -Append
	    $protectorIDs = $(Get-BitlockerVolume -MountPoint $_.MountPoint).KeyProtector | Where-Object {$_.KeyProtectorType -eq "RecoveryPassword"}
	    
	    }
	    "$(Get-Date): Backup each discovered protector ID" | Out-File "$env:TEMP\escrowkeys.log" -Append
	    foreach ($protectorID in $protectorIDs) {
	         "$(Get-Date): Backing up Password" | Out-File "$env:TEMP\escrowkeys.log" -Append
		    BackupToAAD-BitLockerKeyProtector -MountPoint $_.MountPoint -KeyProtectorId $protectorID.KeyProtectorId | Out-File -FilePath C:\Windows\Temp\escrowd -append 

	    }
	}