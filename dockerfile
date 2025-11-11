FROM node:22 AS builder 
RUN npm install -g pnpm
WORKDIR /app
COPY *.json ./
RUN pnpm install
COPY . .

FROM node:22-slim
#version miniamle de node sans les outils de build donc on va copier ce qui est necessaire pour lancer l'app mais c tout
RUN corepack enable
#pour utiliser pnpm 
# RUN addgroup --gid 1001 appgroup && adduser --uid 1001 --gid 1001 --disabled-password appuser 
# pour créer user non root 
WORKDIR /app
COPY --from=builder /app /app
# RUN chown -R appuser:appgroup /app
# USER appuser
EXPOSE 3000
# CMD [ "pnpm", "dev", "--host", "0.0.0.0"]
CMD ["sh", "-c", "pnpm db:push && pnpm dev --host 0.0.0.0"]
# pnmp db:push pour creer la table todos de la bdd 