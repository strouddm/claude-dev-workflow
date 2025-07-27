# /status
Show current workflow status and active issues.

**Task:**
1. Display current repository name
2. Check if workflow is initialized (./workflow/ exists)
3. List active issues in ./workflow/scratchpad/ with status:
   - [P] = plan.md exists
   - [D] = development.md exists  
   - [R] = review.md exists
4. Show recent activity from logs

**Example Output:**
```
Workflow Status for: my-awesome-app
✅ Initialized

Active Issues:
  Issue #123: [P][D] 
  Issue #124: [P]
  Issue #125: [P][D][R]
```