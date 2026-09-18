#!/usr/bin/env bash
set -euo pipefail
LAB_ID="${1:-}"
[[ -n "$LAB_ID" ]] || { echo "Usage: $0 <lab-id>" >&2; exit 1; }
curl -fsS "http://localhost:8080/api/labs/${LAB_ID}/check"
echo
