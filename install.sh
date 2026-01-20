#!/usr/bin/env bash
# fetch from repo
RAW="https://cedlll.github.io/designr/designr.md"
COUNT_NAMESPACE="cedlll.github.io"
COUNT_KEY="designr_installs"
for dir in "$HOME/.claude/commands" "$HOME/.cursor/commands"; do
  mkdir -p "$dir"
  curl -fsSL "$RAW" -o "$dir/designr.md"
done

# best-effort install counter (do not fail install if this fails)
curl -fsSL "https://api.countapi.xyz/hit/${COUNT_NAMESPACE}/${COUNT_KEY}" >/dev/null 2>&1 || true

echo "Installed — restart your tool and run /designr"
