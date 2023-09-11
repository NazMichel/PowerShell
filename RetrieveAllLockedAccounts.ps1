#Retrieve all locked accounts
Search-ADAccount -LockedOut -UsersOnly | Select-Object Name, SamAccountName, DistinguishedName 