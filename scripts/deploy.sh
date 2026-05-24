#!/bin/bash
set -e

echo '=== Building project ==='
npm run build

echo '=== Running tests ==='
npm test

echo '=== Deploying ==='
if [ "$1" = '--prod' ]; then
  echo 'Deploying to production...'
  npm run deploy:prod
else
  echo 'Deploying to staging...'
  npm run deploy:staging
fi

echo 'Done!'