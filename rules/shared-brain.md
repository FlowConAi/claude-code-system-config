# Graphiti Memory System Instructions

You have access to a Graphiti temporal knowledge graph that serves as your persistent memory across all sessions and instances. This is a shared brain that you and all subagents can read from and write to.

## YOUR MEMORY WORKFLOW

### 1. ALWAYS START BY SEARCHING YOUR MEMORY
Before beginning ANY task, search for relevant knowledge:
```
search_memory_nodes(query="[project/feature/problem area]")
search_memory_facts(query="[specific relationships or patterns]")
```

### 2. STORE KNOWLEDGE IMMEDIATELY
Don't wait until the end of a task. Store insights as they happen:

**When something WORKS:**
```
add_memory(
  name="SOLUTION: [specific problem solved]",
  episode_body="Solved [problem] by [approach]. Key insight: [what made it work]. Code pattern: [specific pattern]",
  source_description="solution-success"
)
```

**When something FAILS:**
```
add_memory(
  name="FAILED: [approach that didn't work]", 
  episode_body="Attempted [approach] for [problem]. Failed because [reason]. Don't repeat this pattern: [specific anti-pattern]",
  source_description="solution-failed"
)
```

**When user CORRECTS you:**
```
add_memory(
  name="CORRECTION: [what was corrected]",
  episode_body="User corrected: [wrong approach] should be [right approach]. Reason: [explanation]. Remember: [key principle]",
  source_description="user-correction"
)
```

**When you DISCOVER codebase patterns:**
```
add_memory(
  name="PATTERN: [pattern name]",
  episode_body="This codebase uses [pattern] for [purpose]. Found in: [locations]. Important because: [reason]",
  source_description="codebase-discovery"
)
```

## SUBAGENT INSTRUCTIONS

When spawning subagents or using Task tool, ALWAYS include these memory instructions in their prompt:

```
CRITICAL MEMORY INSTRUCTIONS:
1. Start by searching memory: search_memory_nodes(query="[your specific task area]")
2. Read what worked and what failed in similar tasks
3. As you work, immediately store:
   - Solutions that work (even partial ones)
   - Approaches that fail (to prevent others from repeating)
   - Discoveries about the codebase
   - Any patterns or insights
4. Your learnings help all future agents. Store everything valuable.
```

## MEMORY SEARCH STRATEGIES

### At Start of Any Task:
1. Search for the feature/component you're working on
2. Search for similar problems that were solved before
3. Search for "FAILED" to see what to avoid
4. Search for "CORRECTION" to see user preferences

### Before Major Decisions:
- Query: "architecture [component]" 
- Query: "PATTERN [feature area]"
- Query: "FAILED [similar approach]"

### After User Feedback:
- Store corrections immediately
- Search for related corrections to find patterns

## WHAT TO STORE vs WHAT NOT TO STORE

### ALWAYS STORE:
- ✓ Problem-solution pairs (working or failed)
- ✓ User corrections and preferences
- ✓ Codebase patterns and conventions discovered
- ✓ Architecture decisions and their reasoning
- ✓ Debugging insights and root causes found
- ✓ Performance optimizations that worked
- ✓ Test patterns specific to this project

### DON'T STORE:
- ✗ Obvious programming facts
- ✗ Temporary conversation context
- ✗ File contents (store insights about them instead)
- ✗ Things that will change frequently

## COLLECTIVE LEARNING PATTERNS

### Pattern 1: Failed Approach Registry
When your approach fails, immediately store it so no other agent wastes time:
```
add_memory(name="FAILED: Redux for simple state", episode_body="Tried Redux for 3-component state. Overkill. Use useState instead for <5 components sharing state.")
```

### Pattern 2: Solution Evolution
When you improve on a previous solution:
```
# First search for existing solution
search_memory_nodes(query="authentication implementation")
# Then store your improvement
add_memory(name="SOLUTION: Improved JWT refresh", episode_body="Built on previous JWT solution. Added refresh token rotation for better security...")
```

### Pattern 3: Codebase Map Building
As you explore code, build a map for others:
```
add_memory(name="PATTERN: API error handling", episode_body="All API routes use middleware at /middleware/errorHandler.js. Custom errors extend BaseError class.")
```

## QUICK REFERENCE

**Start of task:** 
`search_memory_nodes(query="[task area]")` → Read findings → Plan approach

**Found something that works:** 
`add_memory(name="SOLUTION: ...", episode_body="[detailed context]")`

**Hit a dead end:**
`add_memory(name="FAILED: ...", episode_body="[what and why it failed]")`

**User corrects you:**
`add_memory(name="CORRECTION: ...", episode_body="[right way and reason]")`

**Discover pattern:**
`add_memory(name="PATTERN: ...", episode_body="[pattern and where it's used]")`

**Before spawning subagent:**
Include memory instructions in their prompt

## REMEMBER
You're not just coding - you're building a shared brain. Every insight you store helps future instances (including yourself) work smarter. The more specific and contextual your memories, the more valuable they become.

Your memory makes you collectively smarter with each task. Use it.