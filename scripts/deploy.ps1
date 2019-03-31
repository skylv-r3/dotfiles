# deploy script for windows
# Require: SeCreateSymbolicLinkPrivilege

function Deploy-Dotfiles()
{
  Param(
    [string]$dotfilesDirPath = "./",
    [string]$dotfilesPattern = ".*",
    [string]$targetDirPath = "$HOME"
  )

  Push-Location
  Set-Location $dotfilesDirPath

  Get-Item "$dotfilesPattern" |%{
    if(Test-Path (Join-Path $targetDirPath "$($_.Name)")){
      Write-Host "already exists: $_"
      return;
    }
    New-Item -ItemType SymbolicLink -Path $targetDirPath -Name "$($_.Name)" -Value "$_"
  }

  Pop-Location
}

# BEGIN
Set-Location (Split-Path $PSScriptRoot -Parent)

# neovim
$nvimDirPath = "$env:LOCALAPPDATA\nvim"

if(!(Test-Path $nvimDirPath)){
  New-Item -ItemType Directory $nvimDirPath
}

Deploy-Dotfiles "./nvim" "*.vim" $nvimDirPath


# PowerShell
$PSProfileDirPath = Split-Path $Profile -Parent
$PSProfileFileName = Split-Path $Profile -Leaf

Deploy-Dotfiles "./WindowsPowerShell" "*.ps1" $PSProfileDirPath


# Other dotfiles
Deploy-Dotfiles


# END
Read-Host "pause"
