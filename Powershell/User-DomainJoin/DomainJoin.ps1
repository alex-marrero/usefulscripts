#Required Variables
$domain = #<DomainName>
$password = #<Password, please dont leave in Plain text>
$username = #<ServiceAccount>
$OUPath = #OU Path
$pathtoStartDJ = #path to Start DJ Batch Script
$pathtoDJscript = #path to Domain join Script    

#Do Not Update
$credential = New-Object System.Management.Automation.PSCredential($username,$password)

Add-Computer -DomainName $domain -Credential $credential -OUPath $OUPath

#Cleanup Scripts

Remove-Item -path $pathtoStartDJ

Remove-Item -path $pathtoDJscript