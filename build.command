#!/bin/bash
set -e
cd "$(dirname "$0")"

# Keep the Terminal window open so errors and the output path stay visible.
finish() {
  if [ -t 0 ]; then
    echo
    read -r -p "Press Enter to close..." _
  fi
}
trap finish EXIT

shopt -s nullglob
games=( *.sb3 )
if [ ${#games[@]} -eq 0 ]; then
  echo "No .sb3 games found in this folder."
  exit 1
fi

echo "Choose a game to build:"
for ((i = 0; i < ${#games[@]}; i++)); do
  printf '%2d) %s\n' "$((i + 1))" "${games[i]%.sb3}"
done
echo

while true; do
  read -r -p "Game number (or q to quit): " choice || exit 0
  if [ "$choice" = q ] || [ "$choice" = Q ]; then
    exit 0
  fi
  if [[ "$choice" =~ ^[0-9]+$ ]]; then
    number=$((10#$choice))
    if [ "$number" -ge 1 ] && [ "$number" -le "${#games[@]}" ]; then
      break
    fi
  fi
  echo "Please enter a number from 1 to ${#games[@]}."
done

if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
  echo "Install Node.js first: https://nodejs.org/"
  exit 1
fi
if [ ! -d node_modules/@turbowarp/packager ]; then
  npm ci
fi

game="${games[number - 1]%.sb3}"
node build-game.js "$game"
