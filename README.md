# dev-scripts

> Collection of shell scripts for development workflow automation.

## Scripts

| Script | Description |
|--------|-------------|
| `scripts/dev-setup.sh` | Install dependencies and run linter |
| `scripts/test-runner.sh` | Run tests with coverage report |
| `scripts/deploy.sh` | Build and deploy to production |
| `scripts/db-migrate.sh` | Run database migrations |

## Usage

```bash
# Make scripts executable
chmod +x scripts/*.sh

# Run setup
./scripts/dev-setup.sh

# Run tests
./scripts/test-runner.sh
```

## Requirements

- Bash 4.0+
- Node.js 18+
- npm or yarn

## Adding New Scripts

1. Create script in `scripts/` directory
2. Add shebang line `#!/bin/bash`
3. Make executable: `chmod +x scripts/your-script.sh`
4. Document in this README

## License

MIT