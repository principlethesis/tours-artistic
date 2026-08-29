@echo off
setlocal
title TOURS ARTISTIC - GERADOR DEFINITIVO DE APK
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\gerar-apk-definitivo.ps1"
set "RC=%ERRORLEVEL%"
echo.
if not "%RC%"=="0" (
  echo ============================================
  echo BUILD FALHOU - CODIGO %RC%
  echo ============================================
) else (
  echo ============================================
  echo BUILD CONCLUIDO COM SUCESSO
  echo ============================================
)
pause
exit /b %RC%
