# Contributing

Thanks for your interest in contributing!

## Adding a New Script

1. Create your script in the `scripts/` directory
2. Add a shebang line: `#!/bin/bash`
3. Add `set -e` for fail-fast behavior
4. Make it executable: `chmod +x scripts/your-script.sh`
5. Add an entry in the Makefile
6. Update README.md with documentation
7. Run `shellcheck scripts/your-script.sh` to lint

## Guidelines

- Use descriptive echo statements so users know what's happening
- Support `--help` flag for complex scripts
- Use environment variables with sensible defaults
- Exit with non-zero code on failure
- Test on both macOS and Linux

## Pull Requests

- One script per PR
- Include usage examples in PR description
- Ensure shellcheck passes with no warnings