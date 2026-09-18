#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
docker compose stop floci
rm -rf "$ROOT/data/floci"
mkdir -p "$ROOT/data/floci"
docker compose up -d floci
