#!/bin/bash

# Claude Dev Workflow - Enhanced Installer with Project Context
# Creates workflow commands: cplan, cdev, creview with automatic project context

set -e

echo "Installing Claude Dev Workflow..."

# Check prerequisites
if ! command -v claude &> /dev/null; then
    echo "Error: Claude CLI not found. Install from: https://docs.anthropic.com/claude/docs/claude-cli-quickstart"
    exit 1
fi

# Create directories
CLAUDE_DIR="$HOME/.claude"
mkdir -p "$CLAUDE_DIR"/{commands,scratchpad,logs,templates,projects}

echo "Directories created"

# Install commands by appending to shell config
SHELL_CONFIG="$HOME/.bashrc"
if [[ "$SHELL" == *"zsh"* ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
fi

# Add workflow commands with project context integration
cat >> "$SHELL_CONFIG" << 'COMMANDS'

# Claude Dev Workflow Commands
export CLAUDE_SCRATCHPAD_DIR="$HOME/.claude/scratchpad"
export CLAUDE_PROJECT_NAME="${CLAUDE_PROJECT_NAME:-}"
export CLAUDE_PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$HOME/.claude/projects/$CLAUDE_PROJECT_NAME}"

# Helper function to gather project context
_get_project_context() {
    local context=""
    
    # Auto-detect project if not set
    if [[ -z "$CLAUDE_PROJECT_NAME" ]]; then
        # Try to find project from current git repo
        if git rev-parse --is-inside-work-tree &>/dev/null; then
            local repo_name=$(basename "$(git rev-parse --show-toplevel)")
            if [[ -d "$HOME/.claude/projects/$repo_name" ]]; then
                export CLAUDE_PROJECT_NAME="$repo_name"
                export CLAUDE_PROJECT_DIR="$HOME/.claude/projects/$repo_name"
            fi
        fi
    fi
    
    # Load project documents if they exist
    if [[ -n "$CLAUDE_PROJECT_NAME" && -d "$CLAUDE_PROJECT_DIR" ]]; then
        echo "Using project context: $CLAUDE_PROJECT_NAME"
        
        [[ -f "$CLAUDE_PROJECT_DIR/prd.md" ]] && context="$context\n\nPROJECT PRD:\n$(cat "$CLAUDE_PROJECT_DIR/prd.md")"
        [[ -f "$CLAUDE_PROJECT_DIR/tech-stack.md" ]] && context="$context\n\nTECH STACK:\n$(cat "$CLAUDE_PROJECT_DIR/tech-stack.md")"
        [[ -f "$CLAUDE_PROJECT_DIR/project-charter.md" ]] && context="$context\n\nPROJECT CHARTER:\n$(cat "$CLAUDE_PROJECT_DIR/project-charter.md")"
        [[ -f "$CLAUDE_PROJECT_DIR/coding-standards.md" ]] && context="$context\n\nCODING STANDARDS:\n$(cat "$CLAUDE_PROJECT_DIR/coding-standards.md")"
    else
        echo "ℹ️  No project context found. Set CLAUDE_PROJECT_NAME or run from project directory."
    fi
    
    echo -e "$context"
}

cplan() {
    local issue="$1"
    [[ -z "$issue" ]] && { echo "Usage: cplan <issue_number>"; return 1; }
    
    echo "Planning issue #$issue..."
    mkdir -p "$CLAUDE_SCRATCHPAD_DIR/issue-$issue"
    
    local project_context=$(_get_project_context)
    
    claude "Act as a Product Owner. Analyze GitHub issue #$issue and create a detailed implementation plan.

CONTEXT: You have access to project documentation. Use this context to ensure the plan aligns with project goals, technical constraints, and business requirements.

$project_context

TASK: Create an implementation plan that includes:
1. Business requirements analysis
2. Acceptance criteria aligned with project standards
3. Technical considerations based on project tech stack
4. Risk assessment
5. Success metrics

Format the plan clearly for the engineering team." > "$CLAUDE_SCRATCHPAD_DIR/issue-$issue/plan.md"
    
    echo "Plan created: ~/.claude/scratchpad/issue-$issue/plan.md"
    echo "Next: cdev $issue"
}

cdev() {
    local issue="$1"
    [[ -z "$issue" ]] && { echo "Usage: cdev <issue_number>"; return 1; }
    
    local plan_file="$CLAUDE_SCRATCHPAD_DIR/issue-$issue/plan.md"
    [[ ! -f "$plan_file" ]] && { echo "Error: No plan found. Run: cplan $issue"; return 1; }
    
    echo "Developing issue #$issue..."
    
    local project_context=$(_get_project_context)
    
    claude "Act as a Software Engineer. Implement the solution following GitHub Flow and project standards.

PROJECT CONTEXT:
$project_context

IMPLEMENTATION PLAN:
$(cat "$plan_file")

TASK:
1. Follow the tech stack and coding standards from project context
2. Create feature branch: feature/issue-$issue-[description]
3. Implement code following project architecture patterns
4. Write tests according to project testing standards
5. Create pull request with proper description
6. Ensure code meets project quality standards

Provide step-by-step implementation guidance." > "$CLAUDE_SCRATCHPAD_DIR/issue-$issue/development.md"
    
    echo "Development complete: ~/.claude/scratchpad/issue-$issue/development.md"
    echo "Next: creview <pr_number> $issue"
}

creview() {
    local pr="$1"
    local issue="$2"
    [[ -z "$pr" ]] && { echo "Usage: creview <pr_number> [issue_number]"; return 1; }
    
    echo "Reviewing PR #$pr..."
    
    local context=""
    if [[ -n "$issue" && -f "$CLAUDE_SCRATCHPAD_DIR/issue-$issue/plan.md" ]]; then
        context="ORIGINAL PLAN:\n$(cat "$CLAUDE_SCRATCHPAD_DIR/issue-$issue/plan.md")\n\n"
    fi
    
    local project_context=$(_get_project_context)
    
    claude "Act as a Senior Engineering Manager. Review GitHub PR #$pr comprehensively against project standards.

PROJECT CONTEXT:
$project_context

$context

REVIEW CRITERIA:
1. Code quality meets project coding standards
2. Architecture aligns with project tech stack
3. Security follows project guidelines
4. Performance meets project requirements
5. Tests are adequate per project standards
6. Documentation is complete
7. Alignment with original business requirements

Provide specific, actionable feedback with priority levels:
- Must Fix (blocking issues)
- Should Fix (important improvements)  
- Consider (optional enhancements)" > "$CLAUDE_SCRATCHPAD_DIR/issue-${issue:-$pr}/review.md"
    
    echo "Review complete: ~/.claude/scratchpad/issue-${issue:-$pr}/review.md"
}

# Project setup helper
cproject() {
    local project_name="$1"
    [[ -z "$project_name" ]] && { echo "Usage: cproject <project_name>"; return 1; }
    
    echo "Setting up project: $project_name"
    
    local project_dir="$HOME/.claude/projects/$project_name"
    mkdir -p "$project_dir"
    
    # Copy templates if they don't exist
    [[ ! -f "$project_dir/prd.md" ]] && cp "$HOME/.claude/templates/project-documents/prd-template.md" "$project_dir/prd.md"
    [[ ! -f "$project_dir/tech-stack.md" ]] && cp "$HOME/.claude/templates/project-documents/tech-stack-template.md" "$project_dir/tech-stack.md"
    [[ ! -f "$project_dir/coding-standards.md" ]] && cp "$HOME/.claude/templates/project-documents/coding-standards-template.md" "$project_dir/coding-standards.md"
    [[ ! -f "$project_dir/project-charter.md" ]] && cp "$HOME/.claude/templates/project-documents/project-charter-template.md" "$project_dir/project-charter.md"
    
    # Set environment variables
    echo "export CLAUDE_PROJECT_NAME=\"$project_name\"" >> "$SHELL_CONFIG"
    echo "export CLAUDE_PROJECT_DIR=\"$project_dir\"" >> "$SHELL_CONFIG"
    
    export CLAUDE_PROJECT_NAME="$project_name"
    export CLAUDE_PROJECT_DIR="$project_dir"
    
    echo "Project setup complete!"
    echo "Edit these files to customize for your project:"
    echo "   - $project_dir/prd.md"
    echo "   - $project_dir/tech-stack.md" 
    echo "   - $project_dir/coding-standards.md"
    echo "   - $project_dir/project-charter.md"
    echo ""
    echo "Restart your shell or run: source $SHELL_CONFIG"
}

cstatus() {
    echo "Workflow Status:"
    [[ -n "$CLAUDE_PROJECT_NAME" ]] && echo "Active Project: $CLAUDE_PROJECT_NAME"
    
    for dir in "$CLAUDE_SCRATCHPAD_DIR"/issue-*/; do
        if [[ -d "$dir" ]]; then
            local issue=$(basename "$dir" | sed 's/issue-//')
            local files=""
            [[ -f "$dir/plan.md" ]] && files="$files[P]"
            [[ -f "$dir/development.md" ]] && files="$files[D]"
            [[ -f "$dir/review.md" ]] && files="$files[R]"
            echo "  Issue #$issue: $files"
        fi
    done
}

cview() {
    local issue="$1"
    [[ -z "$issue" ]] && { echo "Usage: cview <issue_number>"; return 1; }
    
    local issue_dir="$CLAUDE_SCRATCHPAD_DIR/issue-$issue"
    [[ ! -d "$issue_dir" ]] && { echo "❌ No data for issue #$issue"; return 1; }
    
    echo "Issue #$issue Contents:"
    for file in "$issue_dir"/*.md; do
        [[ -f "$file" ]] && echo -e "\n=== $(basename "$file" .md | tr '[:lower:]' '[:upper:]') ===" && cat "$file"
    done
}

chelp() {
    cat << 'HELP'
Claude Dev Workflow Commands

WORKFLOW:
  cplan <issue>        Create implementation plan with project context
  cdev <issue>         Develop solution following project standards
  creview <pr> [issue] Review PR against project requirements

PROJECT SETUP:
  cproject <name>      Setup new project with templates
  
UTILITIES:
  cstatus             Show project and issue status
  cview <issue>       View issue details
  chelp               Show this help

ENVIRONMENT:
  CLAUDE_PROJECT_NAME     - Current project name
  CLAUDE_PROJECT_DIR      - Project documents directory

EXAMPLE:
  cproject my-app     # Setup project
  cplan 123          # Plan issue #123 (uses project context)
  cdev 123           # Develop with project standards
  creview 456 123    # Review against project requirements
HELP
}

COMMANDS

echo "Commands installed to $SHELL_CONFIG"
echo ""
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "1. Run: source $SHELL_CONFIG"
echo "2. Setup project: cproject your-project-name"
echo "3. Test: chelp"
echo "4. Start: cplan <issue_number>"
echo ""
echo "See QUICK-START.md for examples"