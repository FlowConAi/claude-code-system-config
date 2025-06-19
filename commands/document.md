# CODEBASE DEEP ANALYZER

You are orchestrating a sophisticated multi-perspective codebase analysis operation. You coordinate multiple autonomous agents that explore, understand, and document every aspect of a codebase through systematic investigation. ultrathink

<context>
You're preparing a codebase for complete understanding and potential reimplementation. Quality documentation and deep architectural insights are critical. Each agent you spawn has full Claude Code capabilities and should explore autonomously while contributing to collective knowledge.
</context>

<input>
repository_path: $ARGUMENTS
</input>

## ORCHESTRATION ARCHITECTURE

<memory_instructions>
CRITICAL MEMORY INSTRUCTIONS FOR ALL AGENTS:
1. Start by searching memory: search_memory_nodes(query="[your specific area]")
2. Immediately store discoveries:
   - Architectural patterns: add_memory(name="PATTERN: [pattern name]", episode_body="...")
   - Component relationships: add_memory(name="COMPONENT: [name]", episode_body="...")
   - Key decisions: add_memory(name="DECISION: [what and why]", episode_body="...")
   - Technology insights: add_memory(name="TECH: [finding]", episode_body="...")
3. Check for related discoveries before deep diving
4. Your findings help all other agents work smarter
</memory_instructions>

<parallelization_reminder>
IMPORTANT: Follow project parallelization rules in CLAUDE.md when coordinating agents. Each agent writes to separate files/directories to avoid conflicts.
</parallelization_reminder>

## PHASE 1: RECONNAISSANCE WAVE

<phase name="1_reconnaissance">
### INITIAL CODEBASE MAPPING

First, understand the terrain. Spawn a reconnaissance team to map the codebase structure.

<reconnaissance_strategy>
Spawn 3-5 scouts in sequence or with careful coordination:
- Structure Scout: Analyze directory structure and file organization
- Tech Stack Scout: Identify languages, frameworks, dependencies
- Entry Point Scout: Find main entry points and initialization flows
- Pattern Scout: Identify architectural patterns and conventions (think harder)
- Documentation Scout: Locate existing docs and README files
</reconnaissance_strategy>

<scout_agent_template>
You're performing initial reconnaissance on a codebase to understand its structure and nature.

Repository root: {repository_path}
Scout focus: {specific_focus}
CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}

Explore rapidly to understand:
- Overall structure and organization
- Key technologies and dependencies
- Size and complexity metrics
- Existing documentation
- Apparent architectural decisions

Create a CLAUDE.md file in the root with your findings:
- Overview of what you discovered
- Key areas that need deep investigation
- Recommended analysis priorities
- Initial architectural observations

Focus area: {focus_description}
Output file: ./CLAUDE.md (append your section)
</scout_agent_template>

Synthesize scout reports to create the analysis strategy.
</phase>

## PHASE 2: DEEP DIVE WAVES

<phase name="2_parallel_deep_analysis">
### MASSIVE PARALLEL EXPLORATION

Based on reconnaissance, orchestrate waves of specialized analysts. Each agent operates independently but shares discoveries through memory.

KEY INNOVATION: For complex or critical components, spawn multiple analysts with different perspectives and enhanced thinking budgets to ensure thorough understanding.
CRITICAL: When spawning multiple agents for the same phase, you MUST invoke them all in a SINGLE message with multiple tool calls. Never spawn agents
one at a time. Mind the parallelization directives

<agent_coordination>
IMPORTANT: Follow project parallelization rules:
- Each agent writes to its own designated files/directories
- Use component boundaries to avoid write conflicts
- Coordinate through memory rather than shared files
- Sequential processing when components are tightly coupled
</agent_coordination>

<wave_orchestration>
Calculate optimal analysis strategy:
- Small codebase (<10K LOC): 2-5 agents total
- Medium codebase (10K-100K LOC): 5-7 agents total
- Large codebase (>100K LOC): 5-10 agents in carefully coordinated waves

Assign agents by:
- Component/module boundaries
- Technical layers (frontend/backend/database)
- Feature areas
- Cross-cutting concerns (auth, logging, etc.)

CRITICAL: For complex components, use multi-perspective analysis by spawning subagents agents in parallel with clear instructions which perspective to investigate
</wave_orchestration>

<multi_perspective_analysis>
When encountering complex or critical components, spawn multiple analysts with different perspectives:

1. **Technical Analyst** (think hard)
   - Focus on implementation details and algorithms
   - Analyze performance characteristics
   - Identify technical debt and risks

2. **Architecture Analyst** (think harder)
   - Focus on design patterns and principles
   - Evaluate coupling and cohesion
   - Assess extensibility and maintainability

3. **Business Logic Analyst** (think)
   - Focus on domain rules and workflows
   - Map business requirements to code
   - Identify edge cases and constraints

Synthesize all perspectives into unified understanding before proceeding.
</multi_perspective_analysis>

<component_analyst_template>
You're deeply analyzing a specific component/area of the codebase.

Component path: {component_path}
Component context: {component_description}
Related components: {dependencies}
CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}
Analysis perspective: {perspective_type} // Set when using multi-perspective
Thinking budget: {thinking_mode} // Set by orchestrator based on complexity

Your mission:
1. Understand this component's purpose and design
2. Map all internal structures and logic flows
3. Identify external dependencies and interfaces
4. Document patterns and conventions used
5. Note any technical debt or issues

If analyzing from specific perspective:
- Technical: Focus on algorithms, performance, implementation quality
- Architecture: Focus on design patterns, coupling, extensibility
- Business: Focus on domain logic, requirements mapping, edge cases

Create comprehensive documentation:
- CLAUDE.md in component directory with:
  - Component overview and purpose
  - Architecture and design decisions
  - Key classes/functions and their roles
  - Data flow and state management
  - Interface contracts
  - Usage examples
  - Improvement opportunities

Also create:
- component_diagram.mermaid showing internal structure
- List all connections to other components

Remember: Future developers need to understand not just WHAT this does, but WHY it was built this way.
</component_analyst_template>

<multi_perspective_synthesis>
When multiple analysts examine the same complex component:

1. **Convergence Protocol**
   - Each analyst works independently with their focus
   - Orchestrator reviews all perspectives
   - Identify agreements and conflicts
   - Create synthesis that incorporates all valid insights

2. **Conflict Resolution**
   - Technical vs Business perspectives: Document both views
   - Performance vs Maintainability: Note trade-offs
   - Current vs Ideal state: Capture technical debt

3. **Unified Documentation**
   - Merge perspectives into single CLAUDE.md
   - Use sections for different viewpoints where needed
   - Highlight critical decisions and trade-offs
</multi_perspective_synthesis>

<interface_analyst_template>
You're analyzing interfaces and integration points between components.

Components to analyze: {component_list}
CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}

Map all interactions:
- API contracts between components
- Shared data structures
- Event flows and messaging
- Database schemas and access patterns
- External service integrations

Create in ./docs/architecture/:
- integration_map.mermaid showing all component relationships
- api_contracts.md documenting all interfaces
- data_flow.mermaid showing how data moves through the system
</interface_analyst_template>

<pattern_specialist_template>
You're identifying and documenting architectural patterns across the codebase.

Repository root: {repository_path}
CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}

Hunt for patterns:
- Design patterns (Factory, Observer, Strategy, etc.)
- Architectural patterns (MVC, MVVM, Clean Architecture, etc.)
- Code organization patterns
- Error handling strategies
- Testing approaches
- Security patterns

Document in ./docs/patterns/:
- patterns_catalog.md with examples
- pattern_usage_map.md showing where each is used
- recommendations.md for pattern improvements
</pattern_specialist_template>
</phase>

## PHASE 3: SYNTHESIS WAVE

<phase name="3_synthesis">
### ARCHITECTURAL SYNTHESIS

After deep dives, spawn synthesis specialists to create the big picture.

<synthesis_orchestration>
Spawn synthesis specialists with appropriate thinking budgets:
- Architecture Synthesizer (ultrathink): Create overall system architecture
- Dependency Mapper (think hard): Build complete dependency graphs
- Flow Documenter (think): Document all major workflows
- Database Analyst (think hard): Complete data model documentation

For critical architectural decisions, spawn multiple synthesizers:
- Technical Architecture View
- Business Architecture View
- Security Architecture View
</synthesis_orchestration>

<architecture_synthesizer_template>
You're creating the master architectural documentation by synthesizing all component analyses.

CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}
Search memory for all PATTERN, COMPONENT, and DECISION entries first!

Review all component CLAUDE.md files and create:

1. ./docs/ARCHITECTURE.md with:
   - Executive summary
   - System overview and goals  
   - Architectural decisions record (ADR)
   - Component inventory and responsibilities
   - Technology stack justification
   - Scalability and performance considerations
   - Security architecture
   - Deployment architecture

2. ./docs/diagrams/system_architecture.mermaid showing:
   - All major components
   - Component relationships
   - Data flows
   - External integrations
   - Deployment boundaries

3. ./docs/diagrams/sequence_diagrams/ folder with:
   - Key user journeys
   - System initialization
   - Critical business processes
   - Error handling flows

Make this the definitive guide for understanding the system.
</architecture_synthesizer_template>

<dependency_mapper_template>
You're creating comprehensive dependency documentation.

CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}

Analyze and document:
- Code dependencies (imports, includes)
- Package/library dependencies
- Service dependencies
- Build dependencies
- Runtime dependencies

Create:
1. ./docs/dependencies/dependency_graph.mermaid
2. ./docs/dependencies/dependency_analysis.md including:
   - Critical path dependencies
   - Circular dependency analysis
   - Version constraints and compatibility
   - Security vulnerability assessment
   - Upgrade recommendations

3. ./docs/dependencies/bill_of_materials.md with:
   - Complete inventory of all external dependencies
   - Licenses summary
   - Risk assessment
</dependency_mapper_template>
</phase>

## PHASE 4: DOCUMENTATION GENERATION

<phase name="4_documentation">
### PROFESSIONAL DOCUMENTATION CREATION

<documentation_orchestration>
Check for existing documentation frameworks:
- If ReadTheDocs/Sphinx exists: enhance it
- If other framework exists: integrate with it
- If none exists: create comprehensive markdown docs

Spawn specialists:
- API Documenter (if applicable)
- Developer Guide Writer
- Operations Guide Writer
- Migration Guide Creator
</documentation_orchestration>

<api_documenter_template>
You're creating complete API documentation.

CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}

Document every API endpoint/interface:
- Purpose and business context
- Request/response schemas
- Authentication requirements
- Rate limits and constraints
- Example calls with curl/code
- Error scenarios and codes
- Versioning information

Output format: {doc_framework}
Output location: {api_doc_location}

Include OpenAPI/Swagger specs if applicable.
</api_documenter_template>

<developer_guide_writer_template>
You're writing the complete developer guide.

CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}
Documentation framework: {doc_framework}

Create comprehensive guide covering:

1. Getting Started
   - Prerequisites and setup
   - Development environment
   - First steps tutorial

2. Development Workflow  
   - Code organization
   - Naming conventions
   - Git workflow
   - Testing practices
   - Code review process

3. Architecture Deep Dives
   - Component guides
   - Extension points
   - Plugin/module development
   - Performance optimization

4. Troubleshooting
   - Common issues
   - Debugging techniques
   - Logging and monitoring

5. Contributing
   - Contribution guidelines
   - Code style guide
   - Pull request process

Make it practical with real examples from the codebase.
</developer_guide_writer_template>

<migration_guide_creator_template>
You're creating a guide for reimplementing this system.

CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}

Create ./docs/MIGRATION_GUIDE.md with:

1. System Behavior Specification
   - Complete functional requirements
   - Business rules and logic
   - Edge cases and error handling
   - Performance requirements

2. Data Migration Strategy
   - Schema documentation
   - Data transformation rules
   - Migration scripts outline

3. Feature Parity Checklist
   - Core features inventory
   - API compatibility requirements
   - UI/UX requirements (if applicable)

4. Testing Strategy
   - Test cases to ensure compatibility
   - Performance benchmarks
   - Acceptance criteria

5. Phased Migration Approach
   - Recommended migration phases
   - Risk mitigation strategies
   - Rollback procedures

This guide should enable a team to reimplement the system in any language/framework.
</migration_guide_creator_template>
</phase>

## PHASE 5: QUALITY VALIDATION

<phase name="5_validation">
### DOCUMENTATION QUALITY ASSURANCE

<quality_validator_template>
You're validating the completeness and quality of all documentation.

CRITICAL MEMORY INSTRUCTIONS: {memory_instructions}

Audit all generated documentation for:
- Completeness (is everything documented?)
- Accuracy (does it match the code?)
- Clarity (would a new developer understand?)
- Consistency (unified style and terminology?)
- Practicality (are examples helpful?)

Create ./docs/QUALITY_REPORT.md with:
- Documentation coverage metrics
- Identified gaps or issues
- Recommendations for improvements
- Sign-off on production readiness

Run these checks:
1. Can a new developer understand the system?
2. Is the architecture clear and justified?
3. Are all APIs and interfaces documented?
4. Do diagrams accurately represent the system?
5. Is the migration guide complete?
</quality_validator_template>
</phase>

## ORCHESTRATION INTELLIGENCE

<decision_framework>
Dynamic orchestration decisions:

1. **Analysis Strategy**
   - Component complexity → single vs multi-perspective analysis
   - Critical paths → enhanced thinking budgets
   - Unclear architecture → spawn competing hypotheses

2. **Thinking Budget Allocation**
   - Complex algorithms → ultrathink
   - Architectural decisions → think harder
   - Business logic mapping → think hard
   - Simple CRUD operations → standard
   - Pattern recognition → think

3. **Multi-Perspective Triggers**
   - Core business logic components
   - Security-critical sections
   - Performance bottlenecks
   - Complex architectural boundaries
   - High-coupling areas

4. **Context Sharing**
   - High coupling → more shared context
   - Independent modules → minimal context
   - Always share memory instructions

5. **Quality Gates**
   - Each phase must complete before next
   - Synthesis requires 80%+ component analysis
   - Documentation requires complete synthesis
   - Multi-perspective analyses must converge
</decision_framework>

## EXECUTION FLOW

```
1. Reconnaissance Wave
   └── Create analysis strategy
   
2. Deep Analysis Waves
   ├── Component analysts (coordinated)
   ├── Multi-perspective analysis for complex parts
   ├── Interface analysts
   └── Pattern specialists
   
3. Synthesis Wave
   ├── Architecture synthesizer (ultrathink)
   ├── Multiple architecture views if needed
   ├── Dependency mapper
   └── Flow documenter
   
4. Documentation Wave
   ├── API documenter
   ├── Developer guide writer
   ├── Operations guide writer
   └── Migration guide creator
   
5. Quality Validation
   └── Final audit and sign-off
```

## START COMMAND

Begin reconnaissance of the repository at {repository_path}. 

First, think deeply about:
- The likely size and complexity
- Which components will need multi-perspective analysis
- Appropriate thinking budgets for different analysis types
- Documentation framework to use

Then spawn 3-5 reconnaissance scouts following parallelization rules. Set a high thinking budget for the pattern scout if the codebase seems architecturally complex.

Remember: You're orchestrating distributed exploration where each agent thinks independently while you maintain the big picture. For complex components, spawn multiple analysts with different perspectives and thinking budgets, then synthesize their insights.

The goal is documentation so comprehensive that someone could reimplement this system from scratch.

Document your orchestration decisions in ./docs/ANALYSIS_LOG.md as you progress, including:
- Why certain components received multi-perspective analysis
- Thinking budget allocations and rationale
- Key synthesis decisions between different perspectives