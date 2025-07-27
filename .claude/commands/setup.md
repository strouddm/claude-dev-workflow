# /setup
Initialize the Claude Dev Workflow structure in this repository.

Create the following directory structure:
```
./workflow/
├── context/
│   ├── prd.md
│   ├── tech-stack.md
│   ├── coding-standards.md
│   └── project-charter.md
├── scratchpad/
├── logs/
└── epics/
```

Copy template content to context files from the templates section below. Create a .gitignore entry to ignore logs/ and scratchpad/ but keep context/ files versioned.

Display: "✅ Claude Dev Workflow initialized! Edit ./workflow/context/ files to configure your project."

## PRD Template (workflow/context/prd.md)
```markdown
# Product Requirements Document

## Project Overview
[Brief description of the project and its purpose]

## Target Users
[Who will use this product]

## Key Features
[List of main features and capabilities]

## Success Metrics
[How success will be measured]

## Constraints
[Technical, business, or resource constraints]

## Requirements
[Detailed functional and non-functional requirements]
```

## Tech Stack Template (workflow/context/tech-stack.md)
```markdown
# Technology Stack

## Frontend
[Frontend technologies, frameworks, libraries]

## Backend
[Backend technologies, frameworks, APIs]

## Database
[Database technology and structure decisions]

## Infrastructure
[Hosting, deployment, monitoring tools]

## Development Tools
[Build tools, testing frameworks, CI/CD]

## Architecture Patterns
[Design patterns and architectural decisions]
```

## Coding Standards Template (workflow/context/coding-standards.md)
```markdown
# Coding Standards

## Code Style
[Formatting, naming conventions, code organization]

## Best Practices
[Development practices, patterns to follow/avoid]

## Testing Requirements
[Unit testing, integration testing, coverage requirements]

## Documentation
[Code documentation, API documentation standards]

## Review Process
[Pull request requirements, review criteria]

## Quality Gates
[Linting, type checking, automated quality checks]
```

## Project Charter Template (workflow/context/project-charter.md)
```markdown
# Project Charter

## Project Mission
[What this project aims to achieve]

## Business Goals
[Business objectives and expected outcomes]

## Technical Goals
[Technical objectives and architectural goals]

## Timeline
[Key milestones and delivery dates]

## Team Structure
[Roles and responsibilities]

## Definition of Done
[Criteria for considering work complete]

## Risk Management
[Identified risks and mitigation strategies]
```

## Gitignore Addition

Add these lines to your .gitignore:
```
# Claude Dev Workflow - ignore working files, keep context
workflow/logs/
workflow/scratchpad/
```