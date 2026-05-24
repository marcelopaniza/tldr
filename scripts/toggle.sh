#!/usr/bin/env bash
set -euo pipefail

# CLAUDE_PLUGIN_DATA is injected by Claude Code when this runs as part of the
# plugin. Fall back to the conventional path so the script also works when
# invoked directly (e.g. for testing).
data_dir="${CLAUDE_PLUGIN_DATA:-$HOME/.claude/plugins/data/tldr}"
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
