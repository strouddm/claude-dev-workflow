# Project Documents Templates

This directory contains templates for setting up project-specific context in the Claude Dev Workflow.

## Quick Setup

1. **Copy templates to your project directory**:
   ```bash
   export PROJECT_NAME="your-project-name"
   mkdir -p ~/.claude/projects/$PROJECT_NAME
   cp templates/project-documents/* ~/.claude/projects/$PROJECT_NAME/
   ```

2. **Customize each template** with your project's information

3. **Update environment variables**:
   ```bash
   echo "export CLAUDE_PROJECT_NAME=\"$PROJECT_NAME\"" >> ~/.bashrc
   source ~/.bashrc
   ```

## Template Files

- `prd-template.md` - Product Requirements Document
- `tech-stack-template.md` - Technical architecture and tools
- `coding-standards-template.md` - Team coding conventions  
- `project-charter-template.md` - Goals, constraints, and success metrics

## Usage

Once set up, all workflow commands (`cplan`, `cdev`, `creview`) will automatically incorporate your project context, ensuring consistent alignment with your project's goals and technical standards.