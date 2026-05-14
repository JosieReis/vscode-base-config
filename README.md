# VS Code Base Config (Neutral & Portable)

This repository is **only** for a neutral VS Code base configuration reusable across multiple macOS work laptops.

It standardizes editor behavior, not user identity.

## Purpose

This repo synchronizes:
- VS Code settings
- keybindings
- snippets
- extension baseline

This repo intentionally does **not** synchronize:
- GitHub login/authentication
- Copilot/Codex/OpenAI/agent configuration
- company-specific tools, endpoints, or policies
- secrets, tokens, or personal/corporate identity data

## Repository Structure

```text
vscode-base-config/
  README.md
  SECURITY.md
  .gitignore
  vscode/
    settings.json
    keybindings.json
    extensions.txt
    snippets/
  scripts/
    bootstrap.sh
    install-extensions.sh
    install-config.sh
```

## Setup (macOS)

```bash
chmod +x scripts/*.sh
./scripts/bootstrap.sh
```

### What happens

1. `scripts/install-config.sh`
   - Copies `settings.json`, `keybindings.json`, and snippets into:
     `~/Library/Application Support/Code/User`
   - Creates timestamped backups before replacing existing files.
2. `scripts/install-extensions.sh`
   - Installs extensions listed in `vscode/extensions.txt`
   - Skips safely if `code` CLI is unavailable.

## Security boundary

This repository synchronizes the **editor environment only**.

Copilot, Codex, GitHub login, agents, SSO, and any company-specific tooling must be configured **locally per machine/profile** and are intentionally excluded.
