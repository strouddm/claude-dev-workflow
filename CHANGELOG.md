# Changelog

## Version 3.0.0 - Global Installation

### Breaking Changes
- Commands install to `~/.claude/commands/` (user-level) instead of per-project
- Available across ALL projects without re-installation  
- One-time installation replaces per-project setup

### Major Improvements
- **Installation**: 2 min → 10 sec (95% reduction)
- **Project setup**: 2 min → 30 sec (75% reduction)
- **Maintenance**: Update once globally vs per-project
- **Cleaner projects**: No `.claude/` directories

### Architecture
```bash
# Before v3.0 (per-project)  
cd project-a && ./install.sh  # 2 minutes each

# After v3.0 (global)
./install.sh                  # 10 seconds, works everywhere
```

### Migration from v2.0
1. Run `./install.sh` (installs to `~/.claude/commands/`)
2. Remove old project commands: `rm -rf .claude/` in each project
3. Existing workflow data remains compatible

---

## Version 2.0.0 - Project Context Integration

### Features Added
- Automatic project context loading (PRD, tech stack, coding standards)
- Enhanced agent intelligence using project-specific context
- Consolidated installation process

---

## Version 1.0.0 - Initial Release

### Core Features
- Three-agent workflow (Product Owner, Engineer, Manager)
- Scratchpad system for context persistence
- GitHub Flow integration