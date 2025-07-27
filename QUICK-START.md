# Claude Dev Workflow - Quick Start Guide

## What This Does
Transforms your development process with AI agents that understand your project context, accessible through Claude Code slash commands. No global installation required - everything stays in your repository.

**Three AI Agents:**
- **Product Owner** (`/plan`) - Creates implementation plans using your PRD
- **Engineer** (`/dev`) - Provides development guidance following your standards  
- **Manager** (`/review`) - Reviews code against your project requirements

## Prerequisites

- Claude Code installed
- GitHub CLI (`gh`) installed and authenticated:
  ```bash
  # Install GitHub CLI (if needed)
  brew install gh  # macOS
  # or see: https://cli.github.com/
  
  # Authenticate with GitHub
  gh auth login
  ```

## 1-Minute Setup

### Step 1: Add to Your Project
```bash
# Copy CLAUDE.md to your project root
curl -o CLAUDE.md https://raw.githubusercontent.com/your-repo/claude-dev-workflow/main/CLAUDE.md

# Or download and copy manually
```

### Step 2: Initialize Workflow
```bash
# Open your project in Claude Code
# Run in the terminal:
/init
```

This creates:
```
workflow/
├── context/            # Project configuration (version controlled)
│   ├── prd.md         # Product Requirements (EDIT THIS)
│   ├── tech-stack.md  # Technology Stack (EDIT THIS)
│   ├── coding-standards.md # Coding Standards (EDIT THIS)
│   └── project-charter.md # Project Goals (EDIT THIS)
├── scratchpad/        # Issue work files (git ignored)
├── logs/              # Activity logs (git ignored)
└── epics/             # Epic planning
```

### Step 3: Configure Your Project
```bash
# Edit these files to match your project:
code ./workflow/context/prd.md
code ./workflow/context/tech-stack.md
code ./workflow/context/coding-standards.md
code ./workflow/context/project-charter.md
```

**Important:** The agents are only as good as your project documentation!

## Your First Issue

### Planning Phase
```bash
# Analyze GitHub issue #123 using your project context
/plan 123
```
**What happens:**
- Agent reads your PRD, tech stack, and project goals
- Creates detailed implementation plan
- Saves to `./workflow/scratchpad/issue-123/plan.md`
- **Updates GitHub issue with plan and adds "ready-for-dev" label**
- Shows: "📋 Plan created and posted to issue #123"

### Development Phase  
```bash
# Implement solution and create PR
/dev 123
```
**What happens:**
- Agent reads the plan and your coding standards
- Implements the solution following guidance
- Creates feature branch and commits changes
- **Automatically creates GitHub PR linked to issue**
- Shows: "🔧 Development complete and PR created"

### Review Phase
```bash
# Review PR #456 comprehensively against your project
/review 456 123
```
**What happens:**
- Agent reviews the PR using your project context
- **Checks CI/CD pipeline status and test results**
- Provides prioritized feedback (Must Fix, Should Fix, Consider)
- **Posts review to GitHub with merge recommendation**
- Shows: "📝 Review complete with merge recommendation"

## Checking Your Progress

```bash
# See workflow status
/status

# View all files for an issue
/view 123
```

**Example Status Output:**
```
Workflow Status for: my-awesome-app
✅ Initialized

Active Issues:
  Issue #123: [P][D][R]  # Plan, Development, Review complete
  Issue #124: [P]        # Only planning done
  Issue #125: [P][D]     # Plan and development done
```

## Key Benefits

### 🚀 **Instant Context**
- No manual copying of requirements
- Agents automatically know your tech stack
- Consistent decisions across all team members

### 📝 **Persistent Knowledge**
- All work saved in scratchpad files
- Easy to resume interrupted work
- Complete audit trail of decisions

### 🔄 **Version Controlled**
- Project context evolves with your code
- Team shares same standards and requirements
- No global state to manage

### ⚡ **Zero Setup Overhead**
- No installation scripts or global configuration
- Just add CLAUDE.md and run `/init`
- Works immediately in any Claude Code project

## Working with Multiple Projects

Each project has its own context:

```bash
# Project A
cd project-a
/plan 123  # Uses project-a's context and standards

# Project B  
cd project-b
/plan 456  # Uses project-b's context and standards
```

## Advanced Features

### Epic Planning
```bash
/epic user-authentication  # Creates epic-level planning document
```

### Team Collaboration
- Context files are version controlled and shared
- Scratchpad files can be committed for collaboration
- Logs provide team activity visibility

## File Organization

**What gets version controlled:**
```
workflow/context/  # Your project configuration
CLAUDE.md         # The workflow commands
```

**What gets ignored by git:**
```
workflow/logs/        # Activity logs
workflow/scratchpad/  # Work files (unless you want to share them)
```

## Troubleshooting

### "Workflow not initialized"
**Solution:** Run `/init` in your project directory

### "No plan found for issue"
**Solution:** Run `/plan <issue_number>` first

### "Context files missing"
**Solution:** Edit the files in `./workflow/context/` with your project details

### Commands not working
**Solution:** Ensure `CLAUDE.md` is in your project root directory

## Best Practices

1. **Keep context updated** - Your agents are only as good as your documentation
2. **Commit context files** - Share standards across your team
3. **Review scratchpad files** - They contain valuable planning and decisions
4. **Use descriptive issue numbers** - Makes tracking easier

## What's Different from Traditional Workflows

**Traditional:**
- Manual context switching
- Inconsistent decision making
- Lost knowledge between phases
- Global configuration headaches

**Claude Dev Workflow:**
- Automatic context loading
- Consistent AI-powered decisions
- Persistent knowledge in scratchpad
- Zero global configuration

---

**Ready to start?** Copy `CLAUDE.md` to your project and run `/init`!

Your first planning session is just `/plan [issue-number]` away.