# Claude Dev Workflow

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code Required](https://img.shields.io/badge/requires-Claude%20Code-blue)](https://docs.anthropic.com/en/docs/claude-code)
[![GitHub Flow](https://img.shields.io/badge/workflow-GitHub%20Flow-green)](https://guides.github.com/introduction/flow/)

An AI-powered software development workflow that reduces development cycles from weeks to days by providing specialized AI agents for planning, development, and code review - all contained within your project repository.

## Overview

Claude Dev Workflow transforms how software teams work by providing AI agents for each role in the development process, accessible through Claude Code slash commands:

- **Product Owner Agent** (`/plan`) - Analyzes issues and creates detailed implementation plans
- **Software Engineer Agent** (`/dev`) - Provides implementation guidance following project standards  
- **Senior Manager Agent** (`/review`) - Reviews PRs with comprehensive feedback

### Key Features

- **Project-local workflow** - Everything stays in your repository
- **Zero global installation** - Just add CLAUDE.md to your project
- **Version-controlled context** - Project standards evolve with your code
- **Persistent scratchpad** - Maintains context between workflow phases
- **Claude Code integration** - Native slash command support
- **Faster development cycles** - Reduces cycle time by 75-80%
- **Resume capability** - For interrupted work
- **Progress tracking** - Across all active issues

## Architecture

```
Project Repository
├── src/                     # Your application code
├── CLAUDE.md               # Workflow slash commands
├── workflow/               # Claude workflow data
│   ├── context/            # Project configuration (versioned)
│   │   ├── prd.md         # Product requirements
│   │   ├── tech-stack.md  # Technology decisions
│   │   ├── coding-standards.md
│   │   └── project-charter.md
│   ├── scratchpad/        # Issue work files (gitignored)
│   │   └── issue-123/
│   │       ├── plan.md
│   │       ├── development.md
│   │       └── review.md
│   ├── logs/              # Activity logs (gitignored)
│   └── epics/             # Epic-level planning
└── README.md
```

### Workflow Phases

1. **Planning Phase** (`/plan 123`)
   - Analyzes GitHub issue using project context
   - Creates implementation plan aligned with PRD
   - Saves to `./workflow/scratchpad/issue-123/plan.md`

2. **Development Phase** (`/dev 123`)
   - Reads plan and project standards
   - Provides step-by-step implementation guidance
   - Saves to `./workflow/scratchpad/issue-123/development.md`

3. **Review Phase** (`/review 456 123`)
   - Reviews PR against project requirements
   - Provides actionable feedback with priorities
   - Saves to `./workflow/scratchpad/issue-123/review.md`

## Quick Start

### Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed
- GitHub CLI (`gh`) installed (optional but recommended)
- Git repository initialized

### Setup (30 seconds)

1. **Add to your project**:
   ```bash
   # Copy CLAUDE.md to your project root
   curl -o CLAUDE.md https://raw.githubusercontent.com/your-repo/claude-dev-workflow/main/CLAUDE.md
   ```

2. **Initialize workflow**:
   ```bash
   # In Claude Code terminal
   /init
   ```

3. **Configure your project**:
   ```bash
   # Edit the generated context files
   code ./workflow/context/prd.md
   code ./workflow/context/tech-stack.md
   code ./workflow/context/coding-standards.md
   ```

### Your First Issue

```bash
# 1. Plan issue with project context
/plan 123

# 2. Get development guidance  
/dev 123

# 3. Review PR against requirements
/review 456 123

# 4. Check workflow status
/status
```

## Commands Reference

| Command | Description | Example |
|---------|-------------|---------|
| `/init` | Initialize workflow structure | `/init` |
| `/plan <issue>` | Create implementation plan | `/plan 123` |
| `/dev <issue>` | Get development guidance | `/dev 123` |
| `/review <pr> [issue]` | Review PR comprehensively | `/review 456 123` |
| `/status` | Show workflow status | `/status` |
| `/view <issue>` | View issue scratchpad | `/view 123` |
| `/epic <name>` | Create epic planning | `/epic user-auth` |

## File Structure

**Project Context (Version Controlled)**
```
workflow/context/
├── prd.md              # Product Requirements Document
├── tech-stack.md       # Technology Stack & Architecture
├── coding-standards.md # Code Style & Best Practices
└── project-charter.md  # Project Goals & Constraints
```

**Working Files (Git Ignored)**
```
workflow/
├── scratchpad/         # Issue-specific work
│   └── issue-123/
│       ├── plan.md     # Planning output
│       ├── development.md # Dev guidance
│       └── review.md   # Review feedback
├── logs/               # Activity tracking
└── epics/              # Epic-level planning
```

## Benefits

### For Managers
- **Real-time visibility** into all development work
- **Consistent quality** across team members
- **Automatic documentation** of decisions and rationale
- **Scalable process** that works for any team size

### For Developers
- **Clear requirements** for every issue
- **Faster feedback loops** with AI-powered reviews
- **Focus on coding** rather than process overhead
- **Consistent standards** across all development work

### For Organizations
- **Faster delivery cycles** with structured workflow
- **Reduced defects** through comprehensive reviews
- **Traceable decisions** with complete audit trail
- **Team knowledge sharing** through versioned context

## Advanced Usage

### Multiple Projects
Each repository maintains its own workflow context:
```bash
cd project-a && /plan 123  # Uses project-a context
cd project-b && /plan 456  # Uses project-b context
```

### Epic Planning
```bash
/epic user-authentication  # Creates epic planning document
```

### Team Collaboration
- Context files are version controlled and shared
- Scratchpad files can be shared for collaboration
- Logs provide team activity visibility
## Configuration

### Customizing Project Context

Edit these files to match your project:

```bash
./workflow/context/prd.md              # Product requirements
./workflow/context/tech-stack.md       # Technology choices  
./workflow/context/coding-standards.md # Development standards
./workflow/context/project-charter.md  # Goals and constraints
```

### Git Integration

The workflow automatically adds appropriate .gitignore entries:
```gitignore
# Claude Dev Workflow - ignore working files, keep context
workflow/logs/
workflow/scratchpad/
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Workflow not initialized" | Run `/init` in your project directory |
| "No plan found" | Run `/plan <issue>` first |
| "Missing context files" | Edit files in `./workflow/context/` |
| "Commands not working" | Ensure CLAUDE.md is in project root |

## Performance Impact

Based on real-world usage:

- **Planning**: 2 hours → 15 minutes (87% reduction)
- **Development guidance**: Immediate contextual help
- **Code review**: 4 hours → 30 minutes (87% reduction)
- **Overall cycle time**: 5-9 days → 1-2 days (75-80% reduction)

## Security & Privacy

- **All data local** - Everything stays in your repository
- **No external services** - Only uses Claude Code
- **Version controlled** - Project context tracked with your code
- **Team controlled** - You own all workflow data

## Migration from Shell Version

If upgrading from the shell-based version:

1. Copy `CLAUDE.md` to your project
2. Run `/init` to create new structure
3. Migrate context from `~/.claude/projects/` to `./workflow/context/`
4. Remove global installation: `rm -rf ~/.claude/`

## License

MIT License - see LICENSE file for details.

---

**Ready to transform your development workflow?** Add `CLAUDE.md` to your project and run `/init` to get started!
