#!/bin/bash
# awrshift installer -- sets up the AI problem-solving framework in your project
# Usage: curl -sL https://raw.githubusercontent.com/awrshift1/awrshift/main/install.sh | bash
#
# Safe for existing projects: merges without overwriting your files.

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo "  awrshift -- installing AI problem-solving framework"
echo "  ---------------------------------------------------"
echo ""

# Clone
echo "  Downloading awrshift..."
git clone --quiet --depth 1 https://github.com/awrshift1/awrshift.git .awrshift-tmp 2>/dev/null

ADDED=""
SKIPPED=""

# --- .claude/commands/ and .claude/rules/ -- merge, don't replace ---
mkdir -p .claude/commands .claude/rules

if [ -f .claude/commands/think.md ]; then
  SKIPPED="${SKIPPED}    .claude/commands/think.md (already exists)\n"
else
  cp .awrshift-tmp/claude-code/.claude/commands/think.md .claude/commands/
  ADDED="${ADDED}    .claude/commands/think.md    -- /think command\n"
fi

if [ -f .claude/rules/awshift-phases.md ]; then
  SKIPPED="${SKIPPED}    .claude/rules/awshift-phases.md (already exists)\n"
else
  cp .awrshift-tmp/claude-code/.claude/rules/awshift-phases.md .claude/rules/
  ADDED="${ADDED}    .claude/rules/awshift-phases.md -- Phase enforcement (auto-loaded)\n"
fi

# --- context/ -- create files only if missing ---
mkdir -p context

for file in memory.md next-session.md decisions.md; do
  if [ -f "context/$file" ]; then
    SKIPPED="${SKIPPED}    context/$file (already exists)\n"
  else
    cp ".awrshift-tmp/claude-code/context/$file" "context/$file"
    ADDED="${ADDED}    context/$file\n"
  fi
done

# --- framework/ -- create files only if missing ---
mkdir -p framework

for file in methodology.md experiment-template.md; do
  if [ -f "framework/$file" ]; then
    SKIPPED="${SKIPPED}    framework/$file (already exists)\n"
  else
    cp ".awrshift-tmp/claude-code/framework/$file" "framework/$file"
    ADDED="${ADDED}    framework/$file\n"
  fi
done

# --- CLAUDE.md -- append if exists, create if not ---
if [ -f "CLAUDE.md" ]; then
  # Check if awrshift section already present
  if grep -q "awrshift" CLAUDE.md 2>/dev/null; then
    SKIPPED="${SKIPPED}    CLAUDE.md (awrshift section already present)\n"
  else
    echo "" >> CLAUDE.md
    echo "---" >> CLAUDE.md
    echo "" >> CLAUDE.md
    cat .awrshift-tmp/claude-code/CLAUDE.md >> CLAUDE.md
    ADDED="${ADDED}    CLAUDE.md (appended awrshift section to existing file)\n"
  fi
else
  cp .awrshift-tmp/claude-code/CLAUDE.md ./
  ADDED="${ADDED}    CLAUDE.md -- System instructions\n"
fi

# Cleanup
rm -rf .awrshift-tmp

# --- Report ---
echo ""
if [ -n "$ADDED" ]; then
  echo -e "${GREEN}  Added:${NC}"
  echo -e "$ADDED"
fi

if [ -n "$SKIPPED" ]; then
  echo -e "${YELLOW}  Skipped (already exist):${NC}"
  echo -e "$SKIPPED"
fi

echo -e "${CYAN}  Next step:${NC} Open this folder in Claude Code or Windsurf and type ${CYAN}/think${NC}"
echo ""
