function pingt()
{
  Invoke-Command -ScriptBlock { ping $args |%{ "$((Get-Date).ToString())| $_" } } -ArgumentList $args
}

function su
{
  Start-Process powershell.exe -Verb RunAs -ArgumentList '-NoExit', '-Command', ('Set-Location ' + $(Get-Location))
}

