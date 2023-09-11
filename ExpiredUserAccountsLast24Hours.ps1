#Get a list of expired AD accounts in the last 24 hours

Search-ADAccount -AccountExpired -UsersOnly | Select-Object Name, sAMAccountName, DistinguishedName, AccountExpirationDate | Where-Object {$_.AccountExpirationDate -ge ((Get-Date).AddDays(-1))}