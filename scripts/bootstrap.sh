#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This bootstrap is macOS-focused and exits on non-macOS systems."
  exit 0
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

"$ROOT_DIR/scripts/install-config.sh"
"$ROOT_DIR/scripts/install-extensions.sh"

echo "Bootstrap complete."
