#!/bin/bash

# Claude Dev Workflow - Simple Installer
# Copies CLAUDE.md to your project and provides setup instructions

set -e

echo "🚀 Claude Dev Workflow Installer"
echo "=================================="
echo

# Check prerequisites
if ! command -v claude &> /dev/null; then
    echo "❌ Error: Claude Code not found."
    echo "   Install from: https://docs.anthropic.com/en/docs/claude-code"
    exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "❌ Error: Must be run from within a git repository"
    echo "   Navigate to your project directory first"
    exit 1
fi

REPO_NAME=$(basename "$(git rev-parse --show-toplevel)")
echo "📁 Installing workflow for project: $REPO_NAME"
echo

# Copy CLAUDE.md if it doesn't exist
if [[ ! -f "CLAUDE.md" ]]; then
    cp "$(dirname "$0")/CLAUDE.md" ./CLAUDE.md
    echo "✅ Copied CLAUDE.md to your project"
else
    echo "ℹ️  CLAUDE.md already exists in your project"
fi

# Copy template files if they don't exist
TEMPLATES_DIR="$(dirname "$0")/templates/project-documents"
if [[ -d "$TEMPLATES_DIR" ]]; then
    mkdir -p ./workflow/context
    
    [[ ! -f "./workflow/context/prd.md" ]] && cp "$TEMPLATES_DIR/prd-template.md" "./workflow/context/prd.md" 2>/dev/null || true
    [[ ! -f "./workflow/context/tech-stack.md" ]] && cp "$TEMPLATES_DIR/tech-stack-template.md" "./workflow/context/tech-stack.md" 2>/dev/null || true
    [[ ! -f "./workflow/context/coding-standards.md" ]] && cp "$TEMPLATES_DIR/coding-standards-template.md" "./workflow/context/coding-standards.md" 2>/dev/null || true
    [[ ! -f "./workflow/context/project-charter.md" ]] && cp "$TEMPLATES_DIR/project-charter-template.md" "./workflow/context/project-charter.md" 2>/dev/null || true
    
    echo "✅ Created workflow context templates"
fi

# Update .gitignore if needed
if [[ -f .gitignore ]] && ! grep -q "workflow/logs/" .gitignore; then
    echo "" >> .gitignore
    echo "# Claude Dev Workflow - ignore working files, keep context" >> .gitignore
    echo "workflow/logs/" >> .gitignore
    echo "workflow/scratchpad/" >> .gitignore
    echo "✅ Updated .gitignore"
fi

echo
echo "🎉 Installation complete!"
echo
echo "📋 Next steps:"
echo "   1. Run: /init    (in Claude Code to initialize)"
echo "   2. Edit files in ./workflow/context/ to match your project"
echo "   3. Start using: /plan <issue_number>"
echo
echo "📖 Available commands:"
echo "   /init                  - Initialize workflow structure"
echo "   /plan <issue>          - Create implementation plan"
echo "   /dev <issue>           - Get development guidance"
echo "   /review <pr> [issue]   - Review PR against requirements"
echo "   /status                - Show workflow status"
echo "   /view <issue>          - View issue details"
echo
echo "🚀 Ready to transform your development workflow!"