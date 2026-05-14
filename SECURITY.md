# SECURITY

This repository must remain neutral, portable, and secret-free.

## Never commit

- Tokens (access tokens, refresh tokens, session tokens)
- API keys
- SSH keys (public or private)
- GitHub authentication data
- Copilot settings or credentials
- Codex/OpenAI settings or credentials
- Company-specific settings or internal endpoints
- VPN configuration files
- VS Code `workspaceStorage/`
- VS Code `globalStorage/`
- VS Code `storage.json`
- Personal or corporate email addresses

## Safe practices

- Keep `vscode/settings.json` neutral and machine-agnostic.
- Keep extension choices generic and non-account-specific.
- Review `git diff` before every commit.
- Immediately rotate/revoke any accidentally exposed secret.
