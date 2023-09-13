#Create list of computers with a particular operating system installed

$CompName = (Get-ADComputer -Filter *).Name

Get-ADComputer -Filter ('Name -like "{0}"' -f $CompName) -Properties OperatingSystem

#Get-ADComputer -Filter 'OperatingSystem -like "*"' -Properties OperatingSystem | Sort OperatingSystem, Name | Format-Table Name, OperatingSystem -AutoSize
