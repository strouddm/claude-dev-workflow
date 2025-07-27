#!/bin/bash

# Claude Dev Workflow - Global Installer
# Installs workflow commands to ~/.claude/commands for use across all projects

set -e

echo "🚀 Claude Dev Workflow - Global Installation"
echo "==========================================="
echo

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create global commands directory
GLOBAL_CMD_DIR="$HOME/.claude/commands"
mkdir -p "$GLOBAL_CMD_DIR"

# Check if commands directory exists
if [[ ! -d "$SCRIPT_DIR/.claude/commands" ]]; then
    echo "❌ Error: Command files not found at $SCRIPT_DIR/.claude/commands"
    echo "   Make sure you're running the installer from the claude-dev-workflow repository"
    exit 1
fi

# Copy all command files
echo "📋 Installing workflow commands globally..."
INSTALLED_COUNT=0
for cmd_file in "$SCRIPT_DIR"/.claude/commands/*.md; do
    if [[ -f "$cmd_file" ]]; then
        cmd_name=$(basename "$cmd_file" .md)
        cp "$cmd_file" "$GLOBAL_CMD_DIR/$(basename "$cmd_file")"
        echo "   ✅ Installed /$cmd_name (user)"
        ((INSTALLED_COUNT++))
    fi
done

if [[ $INSTALLED_COUNT -eq 0 ]]; then
    echo "❌ Error: No command files found to install"
    exit 1
fi

echo
echo "✅ Global installation complete!"
echo
echo "📖 Available commands in ALL projects:"
echo "   /setup                 - Initialize workflow in any project"
echo "   /plan <issue>          - Create implementation plan"
echo "   /dev <issue>           - Get development guidance"
echo "   /review <pr> [issue]   - Review PR against requirements"
echo "   /status                - Show workflow status"
echo "   /view <issue>          - View issue details"
echo "   /epic <name>           - Create epic planning"
echo
echo "🚀 Next steps:"
echo "   1. Navigate to any project: cd /your/project"
echo "   2. Run /setup in Claude Code to initialize workflow"
echo "   3. Edit workflow/context/ files for that project"
echo "   4. Start using: /plan <issue_number>"
echo
echo "Commands are now available in every project - no need to install again!"