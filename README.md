# VS Code Base Config (Neutral & Portable)

This repository is **only** for a neutral VS Code base configuration that can be reused across multiple macOS work laptops.

It is intentionally focused on editor environment consistency, not identity:
- It synchronizes editor behavior, keybindings, snippets, and extension baseline.
- It does **not** configure personal/company identity, account auth, or AI assistant logins.

## Scope

Included:
- VS Code settings
- VS Code keybindings
- VS Code snippets
- VS Code extension baseline
- macOS-focused install scripts for VS Code config and extensions

Excluded on purpose:
- GitHub login/auth setup
- Copilot/Codex/OpenAI/agent setup
- company-specific tools or settings
- shell profile/terminal dotfile setup

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
      typescript.json
      react.json
      markdown.json
  scripts/
    bootstrap.sh
    install-extensions.sh
    install-config.sh
```

## Usage (new Mac)

```bash
chmod +x scripts/*.sh
./scripts/bootstrap.sh
```

What this does:
1. `install-config.sh`
   - Copies `settings.json`, `keybindings.json`, and snippets to:
     `~/Library/Application Support/Code/User`
   - Creates timestamped backups before overwriting existing files.
2. `install-extensions.sh`
   - Installs extensions listed in `vscode/extensions.txt`
   - Skips safely if the `code` CLI is unavailable.

## Important

Copilot, Codex, GitHub login, agents, and company-specific tools must be configured **locally per machine/profile** as needed.

This repository standardizes VS Code environment defaults only; it does not sync personal or corporate identity.
