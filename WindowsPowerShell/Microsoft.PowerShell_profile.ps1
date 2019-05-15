if ($Host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
}

. ($PSScriptRoot + '\Famima.ps1')
. ($PSScriptRoot + '\Start-Appx.ps1')

. ($PSScriptRoot + '\Alias.ps1')
