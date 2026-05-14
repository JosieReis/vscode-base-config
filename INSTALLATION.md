# Installation Guide (macOS)

## 1) Introduction

This repository provides a **neutral VS Code base configuration** for macOS laptops.

It configures:
- editor/workbench settings
- keybindings
- snippets
- extension baseline

It intentionally does **not** configure or synchronize:
- GitHub login
- Copilot/Codex/OpenAI agents
- SSH keys
- VPN
- company-specific tooling
- VS Code Settings Sync

Repository philosophy: **synchronize environment, not identity**.

## 2) Prerequisites

Before setup:
1. Install VS Code on your Mac.
2. Enable the VS Code `code` command in PATH:
   - Open VS Code
   - Open Command Palette (`Cmd+Shift+P`)
   - Run: `Shell Command: Install 'code' command in PATH`

## 3) Clone repository

```bash
git clone <REPO_URL>
cd vscode-base-config
```

## 4) Make scripts executable

```bash
chmod +x scripts/*.sh
```

## 5) Run setup

```bash
./scripts/bootstrap.sh
```

`bootstrap.sh` will:
- copy `settings.json` and `keybindings.json`
- copy snippets
- create timestamped backups before overwriting existing files
- install extensions from `vscode/extensions.txt` (when `code` CLI is available)

## 6) Verify installation

Use this quick checklist:
- [ ] VS Code theme is applied
- [ ] Icon theme is applied
- [ ] Extensions from `vscode/extensions.txt` are installed
- [ ] Snippets are available in TypeScript/React/Markdown files
- [ ] Settings are loaded (format on save, editor defaults, etc.)
- [ ] GitHub login state is unchanged
- [ ] Copilot/Codex/OpenAI configuration is unchanged

## 7) Local machine customization

For machine- or company-specific needs:
- keep company-specific settings local on that machine
- install AI tools (Copilot/Codex/OpenAI/etc.) manually per machine/profile if needed
- do not commit auth/account-related configuration

If you make local edits in this repo, review before committing:

```bash
git diff
git diff --staged
```

## 8) Troubleshooting

### `code` command not found
- Re-run Command Palette action: `Shell Command: Install 'code' command in PATH`
- Restart terminal and check:

```bash
which code
```

### Permission denied on scripts
Run:

```bash
chmod +x scripts/*.sh
```

### VS Code settings not updating
- Close VS Code and run `./scripts/bootstrap.sh` again.
- Confirm target directory exists:

```bash
ls "$HOME/Library/Application Support/Code/User"
```

- Check for backup files (`*.bak-*`) indicating replacement occurred.

### Extension installation issues
- Ensure `code` CLI works:

```bash
code --version
```

- Install one extension manually to test:

```bash
code --install-extension esbenp.prettier-vscode --force
```

## 9) Security reminders

- Never commit secrets or tokens.
- Never commit company-specific settings.
- Never commit VS Code runtime storage (`workspaceStorage`, `globalStorage`, `storage.json`).
- Always review `git diff` before committing.
