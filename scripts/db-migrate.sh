#!/bin/bash
set -e

DB_URL=${DATABASE_URL:-"postgresql://localhost:5432/myapp"}

echo "=== Database Migration ==="
echo "Target: $DB_URL"
echo ""

if [ "$1" = "--rollback" ]; then
  echo "Rolling back last migration..."
  npx knex migrate:rollback --knexfile knexfile.js
else
  echo "Running pending migrations..."
  npx knex migrate:latest --knexfile knexfile.js
fi

echo ""
echo "Current migration status:"
npx knex migrate:status --knexfile knexfile.js
echo ""
echo "Done!"