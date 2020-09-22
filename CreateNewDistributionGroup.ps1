#CreateNewDistributionGroup
#and adds members to it 
    #Author: Lenny K
    #Date: 9/21/20
    
$GroupName = Read-Host -Object 'Enter name of the group'
$Credential = Get-Credential ''
New-ADGroup -Name $GroupName -GroupScope Global -Credential $Credential -GroupCategory Distribution -Path "OU=Distribution,OU=Groups,OU=Mill Steel,DC=Millsteel,DC=Local"
Add-ADGroupMember -Identity "$GroupName" -Credential $Credential