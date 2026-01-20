cat > install << 'EOF'
#!/bin/bash

# designr installer
# https://github.com/cedlll/designr

set -e

RULES_URL="https://github.com/cedlll/designr/rules.md"
INSTALLED=0

echo "Installing designr rules..."
echo ""

# Claude Code
if [ -d "$HOME/.claude" ]; then
  mkdir -p "$HOME/.claude/commands"
  curl -sL -o "$HOME/.claude/commands/rules.md" "$RULES_URL"
  echo "✓ Installed for Claude Code"
  INSTALLED=$((INSTALLED + 1))
fi

# Cursor
if [ -d "$HOME/.cursor" ]; then
  mkdir -p "$HOME/.cursor/commands"
  curl -sL -o "$HOME/.cursor/commands/rules.md" "$RULES_URL"
  echo "✓ Installed for Cursor"
  INSTALLED=$((INSTALLED + 1))
fi

# OpenCode - check if binary exists OR config dir exists
if command -v opencode &> /dev/null || [ -d "$HOME/.config/opencode" ]; then
  mkdir -p "$HOME/.config/opencode/command"
  curl -sL -o "$HOME/.config/opencode/command/rules.md" "$RULES_URL"
  echo "✓ Installed for OpenCode"
  INSTALLED=$((INSTALLED + 1))
fi

# Codex CLI - check if binary exists OR config dir exists
if command -v codex &> /dev/null || [ -d "$HOME/.codex" ]; then
  mkdir -p "$HOME/.codex/prompts"
  curl -sL -o "$HOME/.codex/prompts/rules.md" "$RULES_URL"
  echo "✓ Installed for Codex"
  INSTALLED=$((INSTALLED + 1))
fi

# Antigravity (Gemini CLI) - install as global workflow
if [ -d "$HOME/.gemini" ]; then
  mkdir -p "$HOME/.gemini/antigravity/global_workflows"
  curl -sL -o "$HOME/.gemini/antigravity/global_workflows/rules.md" "$RULES_URL"
  echo "✓ Installed for Antigravity"
  INSTALLED=$((INSTALLED + 1))
fi

echo ""

if [ $INSTALLED -eq 0 ]; then
  echo "No supported tools detected."
  echo ""
  echo "Install one of these first:"
  echo "  • Claude Code: https://claude.ai/code"
  echo "  • Cursor: https://cursor.com"
  echo "  • OpenCode: https://opencode.ai"
  echo "  • Codex: https://openai.com/codex"
  echo "  • Antigravity: https://antigravity.google"
  exit 1
fi

echo "Done! Type /designr-rules in your editor to run."
EOF

# Make the install script executable
chmod +x install
