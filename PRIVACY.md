# Privacy Policy — tldr plugin

The tldr plugin does not collect, transmit, or share any user data.

## What it stores locally

A single state file at `~/.claude/plugins/data/tldr/state` containing one of two values: `on` or `off`. The file is owned by your user account and never leaves your machine.

## What it sends

Nothing. The plugin has no network code. When the toggle is on, it injects a ~93-token text instruction into your prompt — that text is then sent to Anthropic as part of your Claude Code conversation, the same way any other text you type would be. The plugin itself has no separate channel.

## Telemetry, cookies, analytics

None.

## Data deletion

Disable the plugin via `/tldr:tldr off`, or remove the state file:

```
rm ~/.claude/plugins/data/tldr/state
```

Uninstalling the plugin (`/plugin uninstall tldr@tldr`) leaves the state file behind; remove it manually if you want a clean slate.

## Changes

If this policy changes, the file's git history will show the diff. The current version applies to the latest release.

Effective date: 2026-05-24
