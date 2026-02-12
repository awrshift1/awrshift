#!/bin/bash
# awrshift installer -- sets up the AI problem-solving framework in your project
# Usage: curl -sL https://raw.githubusercontent.com/awrshift1/awrshift/main/install.sh | bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "  awrshift -- installing AI problem-solving framework"
echo "  ---------------------------------------------------"
echo ""

# Check for existing files
if [ -d ".claude" ]; then
  echo -e "${YELLOW}  Warning: .claude/ already exists. Backing up to .claude.backup/${NC}"
  mv .claude .claude.backup
fi

if [ -f "CLAUDE.md" ]; then
  echo -e "${YELLOW}  Warning: CLAUDE.md already exists. Backing up to CLAUDE.md.backup${NC}"
  mv CLAUDE.md CLAUDE.md.backup
fi

if [ -d "context" ]; then
  echo -e "${YELLOW}  Warning: context/ already exists. Backing up to context.backup/${NC}"
  mv context context.backup
fi

# Clone and copy
echo "  Downloading awrshift..."
git clone --quiet --depth 1 https://github.com/awrshift1/awrshift.git .awrshift-tmp 2>/dev/null

echo "  Setting up framework..."
cp -r .awrshift-tmp/claude-code/.claude ./
cp .awrshift-tmp/claude-code/CLAUDE.md ./
cp -r .awrshift-tmp/claude-code/context ./

# Cleanup
rm -rf .awrshift-tmp

echo ""
echo -e "${GREEN}  Done! Your project now has:${NC}"
echo ""
echo "    CLAUDE.md              -- Framework rules (read by AI automatically)"
echo "    context/"
echo "      memory.md            -- Project memory (tech stack, conventions)"
echo "      next-session.md      -- Session handoff (what was done, what's next)"
echo "      decisions.md         -- Decision log (choices made and why)"
echo "    .claude/"
echo "      commands/think.md    -- /think command"
echo "      rules/               -- Phase enforcement"
echo ""
echo "  Next step: Open this folder in Claude Code or Windsurf and type /think"
echo ""
