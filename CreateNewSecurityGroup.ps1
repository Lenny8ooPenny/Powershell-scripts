#CreateNewSecurityGroup
    #and adds members to it 
    #Author: Lenny K
    #Date: 9/21/20
    
    $GroupName = Read-Host -Object 'Enter name of the group'
    $Credential = Get-Credential ''
    New-ADGroup -Name $GroupName -GroupScope Global -Credential $Credential 
    -GroupCategory Security -Path "OU=,OU=,OU=,DC=,DC="
    Add-ADGroupMember -Identity "$GroupName" -Credential $Credential
