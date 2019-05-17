function Start-Appx([String]$appxPkgName, [String]$appID = "")
{
  $appxPkg = Get-AppxPackage $appxPkgName

  if($appxPkg -eq $null){
    Write-Warning "Application Package ""$appxPkgName"" was not found!"
    return;
  }

  if($appxPkg.GetType() -eq [Microsoft.Windows.Appx.PackageManager.Commands.AppxPackage]){
    $pkgFamilyName = $appxPkg.PackageFamilyName
    $apps = ($appxPkg | Get-AppxPackageManifest).Package.Applications.Application

    if($apps.GetType() -eq [System.Xml.XmlElement]){
      Start-Process "shell:AppsFolder\$pkgFamilyName!$($apps.ID)"
    }else{
      if($appID -eq ""){
        Write-Warning "This application package has several application!"
        Write-Output $apps.ID
      }else{
        $apps | ?{ $_.ID -like $appID } | %{ Start-Process "shell:AppsFolder\$pkgFamilyName!$($_.ID)" }
      }
    }

  }else{
    Write-Warning "Application Package Name ""$appxPkgName"" is ambiguous!"
    Write-Output $appxPkg.Name
  }
}

if($args.Length -gt 0){
  Invoke-Command -ArgumentList $args -ScriptBlock ${function:Start-Appx}
}
