#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

MODE="${1:-release}"

case "$MODE" in
  dev)
    echo "Docs mode: dev (sphinx-autobuild)"
    uv run sphinx-autobuild docs docs/_build/html --host 127.0.0.1 --port 8000
    ;;
  release)
    echo "Docs mode: release (sphinx-build)"
    uv run sphinx-build -b html docs docs/_build/html
    ;;
  *)
    echo "Usage: $0 [dev|release]" >&2
    exit 1
    ;;
esac
