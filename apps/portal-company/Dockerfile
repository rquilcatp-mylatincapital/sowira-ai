FROM node:20-slim
WORKDIR /app
RUN npm install -g bun
COPY . .
RUN bun install --frozen-lockfile
RUN bun --filter=@sowira/portal-company run build
WORKDIR /app/apps/portal-company
EXPOSE 3000
CMD ["bun", "start"]
