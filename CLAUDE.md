# Claude Dev Workflow Commands

Global installation puts commands in `~/.claude/commands/` - available in all projects.

## Installation
```bash
git clone https://github.com/your-repo/claude-dev-workflow.git
cd claude-dev-workflow  
./install.sh
```

## Commands

### /setup
Initialize workflow in current project. Creates `workflow/` directory with context files.

### /plan [issue_number]  
Analyze GitHub issue and create implementation plan using project context.

### /dev [issue_number]
Implement solution following the plan and create GitHub PR.

### /review [pr_number] [issue_number]
Review PR against project standards and post feedback to GitHub.

### /status
Show workflow status and active issues.

### /view [issue_number]  
Display workflow files for specific issue.

### /epic [epic_name]
Create epic-level planning document.

## Usage Flow
1. Install once globally: `./install.sh`
2. Per project: `cd project && /setup`  
3. Configure: Edit `workflow/context/*.md`
4. Use: `/plan 123` → `/dev 123` → `/review 456 123`