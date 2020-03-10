<#
Author: Alexander Marrero
Script to query AD for First last and SamAccountName from a list of Emails
Please fill input and out put variables
#>


 $Email_list = "<Path to input>.txt"

 $Output_csv = "<Path to Output>.csv"


Get-Content -Path $Email_list |
 ForEach-Object{ Get-ADUser -Filter {EmailAddress -eq $_} } | 
  ForEach-Object {new-object psobject -Property @{
                                     'First Name' = $_.GivenName
                                     'Last Name' = $_.SurName
                                     'Login ID'    = $_.SamAccountName                                   
                                     }
   } |
     Export-CSV -Path  $Output_csv -NoTypeInformation

  
