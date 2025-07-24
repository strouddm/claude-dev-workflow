# Contributing to Claude Dev Workflow

We love your input! We want to make contributing to Claude Dev Workflow as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## We Develop with Github
We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

## We Use [Github Flow](https://guides.github.com/introduction/flow/index.html)
All code changes happen through pull requests:

1. Fork the repo and create your branch from `main`.
2. If you've added code that should be tested, add tests.
3. If you've changed APIs, update the documentation.
4. Ensure your code follows the existing style.
5. Make sure your code lints.
6. Issue that pull request!

## Any contributions you make will be under the MIT Software License
In short, when you submit code changes, your submissions are understood to be under the same [MIT License](http://choosealicense.com/licenses/mit/) that covers the project.

## Report bugs using Github's [issues](https://github.com/yourusername/claude-dev-workflow/issues)
We use GitHub issues to track public bugs. Report a bug by [opening a new issue](https://github.com/yourusername/claude-dev-workflow/issues/new).

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

## Contribution Areas

### 1. Agent Instructions
Improve the AI agent prompts in `commands/`:
- Product Owner planning templates
- Software Engineer implementation guides
- Manager review criteria

### 2. Project Templates
Enhance templates in `templates/project-documents/`:
- Industry-specific PRD templates
- Framework-specific tech stacks
- Language-specific coding standards

### 3. New Features
- Additional workflow commands
- Integration with other tools (Jira, GitLab, etc.)
- Performance monitoring
- Analytics dashboards

### 4. Documentation
- Improve installation guides
- Add more examples
- Create video tutorials
- Translate to other languages

### 5. Testing
- Add test coverage for commands
- Create integration tests
- Develop example projects

## Development Setup

1. Fork and clone the repository
2. Install Claude CLI following the [official guide](https://docs.anthropic.com/claude/docs/claude-cli-quickstart)
3. Run the installer: `./install.sh`
4. Create a test project: `cproject test-project`
5. Make your changes
6. Test thoroughly with real workflows

## Code Style

- Use clear, descriptive variable names
- Comment complex logic
- Follow existing patterns in the codebase
- Keep scripts POSIX-compliant when possible

## Pull Request Process

1. Update the README.md with details of changes if needed
2. Update the CHANGELOG.md with your changes
3. Increase version numbers if appropriate
4. The PR will be merged once you have approval from maintainers

## Community

- Join discussions in [GitHub Discussions](https://github.com/yourusername/claude-dev-workflow/discussions)
- Share your success stories
- Help others with installation and usage

## License
By contributing, you agree that your contributions will be licensed under its MIT License.