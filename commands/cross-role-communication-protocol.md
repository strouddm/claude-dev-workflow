# Cross-Role Communication Protocol

## Overview
This document defines the communication standards, escalation procedures, and handoff protocols between Product Owner, Software Engineer, and Engineering Manager roles in the agentic coding framework.

## Communication Timelines

### Response Time Standards
- **Product Owner**: 4 hours during business hours
- **Software Engineer**: 24 hours for acknowledgments, 48 hours for estimates
- **Engineering Manager**: 24 hours for reviews, 2 hours for acknowledgments

### Business Hours Definition
- Monday-Friday, 9 AM - 6 PM local time
- Emergency escalations: Any time within 4 hours

## Handoff Protocols

### Product Owner → Engineer Handoff

#### Trigger: Implementation plan complete
1. **Product Owner Actions:**
   - [ ] Submit implementation plan PR to `plans/issue-[number]-implementation`
   - [ ] @mention engineer in GitHub issue
   - [ ] Set expectation for engineer response (24-48 hours)
   - [ ] Confirm availability for clarification questions

2. **Engineer Response Required:**
   - [ ] Acknowledge receipt within 24 hours
   - [ ] Provide initial timeline estimate
   - [ ] Ask clarifying questions immediately
   - [ ] Confirm understanding of Definition of Done

3. **Success Criteria:**
   - [ ] Engineer has timeline estimate
   - [ ] Any ambiguities resolved
   - [ ] Both parties agree on scope and DoD

### Engineer → Manager Handoff

#### Trigger: Implementation complete
1. **Engineer Actions:**
   - [ ] Complete self-review checklist
   - [ ] Ensure all tests pass (>80% coverage)
   - [ ] Update technical documentation
   - [ ] Submit PR with enhanced template
   - [ ] @mention manager for review

2. **Manager Response Required:**
   - [ ] Acknowledge PR receipt within 2 hours
   - [ ] Begin initial review within 24 hours
   - [ ] Complete detailed review within 48 hours
   - [ ] Provide actionable feedback

3. **Success Criteria:**
   - [ ] PR meets quality standards
   - [ ] All feedback addressed
   - [ ] Ready for merge/deployment

### Manager → Product Owner Communication

#### Trigger: Quality concerns or timeline impact
1. **Manager Actions:**
   - [ ] Document concern in GitHub issue/PR
   - [ ] @mention product owner
   - [ ] Provide recommended action
   - [ ] Set timeline for decision

2. **Product Owner Response:**
   - [ ] Respond within 4 hours
   - [ ] Make scope/priority decision
   - [ ] Communicate to stakeholders if needed

## Escalation Matrix

### Scope Change Requests
| Impact Level | Process | Timeline |
|--------------|---------|----------|
| **Minor** (<20% effort) | Engineer → PO via GitHub comment | 4 hours |
| **Major** (>20% effort) | Engineer → Manager → PO meeting | 24 hours |
| **Breaking** (Architecture change) | All roles sync meeting | 12 hours |

### Technical Disagreements
| Type | Process | Decision Maker |
|------|---------|----------------|
| **Implementation approach** | Engineer documents options → Manager decides | Manager |
| **Architecture impact** | Manager → Tech Lead consultation | Manager + Tech Lead |
| **Performance trade-offs** | Manager → PO for business input | PO with Manager input |

### Timeline Conflicts
| Delay Duration | Process | Communication |
|----------------|---------|---------------|
| **Short** (<2 days) | Engineer → Manager notification | Internal only |
| **Medium** (2-7 days) | Manager → PO → Stakeholder | Stakeholder notification |
| **Major** (>1 week) | Emergency all-roles meeting | Immediate escalation |

### Quality Standards Disputes
| Type | Process | Resolution |
|------|---------|------------|
| **Code quality** | Manager ↔ Engineer feedback loop | Manager final decision |
| **Requirements clarity** | Engineer → PO → Manager if needed | PO clarification |
| **Acceptance criteria** | PO → Manager → Stakeholder | Stakeholder decision |

## Communication Channels

### Primary: GitHub
- **Issues**: Requirement discussions, scope changes
- **PR Comments**: Technical feedback, implementation details
- **@mentions**: Direct communication and handoffs

### Secondary: Synchronous Meetings
- **Escalation triggers**: Major scope changes, timeline conflicts
- **Participants**: Relevant roles only (avoid all-hands for minor issues)
- **Duration**: 30 minutes maximum
- **Outcome**: Documented decision in GitHub

## Conflict Resolution

### Decision Authority Matrix
| Decision Type | Primary | Secondary | Escalation |
|---------------|---------|-----------|------------|
| **Business Requirements** | Product Owner | Manager | Stakeholder |
| **Technical Implementation** | Engineer | Manager | Tech Lead |
| **Quality Standards** | Manager | Product Owner | Team Lead |
| **Timeline/Scope Trade-offs** | Product Owner | Manager | Stakeholder |

### Resolution Process
1. **Identify**: Document the conflict in GitHub
2. **Escalate**: Follow decision authority matrix
3. **Decide**: Decision maker provides rationale
4. **Document**: Record decision and reasoning
5. **Communicate**: Notify all affected parties

## Success Metrics

### Communication Effectiveness
- Response time adherence: >90%
- Handoff completion rate: >95%
- Escalation resolution time: <24 hours average

### Process Quality
- Requirements clarification cycles: <3 per issue
- PR review cycles: <2 per implementation
- Scope changes: <20% of issues

### Team Satisfaction
- Cross-role communication rating: >4/5
- Process clarity rating: >4/5
- Conflict resolution satisfaction: >4/5

## Templates for Common Communications

### Scope Change Request
```markdown
## Scope Change Request - Issue #[number]

**Original Scope**: [Brief description]
**Proposed Change**: [What needs to change]
**Impact**: [Timeline/effort/resource impact]
**Rationale**: [Why this change is needed]
**Recommendation**: [Engineer's suggested approach]

@product-owner @manager - Decision needed by [date]
```

### Timeline Delay Notification
```markdown
## Timeline Update - Issue #[number]

**Original Timeline**: [Date]
**New Timeline**: [Date]
**Delay Duration**: [X days]
**Root Cause**: [Why delayed]
**Mitigation**: [What's being done]

@manager @product-owner - Stakeholder communication needed: [Yes/No]
```

### Quality Concern Escalation
```markdown
## Quality Concern - PR #[number]

**Concern**: [Description of quality issue]
**Impact**: [Potential consequences]
**Options**: 
1. [Option 1 with trade-offs]
2. [Option 2 with trade-offs]
**Recommendation**: [Preferred approach]

@manager - Decision needed for merge approval
```

## Review and Updates

This protocol should be reviewed monthly and updated based on:
- Team feedback
- Process metrics
- Changing project needs
- Tool availability

**Last Updated**: [Date]
**Next Review**: [Date + 1 month]