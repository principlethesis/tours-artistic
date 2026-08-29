Set-Location "$PSScriptRoot\mobile"
npm install --no-audit --no-fund
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host ""
Write-Host "APK na nuvem: npx eas login; npm run build:apk"
Write-Host "Build local: npm run android:local (requer Android SDK)"
