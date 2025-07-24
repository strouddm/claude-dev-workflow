# Workflow Logging Integration

## Overview
This document defines how each agent integrates comprehensive logging into their workflow processes.

## Logging Integration Points

### Product Owner Agent (`cplan`)

#### Before Planning:
```bash
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "issue_id": "'$ISSUE'", "agent": "PRODUCT_OWNER", "action": "start_planning", "status": "in_progress", "duration_ms": 0, "context": {"phase": "planning"}, "metadata": {"command": "cplan"}}' >> ~/.claude/logs/work-tracking.jsonl
```

#### During Context Gathering:
```bash
# For each sub-agent task
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "agent": "PRODUCT_OWNER", "issue_id": "'$ISSUE'", "task_id": "vision-'$TASK_ID'", "task_type": "context_gathering", "phase": "planning", "command": "gather_vision_context", "tools_used": ["Read", "WebFetch"], "input": {"issue": "'$ISSUE'"}, "output": {"status": "completed"}, "success": true, "error": null}' >> ~/.claude/logs/task-execution.jsonl
```

#### After Planning:
```bash
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "issue_id": "'$ISSUE'", "agent": "PRODUCT_OWNER", "action": "complete_planning", "status": "completed", "duration_ms": '$DURATION', "context": {"requirements_created": true}, "metadata": {"plan_file": "scratchpad/issue-'$ISSUE'/plan.md"}}' >> ~/.claude/logs/work-tracking.jsonl
```

#### Coordination Handoff:
```bash
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "type": "handoff", "from_agent": "PRODUCT_OWNER", "to_agent": "ENGINEER", "issue_id": "'$ISSUE'", "message": "Implementation plan ready", "payload": {"plan_location": "scratchpad/issue-'$ISSUE'/plan.md", "status": "ready_for_development"}, "status": "success"}' >> ~/.claude/logs/coordination.jsonl
```

### Software Engineer Agent (`cdev`)

#### Before Development:
```bash
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "issue_id": "'$ISSUE'", "agent": "ENGINEER", "action": "start_development", "status": "in_progress", "duration_ms": 0, "context": {"phase": "development", "branch": "'$BRANCH'"}, "metadata": {"command": "cdev"}}' >> ~/.claude/logs/work-tracking.jsonl
```

#### During Implementation:
```bash
# Git operations
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "agent": "ENGINEER", "issue_id": "'$ISSUE'", "task_id": "git-'$TASK_ID'", "task_type": "git_operation", "phase": "development", "command": "git checkout -b feature/issue-'$ISSUE'", "tools_used": ["Bash"], "input": {"branch": "feature/issue-'$ISSUE'"}, "output": {"branch_created": true}, "success": true, "error": null}' >> ~/.claude/logs/task-execution.jsonl

# Code changes
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "agent": "ENGINEER", "issue_id": "'$ISSUE'", "task_id": "code-'$TASK_ID'", "task_type": "code_implementation", "phase": "development", "command": "implement_feature", "tools_used": ["Edit", "Write"], "input": {"files": ["'$FILES'"]}, "output": {"files_modified": '$FILE_COUNT'}, "success": true, "error": null}' >> ~/.claude/logs/task-execution.jsonl
```

#### After PR Creation:
```bash
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "type": "handoff", "from_agent": "ENGINEER", "to_agent": "MANAGER", "issue_id": "'$ISSUE'", "message": "PR ready for review", "payload": {"pr_number": "'$PR_NUMBER'", "branch": "'$BRANCH'", "files_changed": '$FILE_COUNT'}, "status": "success"}' >> ~/.claude/logs/coordination.jsonl
```

### Senior Manager Agent (`creview`)

#### Before Review:
```bash
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "issue_id": "'$ISSUE'", "agent": "MANAGER", "action": "start_review", "status": "in_progress", "duration_ms": 0, "context": {"phase": "review", "pr_number": "'$PR'"}, "metadata": {"command": "creview"}}' >> ~/.claude/logs/work-tracking.jsonl
```

#### During Review:
```bash
# Security check
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "agent": "MANAGER", "issue_id": "'$ISSUE'", "task_id": "security-'$TASK_ID'", "task_type": "security_review", "phase": "review", "command": "security_analysis", "tools_used": ["Grep", "Read"], "input": {"pr": "'$PR'"}, "output": {"security_issues": '$SECURITY_COUNT'}, "success": true, "error": null}' >> ~/.claude/logs/task-execution.jsonl
```

#### After Review:
```bash
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "issue_id": "'$ISSUE'", "agent": "MANAGER", "action": "complete_review", "status": "completed", "duration_ms": '$DURATION', "context": {"approval_status": "'$STATUS'"}, "metadata": {"feedback_items": '$FEEDBACK_COUNT', "review_file": "scratchpad/issue-'$ISSUE'/review-log.txt"}}' >> ~/.claude/logs/work-tracking.jsonl
```

## State Transitions

### Workflow State Changes:
```bash
# Planning → Development
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "issue_id": "'$ISSUE'", "old_state": "planning", "new_state": "development", "trigger": "plan_completed", "agent": "PRODUCT_OWNER", "context": {"plan_ready": true}}' >> ~/.claude/logs/workflow-state.jsonl

# Development → Review  
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "issue_id": "'$ISSUE'", "old_state": "development", "new_state": "review", "trigger": "pr_created", "agent": "ENGINEER", "context": {"pr_number": "'$PR'"}}' >> ~/.claude/logs/workflow-state.jsonl

# Review → Complete
echo '{"timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'", "issue_id": "'$ISSUE'", "old_state": "review", "new_state": "completed", "trigger": "pr_approved", "agent": "MANAGER", "context": {"approved": true}}' >> ~/.claude/logs/workflow-state.jsonl
```

## Log Analysis Commands

### View Current Work Status:
```bash
# Active issues
jq -r 'select(.status == "in_progress") | "\(.issue_id): \(.agent) - \(.action)"' ~/.claude/logs/work-tracking.jsonl

# Recent handoffs
tail -5 ~/.claude/logs/coordination.jsonl | jq -r '"\(.from_agent) → \(.to_agent): \(.message)"'
```

### Performance Metrics:
```bash
# Average time per phase
jq -r 'select(.status == "completed") | "\(.agent),\(.duration_ms)"' ~/.claude/logs/work-tracking.jsonl | awk -F, '{sum[$1]+=$2; count[$1]++} END {for(agent in sum) print agent": "sum[agent]/count[agent]"ms avg"}'
```

### Error Analysis:
```bash
# Failed tasks
jq -r 'select(.success == false) | "\(.timestamp): \(.agent) - \(.error)"' ~/.claude/logs/task-execution.jsonl
```

## Integration with Existing Commands

The logging system integrates seamlessly with existing workflow commands by:

1. **Auto-logging**: Each command automatically logs start/end states
2. **Context preservation**: All logs reference issue IDs for traceability  
3. **Tool tracking**: Every tool use is logged with inputs/outputs
4. **Performance monitoring**: Duration tracking for optimization
5. **Error handling**: Failed operations are logged with context

This provides complete visibility into work progress, coordination effectiveness, and task execution performance across the entire workflow.