TOURS ARTISTIC 1.5.4 - STARTUP STABLE

Objetivo: eliminar dependencias nativas desnecessarias do caminho de inicializacao.

Principais mudancas:
- removido expo-secure-store do APK nesta versao;
- authApi usa token em memoria e somente e carregado pela tela de login;
- MVPContext nao importa modulo nativo de autenticacao;
- app.json reduzido ao minimo necessario;
- mantido Expo Router + Hermes;
- perfil EAS continua gerando APK;
- fingerprint automatico desativado.

BUILD:
1. Extraia o ZIP.
2. Abra mobile.
3. Execute BUILD_APK_1_5_4.bat.
4. Instale o APK 1.5.4 depois de desinstalar 1.5.3.

Observacao: login continua sendo real via API HTTPS, mas a sessao nao e persistida entre reinicios nesta versao de diagnostico. Depois que o startup estiver comprovadamente estavel, o armazenamento seguro pode ser reintroduzido isoladamente.
