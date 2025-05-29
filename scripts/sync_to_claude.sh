#!/bin/bash
# Sync claude-dotfiles to ~/.claude/

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="$HOME/.claude"

echo -e "${GREEN}Syncing claude-dotfiles to ~/.claude/${NC}"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Use rsync to sync files, respecting .gitignore
# --exclude-from uses .gitignore patterns
# --delete removes files in target that don't exist in source
# --archive preserves permissions and timestamps
rsync -av --delete \
    --exclude='.git/' \
    --exclude='.gitignore' \
    --exclude='.claude/' \
    --exclude='scripts/' \
    --exclude='README.md' \
    --filter=':- .gitignore' \
    "$REPO_ROOT/" "$TARGET_DIR/"

echo -e "${GREEN}✓ Sync completed successfully!${NC}"
echo -e "${YELLOW}Files synced to: $TARGET_DIR${NC}"

# List what was synced
echo -e "\n${GREEN}Synced contents:${NC}"
find "$TARGET_DIR" -type f -not -path "*/\.*" | sed "s|$TARGET_DIR/|  |" | sort