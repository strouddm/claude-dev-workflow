# Coding Standards Template

## General Principles

### Code Quality
- **Readability**: Code should be self-documenting
- **Simplicity**: Prefer simple solutions over complex ones
- **Consistency**: Follow established patterns in the codebase
- **Maintainability**: Write code that's easy to modify and extend

## Language-Specific Standards

### JavaScript/TypeScript
```javascript
// Use const/let, never var
const apiUrl = 'https://api.example.com';
let currentUser = null;

// Function naming: camelCase with descriptive names
const getUserById = async (userId) => {
  // Implementation
};

// Use async/await over promises
const fetchUserData = async () => {
  try {
    const response = await fetch(apiUrl);
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch user data:', error);
    throw error;
  }
};
```

### Python
```python
# Import order: standard library, third-party, local
import os
import sys

import requests
from django.contrib.auth import authenticate

from .models import User
from .utils import format_date

# Function naming: snake_case
def get_user_by_id(user_id: int) -> User:
    """Fetch user by ID with proper type hints."""
    return User.objects.get(id=user_id)

# Class naming: PascalCase
class UserManager:
    """Manages user operations."""
    
    def __init__(self, api_client):
        self.api_client = api_client
```

## File Organization

### Directory Structure
```
src/
├── components/          # Reusable UI components
├── pages/              # Page-specific components
├── services/           # API calls and business logic
├── utils/              # Helper functions
├── types/              # Type definitions
└── __tests__/          # Test files
```

### File Naming
- **Components**: PascalCase (`UserProfile.jsx`)
- **Utilities**: camelCase (`formatDate.js`)
- **Constants**: UPPER_SNAKE_CASE (`API_ENDPOINTS.js`)
- **Types**: PascalCase (`UserTypes.ts`)

## Code Style

### Formatting
- **Indentation**: 2 spaces (JavaScript) / 4 spaces (Python)
- **Line Length**: Maximum 80-100 characters
- **Semicolons**: Always use in JavaScript
- **Quotes**: Single quotes for JavaScript, double quotes for Python

### Comments
```javascript
// Good: Explain WHY, not WHAT
// Cache user data to avoid repeated API calls
const cachedUser = memoize(fetchUser);

// Bad: Obvious comment
// Increment counter by 1
counter++;
```

## Error Handling

### JavaScript
```javascript
// Use try-catch for async operations
const saveUser = async (userData) => {
  try {
    const result = await api.saveUser(userData);
    return { success: true, data: result };
  } catch (error) {
    logger.error('Failed to save user:', error);
    return { success: false, error: error.message };
  }
};
```

### Python
```python
# Use specific exception types
def divide_numbers(a: float, b: float) -> float:
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

# Handle exceptions appropriately
try:
    result = divide_numbers(10, 0)
except ValueError as e:
    logger.warning(f"Division error: {e}")
    result = None
```

## Testing Standards

### Test Structure
```javascript
describe('UserService', () => {
  describe('getUserById', () => {
    it('should return user when valid ID provided', async () => {
      // Arrange
      const userId = 123;
      const expectedUser = { id: 123, name: 'John' };
      mockApi.getUser.mockResolvedValue(expectedUser);
      
      // Act
      const result = await getUserById(userId);
      
      // Assert
      expect(result).toEqual(expectedUser);
    });
  });
});
```

### Test Coverage
- **Minimum**: 80% code coverage
- **Critical Paths**: 100% coverage for business logic
- **Edge Cases**: Always test error conditions
- **Integration**: Test API integrations with mock data

## Git Commit Standards

### Commit Message Format
```
type(scope): brief description

Longer explanation if needed

- List specific changes
- Reference issue numbers: #123
```

### Commit Types
- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting)
- **refactor**: Code refactoring
- **test**: Adding or updating tests
- **chore**: Build process or auxiliary tool changes

### Examples
```
feat(auth): add two-factor authentication

Implements TOTP-based 2FA for enhanced security
- Add QR code generation for authenticator apps
- Update login flow to handle 2FA verification
- Add backup codes for account recovery

Fixes #234
```

## Security Guidelines

### Data Handling
- **Sanitize inputs**: Always validate and sanitize user input
- **Encrypt sensitive data**: Use proper encryption for passwords, tokens
- **Avoid logging secrets**: Never log passwords, API keys, or tokens
- **Use environment variables**: Store secrets in environment variables

### API Security
```javascript
// Good: Validate input
const updateUser = (userId, userData) => {
  if (!isValidUserId(userId)) {
    throw new Error('Invalid user ID');
  }
  
  const sanitizedData = sanitizeUserData(userData);
  return api.updateUser(userId, sanitizedData);
};
```

## Performance Guidelines

### Frontend
- **Bundle size**: Keep JavaScript bundles under 250KB
- **Image optimization**: Use WebP format, proper sizing
- **Lazy loading**: Implement for images and components
- **Caching**: Use appropriate cache headers

### Backend
- **Database queries**: Avoid N+1 queries, use proper indexing
- **API responses**: Paginate large datasets
- **Caching**: Implement Redis/Memcached for frequently accessed data
- **Monitoring**: Track response times and error rates

## Documentation Requirements

### Code Documentation
- **Functions**: Document complex functions with JSDoc/docstrings
- **APIs**: Maintain OpenAPI/Swagger documentation
- **README**: Keep project README updated
- **CHANGELOG**: Document all releases

### Example Documentation
```javascript
/**
 * Calculates user engagement score based on activity metrics
 * @param {Object} userActivity - User activity data
 * @param {number} userActivity.loginCount - Number of logins
 * @param {number} userActivity.pageViews - Total page views
 * @param {Date} userActivity.lastLoginDate - Last login timestamp
 * @returns {number} Engagement score between 0-100
 */
const calculateEngagementScore = (userActivity) => {
  // Implementation
};
```

## Review Checklist

Before submitting code for review:

- [ ] Code follows established style guidelines
- [ ] All tests pass locally
- [ ] Code coverage meets requirements
- [ ] No console.log or debug statements
- [ ] Error handling is implemented
- [ ] Documentation is updated
- [ ] Performance impact considered
- [ ] Security implications reviewed

---

**Last Updated**: [Date]
**Team Agreement**: All team members must follow these standards