#Disable user accounts that have not been used to logon with in 30 or more days

Get-ADUser -Filter {Enabled -eq $true} -Properties Name, SamAccountName, LastLogonDate | 
    Where {($_.LastLogonDate -lt (Get-Date).AddDays(-30)) -and ($_.LastLogonDate -ne $NULL)} | 
        Sort | Select Name, SamAccountName, LastLogonDate