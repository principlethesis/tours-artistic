@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0mobile"

echo ============================================================
echo TOURS ARTISTIC 1.4.1 - BUILD APK ANDROID
echo ============================================================

where node >nul 2>nul || (echo ERRO: Node.js nao encontrado. Instale Node.js 22.13+ & pause & exit /b 1)
where npm >nul 2>nul || (echo ERRO: npm nao encontrado. & pause & exit /b 1)
node -e "const [a,b]=process.versions.node.split('.').map(Number); if(a<22||(a===22&&b<13)) process.exit(1)" || (echo ERRO: Node.js 22.13+ necessario. & pause & exit /b 1)

if not exist package-lock.json (
  echo [1/5] Instalando dependencias...
  call npm install --no-audit --no-fund
  if errorlevel 1 goto :fail
) else (
  echo [1/5] Restaurando dependencias...
  call npm ci --no-audit --no-fund
  if errorlevel 1 goto :fail
)

echo [2/5] Validando Expo...
call npx expo install --check
if errorlevel 1 goto :fail

echo [3/5] Gerando projeto Android nativo...
call npx expo prebuild --clean --platform android
if errorlevel 1 goto :fail

if not exist android\gradlew.bat (
  echo ERRO: Gradle wrapper Android nao foi criado.
  goto :fail
)

echo [4/5] Compilando APK Release...
call android\gradlew.bat assembleRelease
if errorlevel 1 goto :fail

echo [5/5] Localizando APK...
set APK=android\app\build\outputs\apk\release\app-release.apk
if not exist "%APK%" (
  echo ERRO: APK nao encontrado em %APK%
  goto :fail
)

copy /Y "%APK%" "Tours-Artistic-1.4.1-release.apk" >nul

echo.
echo ============================================================
echo APK GERADO COM SUCESSO
echo %CD%\Tours-Artistic-1.4.1-release.apk
echo ============================================================
pause
exit /b 0

:fail
echo.
echo ============================================================
echo BUILD FALHOU
 echo Veja o erro acima e confirme Android SDK/Java/Node.
echo ============================================================
pause
exit /b 1
