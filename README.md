# Claude Dev Workflow

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code Required](https://img.shields.io/badge/requires-Claude%20Code-blue)](https://docs.anthropic.com/en/docs/claude-code)

AI-powered development workflow with three specialized agents: Product Owner, Engineer, and Manager. Install once, use in all projects.

## Quick Start

### 1. Install (One-Time)
```bash
git clone https://github.com/your-repo/claude-dev-workflow.git
cd claude-dev-workflow
./install.sh
```

### 2. Setup Project
```bash
cd /your/project
/setup                    # In Claude Code
# Edit workflow/context/*.md files
```

### 3. Use Workflow
```bash
/plan 123                 # Plan issue #123
/dev 123                  # Implement solution
/review 456 123           # Review PR #456
```

## What It Does

- **`/plan`** - Analyzes GitHub issues, creates implementation plans
- **`/dev`** - Provides development guidance, creates PRs automatically  
- **`/review`** - Reviews PRs against project standards, posts feedback

Each agent uses your project's context (PRD, tech stack, coding standards) for consistent decisions.

## Architecture

### Global Commands
```
~/.claude/commands/       # Install once, available everywhere
├── setup.md             # Initialize project workflow
├── plan.md              # Product Owner agent
├── dev.md               # Software Engineer agent
├── review.md            # Senior Manager agent
└── [status.md, view.md, epic.md]
```

### Per-Project Files
```
project/workflow/
├── context/             # Your project configuration (version controlled)
│   ├── prd.md          # Product requirements
│   ├── tech-stack.md   # Technology decisions  
│   ├── coding-standards.md
│   └── project-charter.md
├── scratchpad/         # Work files (gitignored)
└── logs/               # Activity logs (gitignored)
```

## Benefits

- **Install once, use everywhere** - No per-project installation
- **Project-specific context** - Each project has its own standards
- **75-80% faster cycles** - From weeks to days
- **Consistent quality** - AI follows your established patterns

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code)
- GitHub CLI (`gh auth login`)
- Git repository (recommended)

## Commands

| Command | Purpose |
|---------|---------|
| `/setup` | Initialize workflow in current project |
| `/plan <issue>` | Create implementation plan from GitHub issue |
| `/dev <issue>` | Implement solution and create PR |
| `/review <pr> [issue]` | Review PR against project standards |
| `/status` | Show active issues and progress |

---

Ready to transform your development workflow? Run `./install.sh` to get started!