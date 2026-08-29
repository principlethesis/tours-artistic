@echo off
setlocal EnableExtensions
chcp 65001 >nul
color 0A
title TOURS ARTISTIC 1.4.1 - GERAR APK AUTOMATICAMENTE

cd /d "%~dp0mobile"
set "ROOT=%~dp0"
set "LOG=%ROOT%BUILD_APK_LOG.txt"

echo ============================================================
echo TOURS ARTISTIC 1.4.1 - GERADOR AUTOMATICO DE APK
echo ============================================================
echo.
echo Este arquivo vai:
echo  1. Verificar Node.js
echo 2. Instalar dependencias npm (se necessario)
echo  3. Verificar login no Expo/EAS
echo  4. Fazer login no navegador somente se necessario
echo  5. Enviar o projeto para o EAS
echo 6. Gerar um APK Android usando o perfil preview
echo  7. Mostrar o link do APK quando o build terminar
echo.

echo [%date% %time%] INICIO > "%LOG%"

where node >nul 2>nul
if errorlevel 1 goto :node_error
where npm >nul 2>nul
if errorlevel 1 goto :npm_error

node --version >> "%LOG%" 2>&1
npm --version >> "%LOG%" 2>&1

echo [1/5] Verificando Node.js e dependencias...
if not exist "node_modules" (
    echo node_modules nao encontrado. Instalando dependencias...
    call npm install --no-audit --no-fund
    if errorlevel 1 goto :fail
) else (
    echo node_modules ja existe. Pulando npm install.
)

 echo.
echo [2/5] Verificando login no Expo/EAS...
call npx --yes eas-cli@latest whoami >> "%LOG%" 2>&1
if errorlevel 1 (
    echo Login nao detectado. Abrindo login do Expo no navegador...
    call npx --yes eas-cli@latest login
    if errorlevel 1 goto :fail
) else (
    echo Login EAS ja esta ativo.
)

 echo.
echo [3/5] Validando configuracao do projeto...
call npx --yes expo config --type public >> "%LOG%" 2>&1
if errorlevel 1 goto :config_error

 echo.
echo [4/5] Iniciando build Android APK no EAS...
echo.
echo Se o EAS perguntar para criar/vincular o projeto, escolha SIM.
echo Se perguntar sobre Android Keystore, permita a criacao automatica.
echo.
call npx --yes eas-cli@latest build --platform android --profile preview
if errorlevel 1 goto :fail

 echo.
echo ============================================================
echo BUILD ENVIADO/CONCLUIDO COM SUCESSO
echo ============================================================
echo.
echo O EAS deve mostrar acima o link para o APK.
echo Tambem e possivel acompanhar em https://expo.dev
 echo.
echo Log salvo em:
echo %LOG%
echo.
pause
exit /b 0

:node_error
echo ERRO: Node.js nao encontrado.
echo Instale Node.js 22.13 ou superior e execute novamente.
echo Veja: https://nodejs.org/
echo.>> "%LOG%"
pause
exit /b 1

:npm_error
echo ERRO: npm nao encontrado.
echo Verifique a instalacao do Node.js.
pause
exit /b 1

:config_error
echo ERRO: A configuracao Expo do projeto nao foi validada.
echo Consulte %LOG% para detalhes.
pause
exit /b 1

:fail
echo.
echo ============================================================
echo BUILD NAO CONCLUIDO
echo ============================================================
echo.
echo Consulte o log:
echo %LOG%
echo.
echo Copie as ultimas linhas do erro e envie aqui para correcao.
pause
exit /b 1
