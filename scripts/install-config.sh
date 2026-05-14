#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script is macOS-focused and exits on non-macOS systems."
  exit 0
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_VSCODE_DIR="$ROOT_DIR/vscode"
SRC_SNIPPETS_DIR="$SRC_VSCODE_DIR/snippets"
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
DEST_SNIPPETS_DIR="$VSCODE_USER_DIR/snippets"

mkdir -p "$VSCODE_USER_DIR" "$DEST_SNIPPETS_DIR"

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" ]]; then
    local ts
    ts="$(date +%Y%m%d-%H%M%S)"
    cp "$target" "${target}.bak-${ts}"
    echo "Backed up: $target -> ${target}.bak-${ts}"
  fi
}

backup_if_exists "$VSCODE_USER_DIR/settings.json"
cp "$SRC_VSCODE_DIR/settings.json" "$VSCODE_USER_DIR/settings.json"

backup_if_exists "$VSCODE_USER_DIR/keybindings.json"
cp "$SRC_VSCODE_DIR/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"

for snippet in "$SRC_SNIPPETS_DIR"/*.json; do
  target="$DEST_SNIPPETS_DIR/$(basename "$snippet")"
  backup_if_exists "$target"
  cp "$snippet" "$target"
  echo "Installed snippet: $(basename "$snippet")"
done

echo "VS Code config installation complete."
