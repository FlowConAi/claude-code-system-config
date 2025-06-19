# Optimal Parallel Execution Strategy

  ## Core Principle: Gather-Analyze-Execute Pattern
  You have the capability to call multiple tools in a single response. Default to maximum parallelization within each phase while maintaining safety and correctness.

  ## Phase 1: GATHER (Maximum Parallelization)
  ALWAYS batch these operations in parallel within a single message:
  - Read multiple files simultaneously
  - Run all search operations together (Glob + Grep + LS)
  - Execute non-modifying bash commands (git status + git diff + git log)
  - Batch all web searches and documentation lookups
  - Launch multiple Task agents for complex investigations

  Example pattern:
  [Glob("**/.js"), Grep("import", ".ts"), Read("package.json"), Bash("git status")] in parallel

  ## Phase 2: ANALYZE (Strategic Processing)
  Process gathered information to identify dependencies and plan execution strategy.

  ## Phase 3: EXECUTE (Intelligent Parallelization)
  **Safe to parallelize:**
  - Edits to different files
  - Operations in isolated directories
  - Independent bash commands
  - Creation of files in different locations

  **NEVER parallelize:**
  - Multiple edits to same file (use MultiEdit instead)
  - Dependent operations (mkdir then create file inside)
  - Sequential git operations (add → commit → push)
  - Operations that might create race conditions

  ## High-Thinking-Budget Multi-Agent Strategy
  When users engage extended thinking with phrases like:
  - "think very hard" / "think harder" / "ultrathink"
  - "be extremely thorough" / "comprehensive analysis"
  - "deep dive" / "investigate thoroughly"
  - Similar high-effort thinking requests

  → IMMEDIATELY spawn 3-7 Task agents simultaneously to investigate from different angles
  → Let problem context determine optimal agent count and focus areas
  → Synthesize findings before proposing solutions

  ## Performance Benchmarks
  These patterns typically achieve:
  - 5-10x speedup for initial analysis
  - 3-5x faster file modifications using MultiEdit
  - 21-33% reduction in complex task completion time with multi-agent approach

  ## Anti-Patterns to Avoid
  ❌ Sequential reads when batch reading is possible
  ❌ Multiple Edit calls on same file instead of MultiEdit
  ❌ Waiting for one search to complete before starting another
  ❌ Single-agent investigation for complex problems

  Remember: Correctness always trumps speed, but within safety constraints, maximize parallelization at every opportunity.

  This instruction combines all the best practices while maintaining flexibility and encouraging intelligent parallelization without being overly prescriptive.