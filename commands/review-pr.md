# Review Pull Request

This command performs a comprehensive code review of a pull request.

## Process

1. Examine the PR description to understand its purpose
2. Clone the repository if needed
3. Checkout the PR branch
4. Compare with the target branch
5. Review code changes for:
   - Bugs and errors
   - Performance issues
   - Code style and maintainability
   - Test coverage
   - Documentation
6. Generate a comprehensive review report

## Arguments

If a PR number or URL is provided as $ARGUMENTS, use that specific PR.
Otherwise, review the current branch against its target branch.