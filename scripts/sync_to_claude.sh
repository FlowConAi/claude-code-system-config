#!/bin/bash
# Sync claude-dotfiles to ~/.claude/

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="$HOME/.claude"

echo -e "${GREEN}Syncing claude-dotfiles to ~/.claude/${NC}"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Function to ask for confirmation
confirm_overwrite() {
    local file="$1"
    echo -ne "${YELLOW}File exists: $file. Overwrite? [y/N] ${NC}"
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Function to sync a file or directory
sync_item() {
    local src="$1"
    local dest="$2"
    local rel_path="${src#$REPO_ROOT/}"
    
    if [ -d "$src" ]; then
        # Create directory if it doesn't exist
        mkdir -p "$dest"
    elif [ -f "$src" ]; then
        # Check if file exists and ask for confirmation
        if [ -f "$dest" ]; then
            if confirm_overwrite "$rel_path"; then
                cp -p "$src" "$dest"
                echo -e "${GREEN}✓ Updated: $rel_path${NC}"
            else
                echo -e "${BLUE}⊘ Skipped: $rel_path${NC}"
            fi
        else
            # File doesn't exist, just copy it
            cp -p "$src" "$dest"
            echo -e "${GREEN}✓ Added: $rel_path${NC}"
        fi
    fi
}

# Find all files and directories to sync (excluding certain patterns)
echo -e "\n${BLUE}Processing files...${NC}\n"

while IFS= read -r -d '' item; do
    # Skip excluded items
    rel_item="${item#$REPO_ROOT/}"
    
    # Skip if it matches excluded patterns
    case "$rel_item" in
        .git/*|.gitignore|.claude/*|scripts/*|README.md)
            continue
            ;;
    esac
    
    # Skip hidden files/directories (starting with .)
    if [[ "$rel_item" =~ ^\..*|.*/\..*$ ]]; then
        continue
    fi
    
    # Calculate destination path
    dest_item="$TARGET_DIR/$rel_item"
    dest_dir=$(dirname "$dest_item")
    
    # Create parent directory if needed
    [ -d "$dest_dir" ] || mkdir -p "$dest_dir"
    
    # Sync the item
    sync_item "$item" "$dest_item"
    
done < <(find "$REPO_ROOT" -mindepth 1 \( -type f -o -type d \) -print0 | sort -z)

echo -e "\n${GREEN}✓ Sync completed!${NC}"
echo -e "${YELLOW}Target directory: $TARGET_DIR${NC}"

# List current contents
echo -e "\n${GREEN}Current contents in ~/.claude/:${NC}"
find "$TARGET_DIR" -type f -not -path "*/\.*" | sed "s|$TARGET_DIR/|  |" | sort