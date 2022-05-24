Param (
    [Parameter(Mandatory = $true)]
    [string]
    $AzureUserName,

    [string]
    $AzurePassword,

    [string]
    $AzureTenantID,

    [string]
    $AzureSubscriptionID,

    [string]
    $ODLID,

    [string]
    $DeploymentID,

    [string]
    $vmAdminUsername,
)

#Download git repository
New-Item -ItemType directory -Path C:\AllFiles
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://codeload.github.com/CloudLabs-MOC/DA-100-Analyzing-Data-with-Power-BI/zip/refs/heads/prod-rcc","C:\AllFiles\AllFiles.zip")


#unziping folder
function Expand-ZIPFile($file, $destination)
{
$shell = new-object -com shell.application
$zip = $shell.NameSpace($file)
foreach($item in $zip.items())
{
$shell.Namespace($destination).copyhere($item)
}
}
Expand-ZIPFile -File "C:\AllFiles\AllFiles.zip" -Destination "C:\AllFiles\"

Move-Item -Path C:\AllFiles\DA-100-Analyzing-Data-with-Power-BI-master\Allfiles\DA-100-Allfiles -Destination C:\ -Force

