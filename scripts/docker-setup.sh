#!/bin/bash
set -e

echo "=== Docker Development Setup ==="

# Check Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "Error: Docker is not running"
  exit 1
fi

echo "Starting services..."
docker-compose up -d postgres redis

echo "Waiting for PostgreSQL..."
until docker-compose exec -T postgres pg_isready; do
  sleep 1
done

echo "Running migrations..."
bash scripts/db-migrate.sh

echo ""
echo "Services ready:"
echo "  PostgreSQL: localhost:5432"
echo "  Redis:      localhost:6379"
echo ""
echo "Run 'docker-compose logs -f' to view logs"