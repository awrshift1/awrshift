#!/bin/bash
# awrshift installer -- sets up the AI problem-solving framework in your project
# Usage: curl -sL https://raw.githubusercontent.com/awrshift1/awrshift/main/install.sh | bash

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo "  awrshift -- installing AI problem-solving framework"
echo "  ---------------------------------------------------"
echo ""

# Check if .claude already exists
if [ -d ".claude" ]; then
  echo -e "${YELLOW}Warning: .claude/ directory already exists. Backing up to .claude.backup/${NC}"
  mv .claude .claude.backup
fi

if [ -f "CLAUDE.md" ]; then
  echo -e "${YELLOW}Warning: CLAUDE.md already exists. Backing up to CLAUDE.md.backup${NC}"
  mv CLAUDE.md CLAUDE.md.backup
fi

# Clone and copy
echo "  Downloading awrshift..."
git clone --quiet --depth 1 https://github.com/awrshift1/awrshift.git .awrshift-tmp 2>/dev/null

echo "  Setting up framework files..."
cp -r .awrshift-tmp/claude-code/.claude ./
cp .awrshift-tmp/claude-code/*.md ./

# Cleanup
rm -rf .awrshift-tmp

echo ""
echo -e "${GREEN}  Done! Your project now has:${NC}"
echo ""
echo "    CLAUDE.md          -- Framework rules (read by AI automatically)"
echo "    MEMORY.md          -- Project memory (your tech stack, conventions)"
echo "    next-session.md    -- Session handoff (what was done, what's next)"
echo "    decisions.md       -- Decision log (choices made and why)"
echo "    .claude/commands/  -- /think command"
echo "    .claude/rules/     -- Phase enforcement"
echo ""
echo "  Next step: Open this folder in Claude Code or Windsurf and type /think"
echo ""
