# /review [pr_number] [issue_number]
**Role: Senior Engineering Manager Agent**

Perform comprehensive code review against project standards and requirements.

**Context Loading:**
Load complete project context and workflow history:
- All files from ./workflow/context/
- ./workflow/scratchpad/issue-{issue_number}/plan.md (if issue_number provided)
- ./workflow/scratchpad/issue-{issue_number}/development.md (if issue_number provided)

**Task:**
1. Review GitHub PR #{pr_number} comprehensively
2. Check CI/CD status and test results:
   - Run: `gh pr checks {pr_number}`
   - Review failed checks and test results
   - Analyze build logs for warnings or issues
   - Check code coverage reports
3. Evaluate against project criteria:
   - Code quality meets coding standards
   - Architecture aligns with tech stack decisions
   - Security follows project guidelines
   - Performance meets project requirements
   - Tests are adequate per project standards
   - Documentation is complete and accurate
   - Alignment with original business requirements
   - CI/CD pipeline passes all checks
4. Provide specific, actionable feedback with priority levels:
   - **Must Fix** (blocking issues that prevent merge)
   - **Should Fix** (important improvements for code quality)
   - **Consider** (optional enhancements for future iterations)
5. Save review to ./workflow/scratchpad/issue-{issue_number}/review.md
6. Log activity to ./workflow/logs/review.jsonl
7. Post review to GitHub PR:
   - Add review comments: `gh pr review {pr_number} --comment --body-file ./workflow/scratchpad/issue-{issue_number}/review.md`
   - Add merge recommendation at the end of review:
     - ✅ **READY TO MERGE** - All checks pass, code quality excellent
     - 🔄 **NEEDS CHANGES** - Must fix issues before merge
     - ⚠️ **MERGE WITH CAUTION** - Minor issues but can proceed
   - Do NOT merge - only provide recommendation

Display: "📝 Review complete for PR #{pr_number} with merge recommendation. Check GitHub PR for detailed feedback."