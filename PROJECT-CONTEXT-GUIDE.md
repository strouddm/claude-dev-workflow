# Project Context Integration Guide

## How Agents Find Project Details

The Claude Dev Workflow agents automatically locate and use project details through several mechanisms:

### 🔍 **Automatic Detection**

1. **Environment Variables** (Highest Priority):
   ```bash
   export CLAUDE_PROJECT_NAME="my-awesome-project"
   export CLAUDE_PROJECT_DIR="$HOME/.claude/projects/my-awesome-project"
   ```

2. **Git Repository Detection** (Fallback):
   - If no project is set, agents check current git repository name
   - Look for matching project in `~/.claude/projects/[repo-name]/`

3. **Manual Project Setup**:
   ```bash
   cproject my-awesome-project  # Creates project structure
   ```

### 📂 **Project Structure Expected**

```
~/.claude/projects/YOUR_PROJECT/
├── prd.md                 # Product Requirements Document
├── tech-stack.md          # Technical architecture
├── coding-standards.md    # Team coding conventions
└── project-charter.md     # Project goals and constraints
```

### 🤖 **How Each Agent Uses Context**

#### **Product Owner Agent (`cplan`)**
```bash
cplan 123
```
**Automatically includes**:
- **PRD** → Business requirements and user stories
- **Project Charter** → Goals, constraints, success metrics
- **Tech Stack** → Technical limitations and possibilities

#### **Engineer Agent (`cdev`)**
```bash
cdev 123
```
**Automatically includes**:
- **Tech Stack** → Required frameworks, libraries, patterns
- **Coding Standards** → Style guides, best practices
- **PRD** → Business context for implementation decisions

#### **Manager Agent (`creview`)**
```bash
creview 456 123
```
**Automatically includes**:
- **All project documents** → Complete context for review
- **Coding Standards** → Quality benchmarks
- **Project Charter** → Success criteria alignment

### ⚙️ **Setup Options**

#### **Option 1: Enhanced Installation (Recommended)**
```bash
# Use the enhanced installer
chmod +x ~/.claude/install-enhanced.sh
~/.claude/install-enhanced.sh
source ~/.bashrc

# Setup your project
cproject my-awesome-project
```

#### **Option 2: Manual Setup**
```bash
# Set environment variables
export CLAUDE_PROJECT_NAME="my-project"
export CLAUDE_PROJECT_DIR="$HOME/.claude/projects/my-project"

# Create project documents
mkdir -p "$CLAUDE_PROJECT_DIR"
cp ~/.claude/templates/project-documents/* "$CLAUDE_PROJECT_DIR/"

# Customize the templates for your project
```

#### **Option 3: Auto-Detection from Git**
```bash
# Navigate to your git repository
cd /path/to/your/project

# Create matching project folder
mkdir -p ~/.claude/projects/$(basename "$PWD")
cp ~/.claude/templates/project-documents/* ~/.claude/projects/$(basename "$PWD")/

# Commands will auto-detect project from git repo name
cplan 123  # Automatically uses project context
```

### 🔄 **Context Loading Process**

When you run any command, the system:

1. **Checks environment variables** for `CLAUDE_PROJECT_NAME`
2. **Falls back to git repo detection** if no project set
3. **Loads project documents** from `~/.claude/projects/[PROJECT]/`
4. **Injects context** into agent prompts automatically
5. **Shows confirmation**: "📋 Using project context: PROJECT_NAME"

### 📋 **Verification Commands**

```bash
# Check current project context
cstatus

# View what context is being used
echo "Project: $CLAUDE_PROJECT_NAME"
echo "Directory: $CLAUDE_PROJECT_DIR"
ls -la "$CLAUDE_PROJECT_DIR"

# Test context loading
cplan 123  # Should show "📋 Using project context: [PROJECT_NAME]"
```

### 🚨 **Troubleshooting**

#### **No Project Context Found**
```
ℹ️  No project context found. Set CLAUDE_PROJECT_NAME or run from project directory.
```
**Solutions**:
1. Run `cproject [name]` to setup project
2. Set environment variables manually
3. Ensure you're in correct git repository

#### **Missing Project Documents**
```bash
# Check what documents exist
ls -la "$CLAUDE_PROJECT_DIR"

# Copy missing templates
cp ~/.claude/templates/project-documents/* "$CLAUDE_PROJECT_DIR/"
```

#### **Wrong Project Context**
```bash
# Change active project
export CLAUDE_PROJECT_NAME="correct-project-name"
export CLAUDE_PROJECT_DIR="$HOME/.claude/projects/correct-project-name"

# Or setup new project
cproject correct-project-name
```

### 💡 **Best Practices**

1. **One Project Per Team**: Keep project contexts separate
2. **Keep Documents Updated**: Agents are only as good as your docs
3. **Version Control Project Docs**: Track changes to requirements
4. **Team Alignment**: Ensure all team members use same project setup

### 🔄 **Multiple Projects**

```bash
# Switch between projects
export CLAUDE_PROJECT_NAME="project-a"
cplan 123  # Uses project-a context

export CLAUDE_PROJECT_NAME="project-b"  
cplan 456  # Uses project-b context

# Or use different terminal sessions with different projects
```

This ensures every AI agent has complete project context automatically, making decisions that align with your specific project requirements, technical constraints, and business goals.