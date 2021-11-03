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

$nvimPythonPluginDirPath = "$nvimDirPath\rplugin\python3"
if(!(Test-Path ($nvimPythonPluginDirPath))){
  New-Item -ItemType Directory $nvimPythonPluginDirPath
}

# goneovimを使う限り不要
#Deploy-Dotfiles "./nvim/rplugin/python3" "*.py" $nvimPythonPluginDirPath

# goneovim
$gonvimDirPath = "$HOME\.goneovim"

if(!(Test-Path $gonvimDirPath)){
  New-Item -ItemType Directory $gonvimDirPath
}

Deploy-Dotfiles "./goneovim" "settings.toml" $gonvimDirPath


# PowerShell
$PSProfileDirPath = Split-Path $Profile -Parent
$PSProfileFileName = Split-Path $Profile -Leaf

Deploy-Dotfiles "./WindowsPowerShell" "*.ps1" $PSProfileDirPath


# Other dotfiles
Deploy-Dotfiles


# END
Read-Host "pause"
