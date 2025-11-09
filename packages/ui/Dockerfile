# Dockerfile for ui storybook

# Build image
FROM node:20-slim AS builder
WORKDIR /app
COPY package.json bun.lockb ./
RUN bun install
COPY . .
RUN bun run build-storybook

# Production image
FROM nginx:stable-alpine
COPY --from=builder /app/storybook-static /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
