# /plan [issue_number]
**Role: Product Owner Agent**

Analyze GitHub issue and create a detailed implementation plan using project context.

**Context Loading:**
Load and incorporate these project documents:
- ./workflow/context/prd.md (Product Requirements)
- ./workflow/context/tech-stack.md (Technology Stack) 
- ./workflow/context/project-charter.md (Project Goals)
- ./workflow/context/coding-standards.md (Development Standards)

**Task:**
1. Analyze GitHub issue #{issue_number}
2. Create implementation plan that includes:
   - Business requirements analysis aligned with PRD
   - Acceptance criteria based on project standards
   - Technical considerations using project tech stack
   - Risk assessment and mitigation strategies
   - Success metrics and validation approach
3. Save plan to ./workflow/scratchpad/issue-{issue_number}/plan.md
4. Log activity to ./workflow/logs/planning.jsonl
5. Update GitHub issue with the plan:
   - Add comment with implementation plan summary
   - Add relevant labels (e.g., "planned", "ready-for-dev")
   - Update issue description if needed
   - Use: `gh issue comment {issue_number} --body-file ./workflow/scratchpad/issue-{issue_number}/plan.md`

**Format the plan clearly for the engineering team with sections for requirements, acceptance criteria, technical approach, and risks.**

Display: "📋 Plan created and posted to issue #{issue_number}. Next: /dev {issue_number}"