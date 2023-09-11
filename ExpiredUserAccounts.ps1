#Get a list of expired AD account

Search-ADAccount -AccountExpired -UsersOnly | Select-Object Name, sAMAccountName, DistinguishedName, AccountExpirationDate