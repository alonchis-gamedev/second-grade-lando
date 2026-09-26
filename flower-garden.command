#!/bin/bash
set -e
cd "$(dirname "$0")"
if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
  echo "Install Node.js first: https://nodejs.org/"
  read -r -p "Press Enter to close..." _
  exit 1
fi
if [ ! -d node_modules/@turbowarp/packager ]; then
  npm ci
fi
node build-game.js flower-garden
read -r -p "Press Enter to close..." _
