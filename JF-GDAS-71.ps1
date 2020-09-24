#Moves files from one computer to a shared network drive, remotely. Has the function for you enter specific dates automatically or if you want to enter the data your self just add the Read-Host -Object 'enter date' variable. 

$Begin = '09/01/2020'
$End = '09/05/2020'

$DateB = [datetime] $Begin
$DateE = [datetime] $End

$Cred= Get-Credential ""

Invoke-Command -Credential $Cred -ComputerName 71-GDAS -ScriptBlock { Get-ChildItem -Path '\\71-GDAS\c$\Program Files (x86)\AGT400\09' |
Where-Object {$_.CreationTime -ge $using:DateB -and $_.CreationTime -le $using:DateE }} | Copy-Item -Destination '\\msfs1\millsteel\general\gdas\test\'