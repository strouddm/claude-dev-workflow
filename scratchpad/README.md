# Scratchpad Directory

This directory maintains persistent state across workflow phases.

## Structure

For each GitHub issue, a subdirectory is created:

```
scratchpad/
└── issue-{NUMBER}/
    ├── metadata.json        # Status tracking
    ├── planning-log.txt     # Product Owner outputs
    ├── development-log.txt  # Engineer outputs  
    └── review-log.txt       # Manager feedback
```

## Usage

- **Automatically managed** by workflow commands
- **Maintains context** between interrupted sessions
- **Enables resume** functionality
- **Provides audit trail** of all decisions

## Example Metadata

```json
{
  "issue": "123",
  "status": "in_progress", 
  "phase": "development",
  "created": "2025-07-24T10:00:00Z",
  "updated": "2025-07-24T14:30:00Z",
  "agents": {
    "product_owner": "completed",
    "engineer": "in_progress", 
    "manager": "pending"
  }
}
```

This directory will be populated as you use the workflow commands.