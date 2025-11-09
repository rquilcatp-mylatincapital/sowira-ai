# Dockerfile for portal-backend

# Base image
FROM node:20-slim AS base
WORKDIR /app
COPY package.json bun.lockb ./
RUN bun install

# Builder image
FROM base AS builder
WORKDIR /app
COPY . .
RUN bun run build

# Production image
FROM node:20-slim AS production
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000
CMD ["node", "dist/main"]
