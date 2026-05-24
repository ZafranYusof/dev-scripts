<div align="center">

# dev-scripts

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/shell-bash%204.0%2B-green)](https://www.gnu.org/software/bash/)
[![ShellCheck](https://img.shields.io/badge/linted%20with-shellcheck-blue)](https://www.shellcheck.net/)

Battle-tested shell scripts for automating your development workflow. Setup, test, deploy, migrate - all in one place.

[Scripts](#available-scripts) | [Quick Start](#quick-start) | [Customization](#customization) | [Contributing](./CONTRIBUTING.md)

</div>

---

## Philosophy

Every project needs the same scripts: setup the environment, run tests, deploy, migrate the database. Instead of rewriting them every time, use `dev-scripts` as a starting point and customize.

**Principles:**
- **Fail fast** - `set -e` everywhere, no silent failures
- **Verbose** - Echo what's happening so you can debug
- **Idempotent** - Safe to run multiple times
- **Portable** - Works on macOS and Linux (CI-friendly)

## Quick Start

```bash
# Clone into your project
git clone https://github.com/RaizenXxx/dev-scripts.git scripts/
rm -rf scripts/.git

# Or cherry-pick what you need
curl -O https://raw.githubusercontent.com/RaizenXxx/dev-scripts/main/scripts/dev-setup.sh
chmod +x dev-setup.sh
```

## Available Scripts

| Script | Purpose | Dependencies |
|--------|---------|--------------|
| [`dev-setup.sh`](#dev-setupsh) | Install deps + run linter | Node.js, npm |
| [`test-runner.sh`](#test-runnersh) | Run tests with coverage | Jest/Mocha |
| [`deploy.sh`](#deploysh) | Build + deploy (staging/prod) | Docker (optional) |
| [`db-migrate.sh`](#db-migratesh) | Run/rollback DB migrations | Knex.js |
| [`docker-setup.sh`](#docker-setupsh) | Spin up dev services | Docker, docker-compose |

## Script Details

### `dev-setup.sh`

Sets up a fresh development environment from scratch.

```bash
./scripts/dev-setup.sh
```

**What it does:**
1. Checks Node.js version (requires 18+)
2. Installs npm dependencies
3. Copies `.env.example` to `.env` if missing
4. Runs linter to verify setup
5. Prints success message with next steps

### `test-runner.sh`

Runs your test suite with coverage reporting.

```bash
./scripts/test-runner.sh           # Run all tests
./scripts/test-runner.sh --watch   # Watch mode
./scripts/test-runner.sh --ci      # CI mode (no colors, coverage report)
```

**What it does:**
1. Checks test framework is installed
2. Runs full test suite
3. Generates coverage report
4. Fails if coverage drops below threshold (configurable)

### `deploy.sh`

Build and deploy your application.

```bash
./scripts/deploy.sh              # Deploy to staging (default)
./scripts/deploy.sh --prod       # Deploy to production
./scripts/deploy.sh --dry-run    # Show what would happen
```

**What it does:**
1. Runs tests (aborts if failing)
2. Builds the project
3. Tags the release (production only)
4. Deploys to target environment
5. Runs smoke tests post-deploy

### `db-migrate.sh`

Database migration management.

```bash
./scripts/db-migrate.sh              # Run pending migrations
./scripts/db-migrate.sh --rollback   # Rollback last migration
./scripts/db-migrate.sh --status     # Show migration status
```

### `docker-setup.sh`

Spin up development services (PostgreSQL, Redis, etc).

```bash
./scripts/docker-setup.sh          # Start all services
./scripts/docker-setup.sh --reset  # Destroy and recreate volumes
```

**Services started:**
- PostgreSQL 15 on port 5432
- Redis 7 on port 6379
- Runs migrations after DB is ready

## Customization

### Environment Variables

All scripts respect these env vars:

| Variable | Default | Description |
|----------|---------|-------------|
| `NODE_ENV` | `development` | Target environment |
| `DATABASE_URL` | `postgresql://localhost:5432/myapp` | Database connection |
| `COVERAGE_THRESHOLD` | `80` | Minimum test coverage % |
| `DEPLOY_TARGET` | `staging` | Default deploy target |

### Makefile Integration

```makefile
.PHONY: setup test deploy

setup:
	@bash scripts/dev-setup.sh

test:
	@bash scripts/test-runner.sh

deploy:
	@bash scripts/deploy.sh

deploy-prod:
	@bash scripts/deploy.sh --prod
```

## CI/CD Integration

### GitHub Actions

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: bash scripts/dev-setup.sh
      - run: bash scripts/test-runner.sh --ci
```

### GitLab CI

```yaml
test:
  script:
    - bash scripts/dev-setup.sh
    - bash scripts/test-runner.sh --ci
```

## FAQ

**Q: Can I use these with yarn/pnpm?**
A: Yes! Set `PKG_MANAGER=yarn` or `PKG_MANAGER=pnpm` env var.

**Q: Do these work on Windows?**
A: Use WSL2 or Git Bash. Native Windows is not supported.

**Q: How do I add a new script?**
A: See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

## License

[MIT](./LICENSE) - Use these scripts in any project, commercial or open source.