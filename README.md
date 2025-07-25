# Claude Dev Workflow

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude CLI Required](https://img.shields.io/badge/requires-Claude%20CLI-blue)](https://docs.anthropic.com/claude/docs/claude-cli-quickstart)
[![GitHub Flow](https://img.shields.io/badge/workflow-GitHub%20Flow-green)](https://guides.github.com/introduction/flow/)

An AI-powered software development workflow that reduces development cycles from weeks to days by automating planning, implementation, and code review processes.

## Overview

Claude Dev Workflow transforms how software teams work by providing AI agents for each role in the development process:

- **Product Owner Agent**: Analyzes issues and creates detailed implementation plans
- **Software Engineer Agent**: Implements solutions following GitHub Flow
- **Senior Manager Agent**: Reviews PRs with comprehensive feedback

### Key Features

- **Faster development cycles**
- **Persistent scratchpad** maintains context between phases
- **Resume capability** for interrupted work
- **Progress tracking** across all active issues
- **One-command execution** for each phase

## Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Product Owner  │     │    Engineer     │     │    Manager      │
│      Agent      │────▶│     Agent       │────▶│     Agent       │
└─────────────────┘     └─────────────────┘     └─────────────────┘
         │                       │                        │
         ▼                       ▼                        ▼
    ┌─────────────────────────────────────────────────────────┐
    │                    Scratchpad System                    │
    │  Maintains context, enables resume, tracks progress     │
    └─────────────────────────────────────────────────────────┘
```

### Workflow Phases

1. **Planning Phase** (`cplan`)
   - Analyzes GitHub issue
   - Gathers requirements
   - Creates implementation plan
   - Saves to scratchpad

2. **Development Phase** (`cdev`)
   - Reads plan from scratchpad
   - Implements solution
   - Writes tests
   - Creates PR

3. **Review Phase** (`creview`)
   - Comprehensive code review
   - Security & performance analysis
   - Provides actionable feedback
   - Approves or requests changes

## Quick Start

### Prerequisites

- Claude CLI installed and configured
- GitHub CLI (`gh`) installed (optional but recommended)
- Bash shell (Linux/Mac/WSL)

### Installation (3 minutes)

```bash
# 1. Copy files
cp -r claude-dev-workflow/* ~/.claude/

# 2. Install workflow with project context support
chmod +x ~/.claude/install.sh
~/.claude/install.sh

# 3. Activate commands
source ~/.bashrc  # or ~/.zshrc

# 4. Setup your first project
cproject your-project-name

# 5. Test installation
chelp && cstatus
```

See `QUICK-START.md` for detailed walkthrough and `PROJECT-CONTEXT-GUIDE.md` for advanced project setup.

### Your First Issue (with Project Context)

```bash
# 1. Setup project context (one-time)
cproject my-awesome-app
# Edit ~/.claude/projects/my-awesome-app/*.md with your project details

# 2. Plan issue with automatic project context
cplan 123  # Uses your project's PRD, tech stack, standards

# 3. Develop following project guidelines  
cdev 123   # Follows your coding standards and architecture

# 4. Review against project requirements
creview 456 123  # Checks alignment with project goals
```

All commands automatically use your project context for consistent, aligned results.

## Commands Reference

| Command | Description | Example |
|---------|-------------|---------|
| `cproject <name>` | **Setup project context** | `cproject my-app` |
| `cplan <issue>` | Create implementation plan with project context | `cplan 123` |
| `cdev <issue>` | Develop following project standards | `cdev 123` |
| `creview <pr> [issue]` | Review against project requirements | `creview 456 123` |
| `cstatus` | Show project and workflow status | `cstatus` |
| `cview <issue>` | View issue scratchpad contents | `cview 123` |
| `chelp` | Show complete command help | `chelp` |

## File Structure

```
~/.claude/
├── commands/                     # Role-specific instructions
│   ├── product-owner-implementation-planning.md
│   ├── software-engineer-github-flow.md
│   ├── senior-manager-pr-review.md
│   └── logging-integration.md
├── scratchpad/                  # Persistent storage
│   └── issue-{NUMBER}/
│       ├── metadata.json        # Status tracking
│       ├── planning-log.txt     # Planning outputs
│       ├── development-log.txt  # Dev outputs
│       └── review-log.txt       # Review feedback
├── logs/                        # Activity tracking
│   ├── work-tracking.jsonl
│   ├── coordination.jsonl
│   ├── task-execution.jsonl
│   └── workflow-state.jsonl
└── templates/                   # Configuration templates
```
## Configuration

### Environment Variables

```bash
# Optional: Set custom scratchpad location
export CLAUDE_SCRATCHPAD_DIR="$HOME/my-scratchpad"

# Optional: Set verbosity
export CLAUDE_WORKFLOW_VERBOSE=1
```

### Customizing Instructions

Edit the instruction files in `~/.claude/commands/` to match your team's specific needs:

- Adjust review criteria
- Add company-specific standards
- Include custom checklists
- Modify templates

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Command not found" | Run `source ~/.bashrc` |
| "Claude: command not found" | Ensure Claude CLI is installed |
| "No plan found" | Run `cplan <issue>` first |
| Scratchpad permission errors | Check `~/.claude/` permissions |

## Security Considerations

- All data stored locally in `~/.claude/`
- No external services beyond Claude CLI
- GitHub access uses existing authentication
- Scratchpad can be encrypted if needed

## License

MIT License - see LICENSE file for details.
