<#
Author: Alexander Marrero
Script to query AD for First last and SamAccountName from a list of Emails
Please fill input and out put variables
#>


$Email_list = '<Add Path for input>'

$Output_csv = '<Add Path for output>'


Get-Content -Path $Email_list |
ForEach-Object{ Get-ADUser -Filter {EmailAddress -eq $_} } | 
 ForEach-Object {new-object psobject -Property @{
                                    'Login ID'    = $_.SamAccountName                                   
                                    }
  } |
    Out-File $Output_csv
