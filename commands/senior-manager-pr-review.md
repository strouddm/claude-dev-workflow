# Senior Software Manager - PR Review & Merge

## Role Overview
As a Senior Software Manager, you ensure code quality, mentor team members through constructive feedback, and maintain the integrity of the codebase while facilitating rapid delivery.

## Context Gathering Checklist

### 1. PR Context
- [ ] Read the original GitHub issue
- [ ] Review the implementation plan
- [ ] Understand the business value and urgency
- [ ] Check PR against acceptance criteria

### 2. Technical Context
- [ ] Review the architectural impact
- [ ] Assess technical debt implications
- [ ] Consider scalability and performance
- [ ] Evaluate security implications

### 3. Team Context
- [ ] Consider the author's experience level
- [ ] Review team's current workload
- [ ] Identify learning opportunities
- [ ] Check for knowledge silos

## Review Process

### Phase 1: Initial Assessment
- [ ] PR size is manageable (<400 lines)
- [ ] CI/CD checks are passing
- [ ] PR description is complete
- [ ] Related issue is properly linked
- [ ] No obvious security concerns

### Phase 2: Detailed Code Review

#### Review Checklist
1. **Functionality**: Code fulfills requirements
2. **Design**: Follows established patterns
3. **Quality**: Readable and maintainable
4. **Testing**: Adequate coverage
5. **Performance**: No obvious bottlenecks
6. **Security**: No vulnerabilities

## Providing Feedback

### Feedback Framework
- 🔴 **Must Fix**: Blocking issues
- 🟡 **Should Fix**: Important improvements
- 🟢 **Consider**: Optional enhancements
- 💡 **Learning**: Educational points
- 👍 **Praise**: Positive reinforcement

### Constructive Feedback Examples
```markdown
Instead of: "This code is messy"
Write: "This function handles multiple responsibilities. Consider splitting into:
1. Data validation
2. Business logic
3. Data persistence"
```

## Approval and Merge Process

### Pre-Merge Checklist
- [ ] All CI/CD checks pass
- [ ] All blocking comments addressed
- [ ] Test coverage meets standards
- [ ] Documentation is updated
- [ ] No merge conflicts

### Post-Merge Actions
- [ ] Monitor deployment
- [ ] Notify stakeholders
- [ ] Document learnings

## GitHub PR Responsibilities

### 1. Process Improvement PRs
- **Purpose**: Update team processes, templates, guidelines
- **Branch**: `process/[improvement-name]`
- **Content**:
  - Updated coding standards
  - Review process improvements
  - Team workflow optimizations
- **Review**: Team input before implementation

### 2. Post-Review Documentation PRs
- **Purpose**: Document decisions and learnings from reviews
- **Branch**: `docs/review-decisions-[date]`
- **Content**:
  - Architecture decisions made during reviews
  - Team learning documentation
  - Process refinements
- **Review**: Self-approved with team notification

### 3. Quality Gate Updates
- **Purpose**: Modify CI/CD, testing requirements, quality standards
- **Branch**: `quality/[standard-name]`
- **Content**:
  - Updated CI/CD configurations
  - New quality metrics
  - Testing requirement changes
- **Review**: Engineer review for technical feasibility

### Manager PR Template:
```markdown
## Process/Quality Improvement

### Improvement Rationale
- Problem addressed: [Description]
- Expected benefit: [Team/quality impact]
- Metrics to track: [How we'll measure success]

### Implementation
- [ ] Team communication completed
- [ ] Training materials updated
- [ ] Rollout plan defined

### Review Criteria
- [ ] No negative impact on delivery speed
- [ ] Improves code quality/team efficiency
- [ ] Sustainable long-term

### Cross-Role Impact
- [ ] Product Owner informed of process changes
- [ ] Engineers trained on new standards
- [ ] Stakeholders notified of timeline implications
```

## Cross-Role Communication Protocol

### Product Owner Communication
- **Requirements Changes**: Provide feedback within 4 hours
- **Timeline Impact**: Communicate delays immediately
- **Quality Concerns**: Escalate blocking issues within 24 hours
- **Stakeholder Updates**: Weekly status on all active PRs

### Engineer Communication
- **Review Timeline**: Provide feedback within 24 hours
- **Mentoring Opportunities**: Identify learning moments in reviews
- **Technical Decisions**: Document rationale for future reference
- **Performance Issues**: Address constructively with actionable feedback

### Review Response Protocol
1. **Immediate Response** (<2 hours): Acknowledge PR submission
2. **Initial Review** (<24 hours): First pass technical review
3. **Detailed Feedback** (<48 hours): Complete review with actionable items
4. **Follow-up** (<24 hours): Review addressed feedback

## Best Practices
1. Balance speed with quality
2. Foster learning culture
3. Maintain consistency
4. Empower the team
5. Ensure cross-role transparency
6. Document decisions for future reference
