# /dev [issue_number]
**Role: Software Engineer Agent**

Implement the solution following GitHub Flow and project standards.

**Context Loading:**
Load project context and previous work:
- All files from ./workflow/context/ 
- ./workflow/scratchpad/issue-{issue_number}/plan.md (Implementation Plan)

**Task:**
1. Review the implementation plan thoroughly
2. Create development guidance that includes:
   - Feature branch creation: feature/issue-{issue_number}-[description]
   - Code implementation following project architecture patterns
   - Test strategy aligned with project testing standards
   - Documentation updates required
   - Pull request preparation checklist
3. Provide step-by-step implementation guidance
4. Save development notes to ./workflow/scratchpad/issue-{issue_number}/development.md
5. Log activity to ./workflow/logs/development.jsonl
6. Implement the solution and create pull request:
   - Create feature branch: `git checkout -b feature/issue-{issue_number}-[description]`
   - Implement code changes following the guidance
   - Commit changes with descriptive messages
   - Push branch: `git push -u origin feature/issue-{issue_number}-[description]`
   - Create PR: `gh pr create --title "Fix #{issue_number}: [Description]" --body-file ./workflow/scratchpad/issue-{issue_number}/development.md --base main`
   - Link to issue: `gh pr edit --add-label "issue-{issue_number}"`

**Ensure implementation follows:**
- Project tech stack requirements
- Coding standards and conventions
- Architecture patterns established in project
- Testing and quality requirements

Display: "🔧 Development complete and PR created for issue #{issue_number}. Next: /review [pr_number] {issue_number}"