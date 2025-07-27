# Quick Start Guide

## Install Once
```bash
git clone https://github.com/your-repo/claude-dev-workflow.git
cd claude-dev-workflow
./install.sh
```

Commands now available in **all** your projects.

## Setup New Project
```bash
cd /your/project
/setup                    # In Claude Code terminal
```

Edit these files:
- `workflow/context/prd.md` - Your product requirements
- `workflow/context/tech-stack.md` - Technology choices
- `workflow/context/coding-standards.md` - Code standards

## Use the Workflow

### 1. Plan Issue
```bash
/plan 123
```
- Reads your project context
- Creates implementation plan
- Posts plan to GitHub issue

### 2. Develop Solution  
```bash
/dev 123
```
- Follows the plan
- Implements code changes
- Creates GitHub PR automatically

### 3. Review Code
```bash
/review 456 123
```
- Reviews PR against your standards
- Checks CI/CD status
- Posts feedback to GitHub

## Multiple Projects
```bash
# Project A
cd project-a && /setup
/plan 123               # Uses project-a context

# Project B  
cd project-b && /setup  
/plan 456               # Uses project-b context
```

Each project has its own context and standards.

## All Commands

- `/setup` - Initialize workflow
- `/plan <issue>` - Plan implementation
- `/dev <issue>` - Develop solution
- `/review <pr> [issue]` - Review code
- `/status` - Show progress
- `/view <issue>` - View issue details

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code)
- GitHub CLI: `gh auth login`

---

**That's it!** Install once, then just `/setup` in each project.