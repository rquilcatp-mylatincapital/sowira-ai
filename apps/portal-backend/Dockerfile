# 1. Builder stage
FROM node:20-slim AS builder
WORKDIR /app
RUN npm install -g bun
COPY . .
RUN bun install --frozen-lockfile
RUN bun --filter=@sowira/portal-backend run build

# 2. Production stage
FROM node:20-slim AS production
WORKDIR /app
COPY --from=builder /app .
WORKDIR /app/apps/portal-backend
EXPOSE 3000
CMD ["node", "dist/main"]
