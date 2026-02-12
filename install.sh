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

# Backup existing files
for item in .claude CLAUDE.md context framework; do
  if [ -e "$item" ]; then
    echo -e "${YELLOW}  Warning: $item already exists. Backing up to ${item}.backup${NC}"
    mv "$item" "${item}.backup"
  fi
done

# Clone and copy
echo "  Downloading awrshift..."
git clone --quiet --depth 1 https://github.com/awrshift1/awrshift.git .awrshift-tmp 2>/dev/null

echo "  Setting up framework..."
cp -r .awrshift-tmp/claude-code/.claude ./
cp .awrshift-tmp/claude-code/CLAUDE.md ./
cp -r .awrshift-tmp/claude-code/context ./
cp -r .awrshift-tmp/claude-code/framework ./

# Cleanup
rm -rf .awrshift-tmp

echo ""
echo -e "${GREEN}  Done! Your project now has:${NC}"
echo ""
echo "    CLAUDE.md                  -- System instructions (index file)"
echo "    context/"
echo "      memory.md                -- Project memory"
echo "      next-session.md          -- Session handoff"
echo "      decisions.md             -- Decision log"
echo "    framework/"
echo "      methodology.md           -- Full awrshift methodology"
echo "    .claude/"
echo "      commands/think.md        -- /think command"
echo "      rules/awshift-phases.md  -- Phase enforcement (auto-loaded)"
echo ""
echo "  Next step: Open this folder in Claude Code or Windsurf and type /think"
echo ""
