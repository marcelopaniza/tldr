#!/usr/bin/env bash
set -euo pipefail

# CLAUDE_PLUGIN_DATA is injected by Claude Code when this runs as part of the
# plugin. It has been observed pointing at a sibling plugin's data dir, so we
# only trust it when its basename is 'tldr'; otherwise fall back to the
# conventional path (which also covers direct invocation for testing).
default_dir="$HOME/.claude/plugins/data/tldr"
data_dir="${CLAUDE_PLUGIN_DATA:-$default_dir}"
[ "$(basename "$data_dir")" = "tldr" ] || data_dir="$default_dir"
mkdir -p "$data_dir"
state_file="$data_dir/state"

current="off"
[ -f "$state_file" ] && current="$(cat "$state_file")"

arg="${1:-toggle}"

case "$arg" in
  on|off)
    new="$arg"
    ;;
  toggle)
    if [ "$current" = "on" ]; then new="off"; else new="on"; fi
    ;;
  status)
    echo "TL;DR mode is ${current}."
    exit 0
    ;;
  *)
    echo "Usage: /tldr:tldr [on|off|toggle|status]  (got: '${arg}')" >&2
    exit 1
    ;;
esac

printf '%s' "$new" > "$state_file"
echo "TL;DR mode is now ${new}."
