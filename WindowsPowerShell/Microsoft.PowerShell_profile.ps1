if ($Host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
}

function pingt()
{
  Invoke-Command -ScriptBlock { ping $args |%{ "$((Get-Date).ToString())| $_" } } -ArgumentList $args
}

function su
{
  Start-Process powershell.exe -Verb RunAs -ArgumentList '-NoExit', '-Command', ('Set-Location ' + $(Get-Location))
}

function famima()
{
# PowerShell‚Å–^ƒRƒ“ƒrƒj‚Ì“ü“X‰¹‚Û‚¢‰¹ - Segmentation Fault
# https://www.segmentation-fault.xyz/entry/2017/02/17/225921
# a certain convenience store

[Console]::Beep(1479, 400) # F#5
[Console]::Beep(1174, 400) # D5
[Console]::Beep(880,  400) # A4
[Console]::Beep(1174, 400) # D5
[Console]::Beep(1318, 400) # E5
[Console]::Beep(1760,1000) # A5

[Console]::Beep(1318, 400) # E5
[Console]::Beep(1479, 400) # F#5
[Console]::Beep(1318, 400) # E5
[Console]::Beep(880,  400) # A4
[Console]::Beep(1174,1000) # D5
}
