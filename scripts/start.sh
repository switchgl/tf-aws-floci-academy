#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
touch "$ROOT/.progress.json"
[[ -s "$ROOT/.progress.json" ]] || echo '{}' > "$ROOT/.progress.json"
mkdir -p "$ROOT/data/floci" "$ROOT/workspaces"
if [[ -f "$ROOT/vendor/images/floci.tar" ]]; then
  if ! docker image inspect floci/floci:latest >/dev/null 2>&1; then
    docker load -i "$ROOT/vendor/images/floci.tar"
  fi
fi
docker compose up -d --build
echo "Portal  : http://localhost:8080"
echo "Floci   : http://localhost:4566"
