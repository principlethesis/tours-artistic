# Tours Artistic 1.4.1 — APK instalável

## O que foi corrigido
- Expo SDK 57 alinhado com React Native 0.86.2.
- Removido `react-native-purchases` do MVP porque não é usado e adiciona dependência nativa desnecessária; pagamentos continuam simulados no MVP.
- Removido `react-native-maps` porque não é usado nas telas atuais; a arquitetura de mapas continua documentada para integração posterior.
- Criado `tsconfig.json` compatível com Expo Router.
- `versionCode` Android = 141.
- Perfil EAS `preview` configurado para produzir **APK**, não AAB.
- Script local para gerar `app-release.apk`.
- Script EAS para gerar APK na nuvem.

## Opção A — gerar APK no Windows
1. Instale Node.js 22.13+.
2. Instale Android Studio e o Android SDK/Platform 36.
3. Configure `ANDROID_HOME` apontando para o Android SDK.
4. Instale Java 17 ou 21.
5. Execute `BUILD_APK.bat`.
6. O arquivo final será:
   `mobile\Tours-Artistic-1.4.1-release.apk`

## Opção B — EAS Cloud
1. Execute `BUILD_APK_EAS.bat`.
2. Faça login na conta Expo quando solicitado.
3. O EAS compilará um APK no perfil `preview`.
4. Use o link exibido pelo EAS para baixar o APK.

## Requisitos Android
O Expo SDK 57 usa React Native 0.86 e Android compile/target SDK 36. O projeto foi alinhado a essa combinação.

## Estado do aplicativo
O APK é um MVP funcional local: login de demonstração, jornadas de fã/artista/admin, feed, artistas, assinaturas simuladas, agenda, eventos, ingressos, carteira, experiências, chat, comunidade, notificações locais e painéis.

Ainda não são serviços de produção: gateway de pagamento real, autenticação remota/MFA, PostgreSQL remoto, chat realtime, push remoto, antifraude e upload de mídia em nuvem.
