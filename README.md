# OCDO WDL Tutorial for 2025 OCDO Summer Hybrid Coworking Day

A 30-minute interactive tutorial introducing the basic concepts of WDL (Workflow Description Language) using simple "Hello World" examples.

## Prerequisites

- **Sprocket WDL runner** installed ([installation guide](https://sprocket.bio/installation.html))
- Basic familiarity with command line

## Tutorial Structure

This tutorial consists of two progressive exercises designed to teach core WDL concepts:

### Exercise 1: Hello World (10 minutes)
**File:** `hello_world_template.wdl`

Learn the basic anatomy of WDL:
- Task structure (input, command, output, runtime)
- Workflow composition
- Calling tasks

**Run the solution:**
```bash
sprocket run hello_world_solution.wdl
```

### Exercise 2: Hello Names with Character Counting (10 minutes)
**Files:** `hello_ocdo_template.wdl` + `hello_ocdo_inputs.json`

Learn more advanced concepts:
- Input parameters and JSON files
- Arrays and scatter operations
- Task chaining (output from one task → input to another)
- Different Docker containers for different tasks
- Multiple programming languages (bash + Python)

**Run the solution:**
```bash
sprocket run hello_ocdo_solution.wdl hello_ocdo_inputs.json --output WelcomeToTheOCDOgon
```

## What You'll Learn

By the end of this tutorial, you'll understand:

1. **WDL Structure**: How tasks and workflows fit together
2. **Data Flow**: How outputs from one task become inputs to another
3. **Parallelization**: Using scatter to process multiple items at once
4. **Containers**: How different tasks can use different software environments
5. **Multi-language**: Running both bash and Python commands in the same workflow

## Key Concepts

- **Tasks** = individual computational steps (like functions)
- **Workflows** = orchestration of multiple tasks
- **Scatter** = parallel processing of arrays
- **Variable substitution** = using `~{variable}` in commands
- **Docker containers** = reproducible software environments
- **File tracking** = WDL automatically manages input/output files

## Expected Output

**Exercise 1** creates:
- `hello.txt` containing "Hello World"

**Exercise 2** creates:
- `hello_Sean.txt`, `hello_Taylor.txt`, etc. (one per name)
- `count_Sean.txt`, `count_Taylor.txt`, etc. (character counts)

## Next Steps

After completing this tutorial:
- Try running these scripts on [PROOF](https://proof.fredhutch.org)
- Check out the [WILDS WDL Library](https://github.com/getwilds/wilds-wdl-library) for real-world examples

## Troubleshooting

**Common issues:**
- Make sure Docker is running before executing workflows
- Check that input file paths are correct in JSON files
- Ensure Sprocket is properly installed and in your PATH
