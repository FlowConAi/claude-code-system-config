# TESTING EXCELLENCE GUIDE

Tests are the foundation of maintainable software. Write tests that give confidence, enable change, and document intent.

## CORE PRINCIPLES

### Test Behavior, Not Implementation
- Test public interfaces exclusively
- Focus on WHAT, not HOW
- Implementation should be free to change
- If testing private methods seems necessary, reconsider the design

### Write Honest Tests
- Never modify tests just to make them pass
- Face complexity directly - difficult tests often reveal design issues
- A failing test that exposes a real problem has value
- Tests that pass by avoiding the actual problem are worthless

### Follow TDD Rhythm
**Red**: Write a failing test for the desired behavior  
**Green**: Write minimal code to pass  
**Refactor**: Improve code while tests stay green  

Each phase has a purpose. Respect the rhythm.

## WHAT TO TEST

### Priority Order
1. **Business-critical logic** - The code that makes money or saves lives
2. **Complex algorithms** - Where bugs hide
3. **Error boundaries** - What happens when things go wrong
4. **Integration points** - Where systems meet
5. **Data transformations** - Where corruption occurs

### What NOT to Test
- Third-party code
- Language features  
- Simple delegation
- Private methods

## TESTING PATTERNS

### Structure: Arrange-Act-Assert
Clear test structure makes intent obvious. Setup context, execute behavior, verify outcomes.

### Naming: Document Behavior
Test names should explain what the system does, not how it's implemented. A good test name makes documentation redundant.

### Independence: No Shared State
Each test must stand alone. Test order shouldn't matter. Shared state is a source of flaky tests.

### Speed: Fast Feedback
Slow tests won't be run. If a test takes more than a few milliseconds, question why.

## ADVANCED CONSIDERATIONS

### Async Testing & Complex Mocking
Before creating custom solutions, always check if the framework/library provides native testing patterns:
- **Framework test utilities** often handle async complexity better than generic approaches
- **Official testing guides** usually exist for popular libraries
- **Mock libraries** may have specific integrations (e.g., pytest-asyncio, Jest's timer mocks)
- **Database/API test helpers** provided by the tools themselves

When native patterns exist, use them. They're designed for the specific challenges of that technology.

For async code specifically:
- Ensure tests properly await async operations
- Consider testing timeouts and error scenarios
- Be mindful of race conditions in tests
- Check if the testing framework has async-specific assertions

### Test Doubles
Use the simplest double that serves your purpose:
- **Stub**: When you need canned responses
- **Mock**: When you need to verify interactions
- **Fake**: When you need working behavior without complexity

When mocking:
- Mock at architectural boundaries (database, external APIs, file systems)
- Don't mock what you don't own - wrap third-party code instead
- Prefer real objects when they're fast and deterministic
- One mock per test keeps tests focused

### Property-Based Testing
When testing complex logic, consider testing properties that should always hold rather than specific examples.

### Integration vs Unit
Most tests should be unit tests. Integration tests verify that units work together. End-to-end tests verify critical paths. Balance accordingly.

## DECISION FRAMEWORK

Before writing a test, ask:
- Will this test catch real bugs?
- Can implementation change without breaking this test?
- Does the test name clearly express intent?
- Will failure messages guide fixes?

## ANTI-PATTERNS TO AVOID

- **Coupled Tests**: Break when implementation details change
- **Slow Tests**: Take seconds instead of milliseconds
- **Flaky Tests**: Sometimes pass, sometimes fail
- **Kitchen Sink Tests**: Test everything in one method
- **Excessive Mocking**: Mock only what you must

## REMEMBER
Good tests enable fearless refactoring. They document system behavior better than any comment. They catch bugs before users do.
