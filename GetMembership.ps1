$OutputLocation = 'C:\Temp\TechOps_Groups'

$users = get-content -Path 'C:\Temp\TechOps_Groups\SamAcctNames.txt' 

ForEach ($user in $users) 
        {
            <# 
            Get the AD Groups associated with the associate. 
            Pipe results to Get AD Groups. 
            Get all properties. 
            select Name and description. 
            Output to a csv file
            #>
            Get-ADPrincipalGroupMembership $User | Get-ADGroup -Properties * | Select-Object Name, Description | Export-Csv "$OutputLocation\$User_Results.csv" -NoTypeInformation
        }