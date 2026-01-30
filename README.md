# Lean Project Template with Report

A template for formal mathematics projects using Lean 4 with LaTeX report integration.

## Features

- **Lean 4 Formalization**: Structured Lean project with mathlib integration
- **LaTeX Report**: Professional report template with code highlighting
- **GitHub Integration**: Links between code and report with line numbers
- **Project Structure**: Organized directory layout for scalability
- **Documentation**: Comprehensive guides and checklists

## 🚀 One-Click Installation

Create a new Lean project with a single command:

### Method 1: Direct download and run (recommended for quick start)

```bash
# Basic usage - script will use default name "LeanProject"
curl -sSL https://raw.githubusercontent.com/FrankieeW/lean-latex-template/main/scripts/init-template.sh | bash

# Specify project name directly
curl -sSL https://raw.githubusercontent.com/FrankieeW/lean-latex-template/main/scripts/init-template.sh | bash -s -- DedekindDomain

# Specify project name with spaces (will be converted to PascalCase)
curl -sSL https://raw.githubusercontent.com/FrankieeW/lean-latex-template/main/scripts/init-template.sh | bash -s -- "dedekind domain"
```

### Method 2: Clone and run (recommended for customization)

```bash
# Clone the template
git clone https://github.com/FrankieeW/lean-latex-template
cd lean-latex-template

# Make script executable and run
chmod +x scripts/init-template.sh

# Interactive mode (with prompts)
./scripts/init-template.sh

# Non-interactive mode with project name
./scripts/init-template.sh DedekindDomain
```

### What the script does:

1. **Checks dependencies**: Git, Lean, Lake (optional)
2. **Gets project name**: Interactive prompts or command line argument
3. **Selects directory**: Current dir or specified location
4. **Clones template**: Downloads and sets up the template
5. **Renames everything**: Updates all files with your project name
6. **Initializes Git**: Creates fresh Git repository
7. **Sets up project**: Runs `lake update` and `lake build`

### Examples:

```bash
# Create a Dedekind Domain project
curl -sSL https://raw.githubusercontent.com/FrankieeW/lean-latex-template/main/scripts/init-template.sh | bash -s -- DedekindDomain

# Create a Group Theory project
curl -sSL https://raw.githubusercontent.com/FrankieeW/lean-latex-template/main/scripts/init-template.sh | bash -s -- "group theory"

# Create in specific directory
mkdir ~/my-projects
cd ~/my-projects
curl -sSL https://raw.githubusercontent.com/FrankieeW/lean-latex-template/main/scripts/init-template.sh | bash -s -- AlgebraicTopology
```

## Quick Start

### 1. Clone and Setup

```bash
# Clone this template
git clone [your-repo-url] my-project
cd my-project

# Initialize Lean project
lake update
lake build
```

### 2. Rename Project

1. Rename `MyProject` to your actual project name:
   - Update `lakefile.toml`: `name = "YourProject"`
   - Rename `lean/MyProject.lean` to `lean/YourProject.lean`
   - Update imports in all Lean files

2. Update LaTeX report:
   - Edit `tex/report.tex` with your project details
   - Update title, author, abstract, etc.

### 3. Build and Test

```bash
# Build Lean project
lake build

# Check for linting issues
lake exe cache get
lake build  # Rebuild after getting cache

# Test compilation
lean --run lean/YourProject.lean
```

### 4. Generate Report

```bash
# Navigate to tex directory
cd tex

# Compile LaTeX report (requires latexmk)
latexmk -pdf report.tex

# View the report
open report.pdf
```

## Project Structure

```
.
├── lean/                    # Lean 4 formalization
│   ├── MyProject.lean      # Main file (imports all modules)
│   └── MyProject/          # Module directory
│       ├── Defs.lean       # Core definitions
│       ├── Basic.lean      # Basic properties and lemmas
│       ├── Examples.lean   # Concrete examples
│       └── Theorems.lean   # Main theorems and proofs
├── tex/                    # LaTeX report
│   ├── report.tex         # Main report document
│   ├── assignment.cls     # Document class
│   └── checklist.md       # Project checklist
├── doc/                   # Documentation
│   └── COMMIT_RULES.md   # Git commit guidelines
├── lakefile.toml         # Lean project configuration
├── lean-toolchain        # Lean version specification
├── .gitignore           # Git ignore rules
├── scripts/             # Utility scripts
│   └── init-template.sh # One-click initialization
└── README.md            # This file
```

## Lean Development Guide

### Adding New Definitions

1. Add to `Defs.lean`:
```lean
/-- Your new definition. -/
def YourDefinition : Prop := ...
```

2. Prove basic properties in `Basic.lean`:
```lean
theorem your_definition_property : YourDefinition → ... := by
  ...
```

3. Add examples in `Examples.lean`:
```lean
example : YourDefinition := ...
```

4. Prove main theorems in `Theorems.lean`:
```lean
theorem main_theorem_about_your_definition : ... := by
  ...
```

### Import Structure

```lean
-- Main file imports all modules
import YourProject.Defs
import YourProject.Basic
import YourProject.Examples
import YourProject.Theorems

-- Modules import dependencies
import YourProject.Defs  -- Defs imports mathlib
import YourProject.Basic -- Basic imports Defs
```

## LaTeX Report Guide

### Code Integration

The report template includes commands to embed Lean code with GitHub links:

```latex
% Import code from Lean file with line numbers
\leancodefile[firstline=1,lastline=20]{../lean/YourProject/Defs.lean}{https://github.com/.../Defs.lean}
```

### Customization

1. Update metadata in `report.tex`:
   - Title, author, student ID, email
   - GitHub repository URL
   - Institute/university name

2. Modify content sections:
   - Introduction: Background and goals
   - Mathematical Background: Definitions and notation
   - Lean Formalization: Code explanations
   - Main Theorems: Proofs and explanations
   - Examples: Concrete applications
   - Conclusion: Summary and future work

3. Add references in bibliography:
```latex
\bibitem{reference} Author. Title. Year.
```

## Dependencies

### Required Software

- **Lean 4**: [Installation Guide](https://leanprover-community.github.io/get_started.html)
- **LaTeX**: TeX Live or MacTeX distribution
- **Git**: Version control system

### Lean Dependencies

- **mathlib4**: Formal mathematics library
- Configured in `lakefile.toml`

### LaTeX Dependencies

- `minted`: Code highlighting
- `hyperref`: Hyperlinks
- `amsthm`: Theorem environments
- `fontspec`: Font configuration

## Workflow

### 1. Planning Phase
- [ ] Define mathematical concepts to formalize
- [ ] Outline report structure
- [ ] Create Lean file structure

### 2. Development Phase
- [ ] Write definitions in `Defs.lean`
- [ ] Prove basic properties in `Basic.lean`
- [ ] Add examples in `Examples.lean`
- [ ] Prove main theorems in `Theorems.lean`

### 3. Documentation Phase
- [ ] Write report sections in `report.tex`
- [ ] Integrate code examples with GitHub links
- [ ] Add mathematical explanations
- [ ] Include references and citations

### 4. Review Phase
- [ ] Run `lake build` to check compilation
- [ ] Run `#lint` to check code quality
- [ ] Compile LaTeX report
- [ ] Review checklist in `tex/checklist.md`

## Best Practices

### Lean Code
- Use descriptive names for definitions and theorems
- Add docstrings to public definitions
- Keep proofs readable and well-structured
- Use `#lint` regularly to catch issues
- Avoid `sorry` in final submissions

### LaTeX Report
- Explain mathematics for non-Lean readers
- Reference Lean code with line numbers
- Use proper mathematical notation
- Include diagrams if helpful
- Cite references properly

### Git Commits
- Follow commit rules in `doc/COMMIT_RULES.md`
- Write descriptive commit messages
- Reference issues when applicable
- Keep commits focused and atomic

## 📜 Scripts

### `scripts/init-template.sh`

The main initialization script that creates new projects from this template.

**Usage:**
```bash
# Direct download and run
curl -sSL https://raw.githubusercontent.com/FrankieeW/lean-latex-template/main/scripts/init-template.sh | bash

# Or run locally
./scripts/init-template.sh
```

**Features:**
- Interactive project name input (auto-converts to PascalCase)
- Multiple directory options (current, custom, or ~/Projects)
- Automatic file renaming and import updates
- Git repository initialization
- Project dependency setup
- Colorful output and error handling

**Example workflow:**
```bash
$ ./scripts/init-template.sh
# Follow the prompts to create "DedekindDomain" project
# Script handles everything automatically
```

### Adding New Scripts

Place utility scripts in the `scripts/` directory:
- Build automation scripts
- Testing scripts
- Deployment scripts
- Documentation generators

## Troubleshooting

### Common Issues

1. **Lean won't compile**:
   ```bash
   lake clean
   lake update
   lake build
   ```

2. **Missing mathlib cache**:
   ```bash
   lake exe cache get
   ```

3. **LaTeX compilation errors**:
   - Ensure all packages are installed
   - Check for missing `\end{document}`
   - Verify file paths in `\leancodefile`

4. **Code highlighting not working**:
   - Install Pygments: `pip install pygments`
   - Add `-shell-escape` to LaTeX compiler flags

### Getting Help

- [Lean Zulip](https://leanprover.zulipchat.com/)
- [mathlib4 Documentation](https://leanprover-community.github.io/mathlib4_docs/)
- [LaTeX Stack Exchange](https://tex.stackexchange.com/)

## License

This template is provided under the MIT License. See LICENSE file for details.

## Acknowledgments

- Lean Prover community for the amazing theorem prover
- mathlib4 contributors for the comprehensive library
- LaTeX community for typesetting tools

---

*Template created from GroupAction project. Customize for your own formal mathematics project.*