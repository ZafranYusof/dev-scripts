#!/bin/bash
# Dev environment setup
echo 'Installing dependencies...'
npm install
echo 'Running linter...'
npm run lint
echo 'Done!'