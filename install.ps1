$raw = "https://cedlll.github.io/designr/designr.md"
$dirs = @("$env:USERPROFILE\.claude\commands", "$env:USERPROFILE\.cursor\commands")

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $dest = Join-Path $dir "designr.md"
    Invoke-WebRequest -Uri $raw -OutFile $dest
}

Write-Host "Installed — restart your tool and run /designr"
