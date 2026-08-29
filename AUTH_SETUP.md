# Tours Artistic 1.5.0 — autenticação real

O APK agora tem **cadastro e login reais**, mas uma conta real precisa de um backend acessível pela internet. O aplicativo não pode conectar diretamente ao PostgreSQL.

### Fluxo
APK → HTTPS API → PostgreSQL

### Cadastro
- Fã ou Artista
- Nome, e-mail e senha
- E-mail único
- Senha mínima de 8 caracteres
- Hash da senha no servidor (bcrypt)
- JWT de 30 dias
- Token armazenado no Android com SecureStore
- Sessão restaurada automaticamente ao abrir o app

### Backend
1. Crie um PostgreSQL.
2. Execute `database/schema.sql`.
3. Em `backend/`, copie `.env.example` para `.env`.
4. Defina `DATABASE_URL` e `JWT_SECRET`.
5. Execute `npm install` e `npm start`.
6. Publique o backend em HTTPS.

Para criar um administrador:
`node src/create-admin.js "Administrador" admin@seudominio.com "SENHA-FORTE"`

### APK
1. No `mobile/`, execute `CONFIGURAR_E_BUILD_AUTH.bat`.
2. Informe a URL HTTPS pública da API.
3. O script grava `mobile/.env` e inicia o EAS.

**Nunca coloque `DATABASE_URL` ou `JWT_SECRET` no APK.**
