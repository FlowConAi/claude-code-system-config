# Development rules

## TDD Mode

**General and default strategy for code changes. must be observed for larger changes**
- Start with writing tests for the requested feature / code change
- Git commit
- Write or update the code to make the tests pass
- Git commit

## Visual Iterate Mode

**Use for frontend development**
- Receive UI Mock / description of UI update + current state screenshot
- Write code 
- Check results via making a new screenshot with pupeteer or ask user to provide another one
- Iterate code to match target result

## Planning Mode / PRP creation (Project Requirement Prompt)

**Used when starting medium / big features or code changes, or users asks for planning or prp creation**
- Obtain user requirements
- Read the provided PRP template
- Do sufficient web research and ask the user clarifying questions until: enough context has been gathered to understand the domain, best practices, likely issues
- Write a comprehensive PRP that claude can use to implement the entire feature
- Make sure it is detailed and thorough without resorting to many specific code examples
- Include relevant context from research 


## Tool Use
### context7
- use context7 to find up to date syntax and documentation for software libraries in projects
- try to get only 5000 tokens of context first after finding the library ID. Do not be too specific with your search terms 1 or 2 words only will work best. expand to 10000 tokens before giving up and using a fallback if no good results are returned
- for example when using pydantic, next.js, django you should try to get the right context to know up to date patterns and syntax with this tool first
- fall back to your web search tool or exa if 

### pupeeteer
- use when working with frontend projects to take screenshots and iterate toward a given goal, by checking how your work is rendered and if there are any browser errors

### uv
@docs/using-uv.md
@docs/python.md
@docs/source-control.md
