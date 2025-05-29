#!/usr/bin/env python3
"""Sync claude-dotfiles to ~/.claude/"""

import os
import shutil
import sys
from pathlib import Path
from typing import List, Set

# Colors for terminal output
class Colors:
    GREEN = '\033[0;32m'
    YELLOW = '\033[1;33m'
    RED = '\033[0;31m'
    BLUE = '\033[0;34m'
    NC = '\033[0m'  # No Color

def print_colored(message: str, color: str = Colors.NC):
    """Print message with color"""
    print(f"{color}{message}{Colors.NC}")

def confirm_overwrite(file_path: str) -> bool:
    """Ask user for confirmation to overwrite a file"""
    response = input(f"{Colors.YELLOW}File exists: {file_path}. Overwrite? [y/N] {Colors.NC}").strip().lower()
    return response in ['y', 'yes']

def get_excluded_patterns() -> Set[str]:
    """Get patterns to exclude from syncing"""
    return {
        '.git',
        '.gitignore',
        '.claude',
        'scripts',
        'README.md',
        '__pycache__',
        '.DS_Store',
        '.vscode',
        '.idea'
    }

def should_exclude(path: Path, repo_root: Path, excluded: Set[str]) -> bool:
    """Check if a path should be excluded from syncing"""
    rel_path = path.relative_to(repo_root)
    parts = rel_path.parts
    
    # Check if any part of the path matches excluded patterns
    for part in parts:
        if part in excluded or part.startswith('.'):
            return True
    
    # Check full relative path
    rel_str = str(rel_path)
    for pattern in excluded:
        if rel_str.startswith(pattern):
            return True
            
    return False

def sync_file(src: Path, dest: Path, repo_root: Path) -> None:
    """Sync a single file with confirmation if it exists"""
    rel_path = src.relative_to(repo_root)
    
    # Create parent directories if needed
    dest.parent.mkdir(parents=True, exist_ok=True)
    
    if dest.exists():
        if confirm_overwrite(str(rel_path)):
            shutil.copy2(src, dest)
            print_colored(f"✓ Updated: {rel_path}", Colors.GREEN)
        else:
            print_colored(f"⊘ Skipped: {rel_path}", Colors.BLUE)
    else:
        shutil.copy2(src, dest)
        print_colored(f"✓ Added: {rel_path}", Colors.GREEN)

def main():
    """Main sync function"""
    # Get paths
    script_dir = Path(__file__).parent.absolute()
    repo_root = script_dir.parent
    target_dir = Path.home() / '.claude'
    
    print_colored("Syncing claude-dotfiles to ~/.claude/", Colors.GREEN)
    
    # Create target directory if it doesn't exist
    target_dir.mkdir(exist_ok=True)
    
    # Get excluded patterns
    excluded = get_excluded_patterns()
    
    # Process files
    print_colored("\nProcessing files...\n", Colors.BLUE)
    
    files_to_sync = []
    
    # Walk through repo and collect files to sync
    for src_path in repo_root.rglob('*'):
        # Skip if excluded
        if should_exclude(src_path, repo_root, excluded):
            continue
            
        # Only sync files (directories are created automatically)
        if src_path.is_file():
            rel_path = src_path.relative_to(repo_root)
            dest_path = target_dir / rel_path
            files_to_sync.append((src_path, dest_path))
    
    # Sort files for consistent output
    files_to_sync.sort(key=lambda x: str(x[0].relative_to(repo_root)))
    
    # Sync each file
    for src, dest in files_to_sync:
        sync_file(src, dest, repo_root)
    
    print_colored(f"\n✓ Sync completed!", Colors.GREEN)
    print_colored(f"Target directory: {target_dir}", Colors.YELLOW)
    
    # List current contents
    print_colored("\nCurrent contents in ~/.claude/:", Colors.GREEN)
    
    for file_path in sorted(target_dir.rglob('*')):
        if file_path.is_file() and not file_path.name.startswith('.'):
            rel_path = file_path.relative_to(target_dir)
            print(f"  {rel_path}")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print_colored("\n\nSync cancelled by user.", Colors.YELLOW)
        sys.exit(1)
    except Exception as e:
        print_colored(f"\nError: {e}", Colors.RED)
        sys.exit(1)