# Dockerfile for portal-company

# Base image for building the frontend
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
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000
CMD ["bun", "start"]
