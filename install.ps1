$raw = "https://cedlll.github.io/designr/designr.md"
$dest = "$env:USERPROFILE\.claude\commands\designr.md"
Invoke-WebRequest -Uri $raw -OutFile $dest
Write-Host "Installed — restart your tool and run /designr"
