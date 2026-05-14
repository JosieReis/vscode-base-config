#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script is macOS-focused and exits on non-macOS systems."
  exit 0
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXTENSIONS_FILE="$ROOT_DIR/vscode/extensions.txt"

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI ('code') not found."
  echo "Install VS Code and enable: Shell Command: Install 'code' command in PATH"
  echo "Skipping extension installation."
  exit 0
fi

while IFS= read -r extension || [[ -n "$extension" ]]; do
  [[ -z "$extension" ]] && continue
  [[ "$extension" =~ ^# ]] && continue
  code --install-extension "$extension" --force
  echo "Ensured extension installed: $extension"
done < "$EXTENSIONS_FILE"

echo "Extension installation complete."
