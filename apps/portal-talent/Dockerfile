# 1. Base image
FROM node:20-slim AS base
WORKDIR /app
RUN npm install -g bun turbo

# 2. Pruner
# Get the full project needed to build the app
FROM base AS pruner
WORKDIR /app
COPY . .
RUN turbo prune --scope=@sowira/portal-talent --docker

# 3. Builder
# Build the app using the pruned project
FROM base AS builder
WORKDIR /app

# Copy the pruned files
COPY --from=pruner /app/out/json/ .
COPY --from=pruner /app/out/bun.lock ./bun.lock
COPY --from=pruner /app/out/full/ .

# Install dependencies
RUN bun install --frozen-lockfile

# Build the application
RUN turbo run build --filter=@sowira/portal-talent

# 4. Runner
FROM node:20-slim AS runner
WORKDIR /app
RUN npm install -g bun

# Copy the standalone output from the builder
COPY --from=builder /app/apps/portal-talent/.next/standalone ./
COPY --from=builder /app/apps/portal-talent/.next/static ./apps/portal-talent/.next/static
COPY --from=builder /app/apps/portal-talent/public ./apps/portal-talent/public

EXPOSE 3000
CMD ["node", "apps/portal-talent/server.js"]
