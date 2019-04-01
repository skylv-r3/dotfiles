if ($Host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
}

function pingt()
{
  Invoke-Command -ScriptBlock { ping $args |%{ "$((Get-Date).ToString())| $_" } } -ArgumentList $args
}
