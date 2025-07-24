# Project Setup Guide for Claude Dev Workflow

## Overview
This guide shows how to incorporate your project's specific documents and context into the Claude Dev Workflow.

## Project Context Integration

### 1. Create Project Directory Structure

```bash
mkdir -p ~/.claude/projects/YOUR_PROJECT_NAME
cd ~/.claude/projects/YOUR_PROJECT_NAME
```

### 2. Add Core Project Documents

#### Required Documents:
```
~/.claude/projects/YOUR_PROJECT_NAME/
├── README.md              # Project overview
├── prd.md                 # Product Requirements Document  
├── tech-stack.md          # Technical architecture
├── coding-standards.md    # Team coding conventions
└── project-charter.md     # Goals and constraints
```

#### Example PRD Template:
```markdown
# Product Requirements Document

## Product Vision
What problem does this solve? What's the end goal?

## Target Users
Who will use this product?

## Core Features
- Feature 1: Description
- Feature 2: Description
- Feature 3: Description

## Success Metrics
How do we measure success?

## Technical Requirements
- Performance requirements
- Security requirements
- Scalability needs

## Constraints
- Timeline constraints
- Resource constraints
- Technical constraints
```

#### Example Tech Stack:
```markdown
# Technical Stack

## Frontend
- Framework: React/Vue/Angular
- Language: TypeScript
- Styling: CSS/SCSS/Tailwind

## Backend  
- Framework: Node.js/Python/Java
- Database: PostgreSQL/MongoDB
- Authentication: JWT/OAuth

## Infrastructure
- Hosting: AWS/GCP/Azure
- CI/CD: GitHub Actions
- Monitoring: DataDog/NewRelic

## Development Tools
- Package Manager: npm/yarn
- Testing: Jest/Pytest
- Code Quality: ESLint/Prettier
```

### 3. Customize Agent Instructions

#### Update Product Owner Agent:
Edit `~/.claude/commands/product-owner-implementation-planning.md`:

```markdown
## Project Context Sources
Before analyzing any issue, gather context from:

- [ ] Read project PRD: `~/.claude/projects/YOUR_PROJECT/prd.md`
- [ ] Review technical stack: `~/.claude/projects/YOUR_PROJECT/tech-stack.md`
- [ ] Check project charter: `~/.claude/projects/YOUR_PROJECT/project-charter.md`
- [ ] Review existing issues in this project's GitHub repo

## Project-Specific Analysis
- Business alignment: How does this issue advance our product vision?
- Technical fit: Does this align with our chosen tech stack?
- Resource impact: Given our project constraints, what's the effort?
- User impact: Which user segments are affected?
```

#### Update Software Engineer Agent:
Edit `~/.claude/commands/software-engineer-github-flow.md`:

```markdown
## Project Setup Checklist
- [ ] Review coding standards: `~/.claude/projects/YOUR_PROJECT/coding-standards.md`
- [ ] Check tech stack requirements: `~/.claude/projects/YOUR_PROJECT/tech-stack.md`
- [ ] Understand project architecture patterns
- [ ] Review existing codebase in affected areas

## Implementation Standards
Follow project-specific guidelines:
- Use established libraries and frameworks from tech-stack.md
- Follow naming conventions from coding-standards.md
- Align with architectural patterns in the existing codebase
- Write tests according to project testing strategy
```

#### Update Manager Agent:
Edit `~/.claude/commands/senior-manager-pr-review.md`:

```markdown
## Project Context Review
- [ ] Verify alignment with project charter and goals
- [ ] Check compliance with coding standards
- [ ] Ensure consistency with established tech stack
- [ ] Review impact on project timeline and resources

## Project-Specific Review Criteria
- Code quality meets our established standards
- Architecture aligns with project tech stack
- Performance meets project requirements
- Security follows project guidelines
```

### 4. Environment Variables

Set project-specific environment variables:

```bash
# Add to ~/.bashrc or ~/.zshrc
export CLAUDE_PROJECT_NAME="your-project-name"
export CLAUDE_PROJECT_DIR="$HOME/.claude/projects/$CLAUDE_PROJECT_NAME"
export CLAUDE_GITHUB_REPO="your-org/your-repo"
```

### 5. Enhanced Commands with Project Context

The workflow commands automatically incorporate project context:

#### cplan with Project Context:
```bash
cplan() {
    local issue="$1"
    if [[ -z "$issue" ]]; then
        echo "Usage: cplan <issue_number>"
        return 1
    fi
    
    # Gather project context
    local project_context=""
    if [[ -f "$CLAUDE_PROJECT_DIR/prd.md" ]]; then
        project_context="$project_context\n\nPROJECT PRD:\n$(cat $CLAUDE_PROJECT_DIR/prd.md)"
    fi
    if [[ -f "$CLAUDE_PROJECT_DIR/tech-stack.md" ]]; then
        project_context="$project_context\n\nTECH STACK:\n$(cat $CLAUDE_PROJECT_DIR/tech-stack.md)"
    fi
    
    # Execute with project context
    claude --prompt="$(cat ~/.claude/commands/product-owner-implementation-planning.md)" \
           --context="GitHub Issue #$issue$project_context" \
           --output="$CLAUDE_SCRATCHPAD_DIR/issue-$issue/planning-log.txt"
}
```

### 6. Project-Specific Templates

#### Issue Template for Your Project:
```markdown
# [PROJECT_NAME] Issue Template

## Problem Statement
What specific problem does this solve for [PROJECT_NAME]?

## User Story
As a [user type], I want [functionality] so that [benefit].

## Acceptance Criteria
- [ ] Criterion aligned with project goals
- [ ] Performance meets project standards
- [ ] Security follows project guidelines

## Technical Considerations
- Impact on existing [tech stack components]
- Dependencies within [project architecture]
- Testing strategy for [project testing framework]

## Business Value
How does this advance [project vision/goals]?
```

### 7. Continuous Integration

#### Add Project Validation:
Create `~/.claude/scripts/validate-project-alignment.sh`:

```bash
#!/bin/bash
# Validates that changes align with project standards

issue="$1"
issue_dir="$CLAUDE_SCRATCHPAD_DIR/issue-$issue"

echo "🔍 Validating alignment with project standards..."

# Check if PRD requirements are addressed
if grep -q "business objective" "$issue_dir/planning-log.txt"; then
    echo "✅ Business alignment verified"
else
    echo "⚠️  Business alignment unclear"
fi

# Check if tech stack is considered
if grep -q -f "$CLAUDE_PROJECT_DIR/tech-stack.md" "$issue_dir/development-log.txt"; then
    echo "✅ Tech stack alignment verified"
else
    echo "⚠️  Tech stack alignment unclear"
fi
```

## Quick Setup Commands

```bash
# 1. Set up your project
export PROJECT_NAME="my-awesome-project"
mkdir -p ~/.claude/projects/$PROJECT_NAME

# 2. Copy your project docs
cp /path/to/your/prd.md ~/.claude/projects/$PROJECT_NAME/
cp /path/to/your/tech-docs/* ~/.claude/projects/$PROJECT_NAME/

# 3. Update environment
echo "export CLAUDE_PROJECT_NAME=\"$PROJECT_NAME\"" >> ~/.bashrc
source ~/.bashrc

# 4. Test the integration
cplan 123  # Should now include your project context
```

## Best Practices

1. **Keep documents updated** - Project context is only as good as your docs
2. **Version control project docs** - Track changes to requirements
3. **Regular context review** - Ensure agents have current project state
4. **Team alignment** - All team members should use same project setup

With this setup, every workflow command will automatically incorporate your project's specific context, ensuring all AI agents work within your project's constraints and goals.