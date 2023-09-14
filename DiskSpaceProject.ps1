
#$LocalDriveC = Get-PSDrive -Name C

#Get List of computers in a table
$Computers = "LON-CL1","LON-DC1","LON-SVR1"

Foreach($Computer in $Computers){

    
    Get-CimInstance Win32_LogicalDisk -ComputerName $computer | Select-Object PSComputerName,DeviceID,FreeSpace | Where-Object -Property FreeSpace -NE -Value $NULL
    #Write-Host "$Computer" -ForegroundColor Yellow
    }
