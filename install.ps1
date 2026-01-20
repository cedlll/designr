$raw = "https://cedlll.github.io/designr/designr.md"
$dirs = @("$env:USERPROFILE\.claude\commands", "$env:USERPROFILE\.cursor\commands")
$countNamespace = "cedlll.github.io"
$countKey = "designr_installs"
$installedOk = $true

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $dest = Join-Path $dir "designr.md"
    try {
        Invoke-WebRequest -Uri $raw -OutFile $dest -ErrorAction Stop
    } catch {
        $installedOk = $false
    }
}

# best-effort install counter (do not fail install if this fails)
if ($installedOk) {
    try {
        $counterUrl = "https://api.countapi.xyz/hit/$countNamespace/$countKey"
        Invoke-RestMethod -Uri $counterUrl -Method Get | Out-Null
    } catch {
        # ignore
    }
}

Write-Host "Installed — restart your tool and run /designr"
