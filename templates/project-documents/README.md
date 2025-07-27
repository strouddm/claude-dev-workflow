# Project Document Templates

Templates for project-specific context in Claude Dev Workflow.

## Usage

These templates are automatically copied when you run `/setup` in any project.

## Template Files

- **prd-template.md** - Product Requirements Document
- **tech-stack-template.md** - Technical architecture and technology choices
- **coding-standards-template.md** - Team coding conventions and standards
- **project-charter-template.md** - Project goals, constraints, and success metrics

## Customization

After running `/setup`, edit the files in your project's `workflow/context/` directory:

```bash
cd your-project
/setup                           # Creates workflow/context/ with templates
code workflow/context/prd.md    # Customize for your project
code workflow/context/tech-stack.md
code workflow/context/coding-standards.md
code workflow/context/project-charter.md
```

These files provide context to all workflow agents (`/plan`, `/dev`, `/review`) ensuring consistent decisions aligned with your project standards.