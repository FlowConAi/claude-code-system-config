# Claude Dotfiles

This repository contains shared Claude AI configuration and settings that can be synced to your local `~/.claude/` directory.

## Purpose

- Share consistent Claude AI settings across team members
- Version control Claude configuration files
- Maintain standard prompts, commands, and documentation

## Usage

1. Clone this repository
2. Run the sync script to copy files to your local Claude configuration:
   ```bash
   ./scripts/sync_to_claude.py
   ```
   Or:
   ```bash
   python3 scripts/sync_to_claude.py
   ```

## Contents

- `CLAUDE.md` - Global instructions for Claude
- `PRPs/` - Project Requirement Prompts templates
- `commands/` - Reusable Claude commands
- `docs/` - Development documentation and guidelines
- `scripts/` - Utility scripts

## Note

The `.claude/` folder and this README are excluded from syncing to avoid overwriting local settings.