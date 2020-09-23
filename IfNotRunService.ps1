$ServiceName = 'nameofservice'
$arrService = Get-Service -Name $ServiceName
$ServiceNameExe = 'C:\Program Files (x86)\Path\NameofService.exe'
while ($arrService.Status -ne 'Running')
{

    Start-Process $ServiceNameExe
    write-host $arrProcess.status
    write-host 'Service starting'
    Start-Sleep -seconds 20
    $arrService.Refresh()
    if ($arrService.Status -eq 'Running')
    {
        Write-Host 'Service is now Running'
    }

}
