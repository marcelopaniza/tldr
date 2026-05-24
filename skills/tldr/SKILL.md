---
description: Toggle TL;DR response mode for this user. Invoked by the user typing /tldr:tldr [on|off|toggle|status]. Not for model auto-invocation.
disable-model-invocation: true
allowed-tools: Bash
---

The user invoked `/tldr:tldr`. They may have passed one of: `on`, `off`, `toggle`, `status`. If no argument was passed, treat it as `toggle`.

Run exactly:

```bash
"${CLAUDE_PLUGIN_ROOT}"/scripts/toggle.sh <ARG>
```

…substituting `<ARG>` with the user's argument (or omit it for the default toggle behavior).

Then report the script's single line of stdout to the user verbatim. Do not add explanation, commentary, or a summary. Do not run any other tools.
