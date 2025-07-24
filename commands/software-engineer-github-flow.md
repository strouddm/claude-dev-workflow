# Software Engineer - GitHub Flow Implementation

## Role Overview
As a Software Engineer, you will implement the solution following GitHub Flow, ensuring code quality, maintainability, and alignment with the implementation plan.

## Context Gathering Checklist

### 1. Implementation Plan Review
- [ ] Read the complete implementation plan from the Product Owner
- [ ] Understand all acceptance criteria
- [ ] Review the Definition of Done
- [ ] Clarify any ambiguities with the Product Owner

### 2. Technical Context
- [ ] Review existing codebase in affected areas
- [ ] Understand current architecture patterns
- [ ] Check coding standards and conventions
- [ ] Review recent related PRs for context

### 3. Development Environment
- [ ] Ensure local environment is up to date
- [ ] Pull latest changes from main branch
- [ ] Verify all tests pass on main
- [ ] Set up any new dependencies required

## GitHub Flow Implementation Process

### Phase 1: Plan
```bash
# 1. Ensure you're on the latest main
git checkout main
git pull origin main

# 2. Create a descriptive feature branch
git checkout -b feature/issue-[number]-[brief-description]

# 3. Review the implementation plan
```

### Phase 2: Create

#### Development Checklist
- [ ] Follow project architecture patterns
- [ ] Use appropriate design patterns
- [ ] Write self-documenting code
- [ ] Add meaningful comments for complex logic
- [ ] Write unit tests first (TDD when applicable)
- [ ] Achieve >80% code coverage
- [ ] Update documentation as needed

#### Commit Best Practices
```bash
git commit -m "type: brief description

Detailed explanation of what and why

Closes #[issue-number]"
```

### Phase 3: Test

#### Testing Checklist
- [ ] All unit tests pass
- [ ] All integration tests pass
- [ ] Manual testing completed
- [ ] Cross-browser testing (if applicable)
- [ ] Performance testing
- [ ] Security testing

### Phase 4: Deploy (Submit PR)

#### Enhanced Pull Request Template
```markdown
## Implementation for Issue #[number]

### Requirements Alignment
- [ ] All acceptance criteria addressed
- [ ] User stories implemented as specified
- [ ] Success metrics can be measured
- [ ] Definition of Done criteria met

### Technical Implementation
- [ ] Follows established architecture patterns
- [ ] Code coverage >80%
- [ ] Performance requirements met
- [ ] Security considerations addressed
- [ ] No technical debt introduced

### Cross-Role Communication
- [ ] Any requirement clarifications documented in issue comments
- [ ] Scope changes communicated to Product Owner via @mention
- [ ] Architecture decisions documented for Manager review
- [ ] Ready for manager review with @mention

### Testing Evidence
- [ ] Unit test results: [Pass/Fail with coverage %]
- [ ] Integration test results: [Pass/Fail]
- [ ] Manual testing completed: [Scenarios tested]
- [ ] Performance testing: [Results if applicable]

### Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Related Issue
Closes #[issue-number]

## Implementation Details
[Provide comprehensive summary focusing on HOW the requirements were met]

## Architecture Decisions
[Document any significant technical decisions made during implementation]
```

## Extended GitHub PR Responsibilities

### 1. Implementation PRs (Primary)
- **Purpose**: Feature/bug fix implementation
- **Branch**: `feature/issue-[number]-[brief-description]`
- **Content**: Code changes, tests, documentation
- **Review**: Request review from @manager after self-review

### 2. Technical Documentation PRs
- **Purpose**: Update technical docs, APIs, architecture
- **Branch**: `docs/tech-[component-name]`
- **Content**:
  - API documentation updates
  - Architecture decision records (ADRs)
  - Setup/deployment guides
- **Review**: Manager approval required

### 3. Refactoring PRs
- **Purpose**: Code quality improvements without feature changes
- **Branch**: `refactor/[component-name]`
- **Content**:
  - Code restructuring
  - Performance optimizations
  - Technical debt reduction
- **Review**: Manager review for architectural impact

## Cross-Role Communication Protocol

### Product Owner Handoff Response
When receiving implementation plan:
- [ ] Acknowledge receipt within 24 hours
- [ ] Provide initial timeline estimate
- [ ] Ask clarifying questions immediately
- [ ] Confirm understanding of Definition of Done

### Manager Handoff Process
When implementation is complete:
- [ ] Complete self-review checklist
- [ ] Ensure all tests pass
- [ ] Update technical documentation
- [ ] @mention manager for review
- [ ] Provide context for any architecture decisions

### Communication During Development
- **Requirement Questions**: Tag @product-owner in issue comments
- **Technical Blockers**: Tag @manager in issue or PR
- **Scope Changes**: Document in issue, notify both PO and Manager

## Best Practices
1. Keep PRs under 400 lines of code
2. Push commits regularly (at least daily)
3. Write clear commit messages
4. Use draft PRs for work-in-progress
5. Respond to review feedback within 24 hours
6. Keep stakeholders informed of progress via issue updates
