# sowira-ai

This is a monorepo for the sowira-ai project, managed with Turborepo and Bun.

## Structure

- `apps/portal-company`: Next.js frontend for companies.
- `apps/portal-talent`: Next.js frontend for talent.
- `apps/portal-backend`: Nest.js backend.
- `packages/ui`: Shared React component library with Storybook.
- `packages/terraform`: Infrastructure as Code for Azure.

## Getting Started

1.  **Install dependencies:**
    ```bash
    bun install
    ```

2.  **Build all apps and packages:**
    ```bash
    bun build
    ```

3.  **Run all apps in development mode:**
    ```bash
    bun dev
    ```

## GitHub Workflows

The `.github/workflows` directory contains the CI/CD pipelines for deploying the applications to Azure.

### Secrets

The following secrets need to be configured in the GitHub repository:

- `DOCKERHUB_USERNAME`: Your Docker Hub username.
- `DOCKERHUB_TOKEN`: Your Docker Hub access token.
- `AZURE_CREDENTIALS`: Your Azure service principal credentials.

## Pre-commit Hooks

This project uses [Husky](https://typicode.github.io/husky/) for pre-commit hooks. Before each commit, [Biome](https://biomejs.dev/) will automatically format and lint the code.

## Commit Message Convention

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification. The commit message should be structured as follows:

```
<type>(<scope>): <description>
```

- **type**: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`.
- **scope**: The name of the package or app being changed (e.g., `portal-company`, `ui`).
- **description**: A short description of the change.

**Examples:**

- `feat(portal-company): add new login page`
- `fix(ui): correct button component styling`
