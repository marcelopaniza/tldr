#!/usr/bin/env bash
# UserPromptSubmit hook. When TL;DR mode is on, print an instruction to
# stdout; Claude Code adds it to the conversation as additional context.
# When off, exit silently.

data_dir="${CLAUDE_PLUGIN_DATA:-$HOME/.claude/plugins/data/tldr}"
state_file="$data_dir/state"

[ -f "$state_file" ] || exit 0
[ "$(cat "$state_file" 2>/dev/null)" = "on" ] || exit 0

cat <<'EOF'
[tldr plugin: TL;DR mode is ON]
Default to 1-3 sentence replies for this turn. Skip preamble, caveats, and trailing summaries. Code, commands, and paths are fine — minimize prose around them.

EXCEPTION: if the user explicitly asks for a thorough answer ("explain", "in detail", "in full", "walk me through", "deep dive", "step by step"), give the complete answer instead.
EOF
