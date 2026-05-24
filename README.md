# claude-tldr-plugin

A Claude Code plugin that adds a `/tldr:tldr` slash command. When toggled on, Claude defaults to maximally concise replies (1-3 sentences) for every subsequent message — unless you explicitly ask for a full explanation.

## Install

```
/plugin marketplace add marcelopaniza/claude-tldr-plugin
/plugin install tldr@claude-tldr-plugin
```

## Use

```
/tldr:tldr           # toggle (default)
/tldr:tldr on
/tldr:tldr off
/tldr:tldr status
```

Once on, the plugin's `UserPromptSubmit` hook prepends a short instruction (~93 tokens) to every user message. Words like "explain", "in detail", "in full", "walk me through", "deep dive", or "step by step" in your message cause Claude to ignore TL;DR mode for that turn.

State (`on` / `off`) is stored at `~/.claude/plugins/data/tldr/state` and persists across sessions and projects.

## Local development

Test without installing:

```
claude --plugin-dir /path/to/this/repo
```

## Layout

```
.claude-plugin/
  plugin.json         # plugin manifest
  marketplace.json    # marketplace metadata
skills/tldr/
  SKILL.md            # /tldr:tldr slash command
hooks/
  hooks.json          # UserPromptSubmit wiring
scripts/
  toggle.sh           # state read/write
  inject.sh           # instruction emitted when ON
```
