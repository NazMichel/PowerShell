#Get Disk Space % on all drives on all computers

$computer = Get-ADComputer -Filter * | Select-Object Name

Get-CimInstance Win32_LogicalDisk -ComputerName $computer.name -Filter DriveType=3 | Select-Object PSComputerName,DeviceID,
    @{'Name'='Free Space (GB)'; 'Expression'={[string]::Format('{0:N0}',[math]::truncate($_.freespace / 1GB))}},
    @{'Name'='% Free'; 'Expression'={[string]::Format('{0:N2}',[math]::truncate($_.freespace) / [math]::truncate($_.size) * 100)}}
