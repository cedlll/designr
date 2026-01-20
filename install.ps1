$raw = "https://cedlll.github.io/designr/rules.md"
$dest = "$env:USERPROFILE\.claude\commands\rules.md"
Invoke-WebRequest -Uri $raw -OutFile $dest
Write-Host "Installed — restart your tool and run /designr"
