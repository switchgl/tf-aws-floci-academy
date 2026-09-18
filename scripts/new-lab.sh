#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LAB_ID="${1:-}"
if [[ -z "$LAB_ID" ]]; then
  echo "Usage: $0 <lab-id>"
  find "$ROOT/labs" -mindepth 1 -maxdepth 1 -type d -printf "  %f\n" | sort
  exit 1
fi
SRC="$ROOT/labs/$LAB_ID"
DST="$ROOT/workspaces/$LAB_ID"
[[ -d "$SRC" ]] || { echo "Unknown lab: $LAB_ID" >&2; exit 1; }
mkdir -p "$DST"
if [[ -d "$SRC/starter" ]]; then
  find "$SRC/starter" -maxdepth 1 -type f | while read -r f; do
    base="$(basename "$f")"
    [[ -e "$DST/$base" ]] || cp "$f" "$DST/$base"
  done
  if [[ -d "$SRC/starter/src" && ! -d "$DST/src" ]]; then
    cp -R "$SRC/starter/src" "$DST/src"
  fi
  if [[ -d "$SRC/starter/modules" && ! -d "$DST/modules" ]]; then
    cp -R "$SRC/starter/modules" "$DST/modules"
  fi
fi
cp "$ROOT/shared/floci.tf" "$DST/floci.tf"
cp "$ROOT/shared/versions.tf" "$DST/versions.tf"
echo "Workspace ready: $DST"
