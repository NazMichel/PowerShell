Param(
    [string]$CsvFilePath = '.\BulkUsers.csv'
)

Import-Module ActiveDirectory

$users = Import-Csv -Path $CsvFilePath

foreach ($user in $users) {
    $firstName = $user.FirstName
    $lastName = $user.LastName
    $samAccountName = $user.SamAccountName
    $userPrincipalName = $user.UserPrincipalName
    $ou = $user.OrganizationalUnit

    $securePassword = ConvertTo-SecureString -String "DefaultPassword123!" -AsPlainText -Force

    $newUser = @{
        Name             
        GivenName       = "$firstName $lastName"
        Surname         = $lastName
        SamAccountName  = $samAccountName
        UserPrincipal   = $userPrinciaplName
        AccountPassword = $securePassword
        Path            = $ou
        Enabled         = $true
        ChangePasswordAtLogon = $true
    }
    
    New-ADUser @newUser
}