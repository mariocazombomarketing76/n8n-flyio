# Base: imagem oficial do n8n, leve e estável
FROM n8nio/n8n:latest

# Variáveis essenciais para Fly.io e n8n
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_USER_FOLDER=/home/node/.n8n
ENV WEBHOOK_URL=https://n8n-mario.fly.dev/
ENV GENERIC_TIMEZONE=America/Luanda

# Limitar memória usada pelo Node.js (importante para plano free)
ENV NODE_OPTIONS="--max-old-space-size=256"

# Criar pasta para dados e ajustar permissões
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Expor porta do n8n
EXPOSE 8080

# Rodar como usuário node (evita problemas de permissão)
USER node

# Comando padrão para iniciar n8n
CMD ["n8n", "start", "--tunnel"]

