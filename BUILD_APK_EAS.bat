@echo off
setlocal
cd /d "%~dp0mobile"
echo ============================================================
echo TOURS ARTISTIC 1.4.1 - BUILD APK VIA EAS
 echo ============================================================
where node >nul 2>nul || (echo Node.js nao encontrado.&pause&exit /b 1)
call npm install --no-audit --no-fund
if errorlevel 1 goto fail
call npx eas-cli@latest login
if errorlevel 1 goto fail
call npx eas-cli@latest build --platform android --profile preview
if errorlevel 1 goto fail
echo.
echo O EAS exibira o link para baixar o APK.
pause
exit /b 0
:fail
echo Build EAS falhou.
pause
exit /b 1
