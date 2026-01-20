#!/usr/bin/env bash
# fetch from repo
RAW="https://cedlll.github.io/designr/designr.md"
for dir in "$HOME/.claude/commands" "$HOME/.config/opencode/skills" "$HOME/.cursor/commands"; do
  mkdir -p "$dir"
  curl -fsSL "$RAW" -o "$dir/designr.md"
done
echo "Installed — restart your tool and run /designr"
