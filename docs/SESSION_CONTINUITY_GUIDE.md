# 🔄 Session Continuity Guide

This guide ensures seamless continuation when Claude chat sessions reach their limit during development phases.

## Why Session Continuity Matters

Claude has conversation limits, and complex coding tasks often require multiple sessions. This guide provides a structured approach to maintain 200% continuity between sessions.

## Session State Files

### 1. SESSION_STATE.md
Each developer agent creates this file in their working directory:
- `/[project-path]/frontend/SESSION_STATE.md`
- `/[project-path]/backend/SESSION_STATE.md`

**Contents**:
```markdown
# Session State - [Current Date]

## Progress Summary
- Session Number: 3
- Total Components Created: 15/25
- Current Task: Implementing user authentication
- Last Completed: UserProfile component

## Pending Tasks (Priority Order)
1. Complete auth context implementation
2. Build login page component
3. Create protected route wrapper
4. Implement token refresh logic

## Blocking Issues
- Need clarification on password reset flow
- Waiting for designer input on error states

## Next Action
Continue with auth context implementation in src/contexts/AuthContext.tsx
```

### 2. IMPLEMENTATION_LOG.md
Chronological record of all work:
```markdown
# Implementation Log

## Session 1 - [Date]
- Created project structure
- Implemented Button, Input, Card components
- Set up routing configuration
- Created 5 test files

## Session 2 - [Date]
- Built navigation component
- Implemented homepage
- Created API service layer
- Added form validation utils

Files Modified:
- src/components/Navigation.tsx
- src/pages/HomePage.tsx
- src/services/api.ts
- src/utils/validation.ts
```

### 3. HANDOFF.md
Created at session end:
```markdown
# Session Handoff - [Current Date]

## Session Summary
Completed 8 components and 3 API integrations. 
Auth system 70% complete.

## Critical Context
- Using JWT with refresh tokens
- Password reset requires email service
- Admin routes need role checking

## Continue From Here
1. Open src/contexts/AuthContext.tsx
2. Complete the refreshToken method
3. Line 145 needs error handling

## Immediate Next Steps
1. Finish auth context
2. Test with frontend components
3. Implement protected routes

## Command to Resume
"Continue frontend implementation from SESSION_STATE.md, starting with auth context completion"
```

## Continuity Protocol

### Starting a New Session

1. **First Message Format**:
```
I need to continue the [Frontend/Backend] development from a previous session. 
Please read:
1. /[project-path]/[frontend|backend]/SESSION_STATE.md
2. /[project-path]/[frontend|backend]/IMPLEMENTATION_LOG.md
3. /[project-path]/[frontend|backend]/HANDOFF.md

Then continue from where we left off.
```

2. **Agent Response**:
- Acknowledges previous progress
- Confirms understanding of current state
- Continues from exact stopping point

### Mid-Development Checkpoints

Every 10 components or major feature:
1. Update SESSION_STATE.md
2. Commit progress to IMPLEMENTATION_LOG.md
3. Save all artifacts to filesystem
4. Update build-plan.md progress

### Approaching Session Limit

When Claude indicates session is ending:
1. Stop new feature development
2. Complete current component/function
3. Update all continuity files
4. Create detailed HANDOFF.md
5. List exact next steps

## Cross-Agent Continuity

### Frontend to Backend Handoff

Frontend Developer creates:
- `/[project-path]/docs/Frontend Developer/APIContracts.md`
- `/[project-path]/docs/Frontend Developer/DataModels.md`
- `/[project-path]/docs/Frontend Developer/FRONTEND_COMPLETE.md`

Backend Developer begins with:
```
I'm starting Backend development. Please read:
1. All Frontend Developer documents, especially APIContracts.md
2. The Frontend's expected data models
3. The authentication requirements

Then implement the backend to match Frontend's expectations exactly.
```

### Backend Integration Check

Backend Developer creates:
- `/[project-path]/INTEGRATION_TEST.md`
- Results of testing with Frontend
- Any API adjustments needed

## Emergency Recovery

If session ends abruptly without proper handoff:

1. **Recovery Command**:
```
Emergency recovery needed for [Frontend/Backend] development.
Please check the latest files in /[project-path]/[frontend|backend]/
and continue from the most recent code modifications.
```

2. **Agent Actions**:
- Scan recent file modifications
- Check partial implementations
- Resume from safe checkpoint
- Document gap in IMPLEMENTATION_LOG.md

## Best Practices

1. **Frequent Saves**: Use filesystem to save code every 3-5 components
2. **Descriptive Commits**: Update logs with clear descriptions
3. **Test Points**: Create restoration checkpoints after tests pass
4. **Knowledge Graph**: Store critical decisions and patterns
5. **Artifacts**: Use for all code to ensure it's saved

## Integration Continuity

When both Frontend and Backend are complete:

1. **Integration Session**:
```
Begin integration testing. Please read:
1. /[project-path]/docs/Frontend Developer/FRONTEND_COMPLETE.md
2. /[project-path]/docs/Backend Developer/BACKEND_COMPLETE.md
3. Run both applications and test API connections
```

2. **Document Results**:
- Create `/[project-path]/INTEGRATION_RESULTS.md`
- List any mismatches
- Document fixes needed
- Update both codebases

## Sample Continuity Commands

### Continue Frontend:
```
Continue frontend development from session 3. Read SESSION_STATE.md 
and implement the remaining auth components starting from AuthContext.tsx
```

### Continue Backend:
```
Resume backend API implementation. Check APIContracts.md progress 
and continue with the user endpoints that aren't yet implemented.
```

### Start Integration:
```
Begin frontend-backend integration. Both are complete individually. 
Test API connections and document any mismatches in INTEGRATION_RESULTS.md
```

## Success Metrics

Continuity is successful when:
1. New session picks up exactly where previous ended
2. No code is lost between sessions
3. Context is fully preserved
4. Integration works on first attempt
5. All tests pass across sessions

Remember: The key to continuity is documentation. When in doubt, over-document!
