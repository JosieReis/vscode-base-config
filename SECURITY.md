# SECURITY

This repository must remain neutral, portable, and secret-free.

## Never commit

- Tokens (access/refresh/session)
- API keys
- Passwords/cookies/bearer credentials
- SSH keys (public or private)
- GitHub authentication artifacts
- Copilot settings or credentials
- Codex/OpenAI settings or credentials
- Company-specific settings, internal endpoints, or private tooling configs
- VPN configuration files
- Personal or corporate email addresses
- VS Code `workspaceStorage/`, `globalStorage/`, or `storage.json`

## Commit checklist

Before every commit:
- Confirm no secrets or identity artifacts are included.
- Confirm no machine-specific paths or company-specific data are included.
- Confirm only neutral VS Code config and scripts are changed.
- Review `git diff --staged` manually.

## If something sensitive is committed

- Revoke/rotate the secret immediately.
- Remove the sensitive content from git history if needed.
- Notify relevant owners/security contacts per policy.
