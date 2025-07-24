# Claude Dev Workflow - Quick Start Guide

## What This Does
Automates your development workflow with 3 AI agents that understand your project:
- Product Owner: Creates plans using your PRD and project goals
- Engineer: Implements code following your tech stack and standards  
- Manager: Reviews PRs against your project requirements

## 5-Minute Setup

### 1. Prerequisites
```bash
# Check you have these installed:
claude --version  # Claude CLI
gh --version      # GitHub CLI (optional)
```

### 2. Install Claude Dev Workflow
```bash
# Copy files
cp -r claude-dev-workflow/* ~/.claude/

# Install with project context support
chmod +x ~/.claude/install.sh
~/.claude/install.sh

# Activate commands
source ~/.bashrc  # or ~/.zshrc for zsh users
```

### 3. Setup Your Project
```bash
# Create project structure with templates
cproject my-awesome-app

# This creates:
# ~/.claude/projects/my-awesome-app/
# ├── prd.md              # Product requirements (EDIT THIS)
# ├── tech-stack.md       # Your technology choices (EDIT THIS)
# ├── coding-standards.md # Team coding rules (EDIT THIS)
# └── project-charter.md  # Goals and constraints (EDIT THIS)
```

### 4. Customize Project Documents
```bash
# Edit your project templates (IMPORTANT!)
code ~/.claude/projects/my-awesome-app/prd.md
code ~/.claude/projects/my-awesome-app/tech-stack.md
code ~/.claude/projects/my-awesome-app/coding-standards.md
```

### 5. Test Installation
```bash
# Should show your active project
cstatus

# Should show all commands with project context
chelp
```

## Your First Workflow

### Step 1: Plan (Product Owner Agent)
```bash
# Agent analyzes GitHub issue #123 using your project context
cplan 123

# You'll see: "Using project context: my-awesome-app"
# Creates plan aligned with your PRD and project goals
```

### Step 2: Develop (Engineer Agent)  
```bash
# Agent implements using your tech stack and coding standards
cdev 123

# Follows your architecture patterns and testing requirements
# Creates code that matches your team's conventions
```

### Step 3: Review (Manager Agent)
```bash
# Agent reviews PR #456 against your project requirements
creview 456 123

# Checks alignment with your coding standards and business goals
# Provides feedback based on your project criteria
```

## Key Benefits

### Automatic Project Context
- No manual context copying
- Agents know your tech stack, standards, and goals
- Consistent decisions across all team members

### Intelligent Workflow
- Plans reference your actual business requirements
- Code follows your established patterns
- Reviews check your specific quality standards

### Project Awareness
```bash
cstatus  # Shows active project and workflow status
```

## Multiple Projects

```bash
# Switch projects easily
cproject project-a
cplan 123  # Uses project-a context

cproject project-b  
cplan 456  # Uses project-b context
```

## Troubleshooting

### No Project Context Found
```
No project context found. Set CLAUDE_PROJECT_NAME or run from project directory.
```
**Solution**: Run `cproject [name]` to setup project structure

### Commands Not Found
```
command not found: cplan
```
**Solution**: Run `source ~/.bashrc` to activate commands

### Missing Project Documents
**Solution**: 
```bash
# Copy templates to your project
cp ~/.claude/templates/project-documents/* ~/.claude/projects/YOUR_PROJECT/
```

## Next Steps

- See `README.md` for complete documentation
- See `PROJECT-CONTEXT-GUIDE.md` for advanced project setup
- Edit your project documents to match your team's needs
- Start planning your first issue with `cplan [issue-number]`

---

You now have AI agents that understand your specific project and can make decisions aligned with your team's goals, tech stack, and standards.