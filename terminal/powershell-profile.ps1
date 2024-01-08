using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# comment after first run
if ($host.Name -eq 'ConsoleHost')
{
    Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

    Install-Module -Name Terminal-Icons -Repository PSGallery

    winget install JanDeDobbeleer.OhMyPosh
}

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Import-Module -Name Terminal-Icons

$searchText = "oh-my-posh --init --shell pwsh --config D\source\public\terminal\ohmyposh-config.json | Invoke-Expression"

Write-Host "Using profile file '$PROFILE'"
if(-Not (Test-Path $PROFILE)) {
    Write-Host "Creating $PROFILE file"
    New-Item -ItemType File -Path $PROFILE
}
if((Get-Content $PROFILE) -notcontains $searchText) {
    Write-Host "Appending '$searchText'"
    Add-Content $PROFILE $searchText
}
