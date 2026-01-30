# Checklist and Self/AI Scoring

Copyright (c) [Year] [Your Name]. All rights reserved. Repository: [Your GitHub Repository URL]

## Checklist for Lean Project with Report

- [ ] Lean code included (target 150–200 lines with comments)
- [ ] PDF report explains the mathematics and Lean development (target 5+ pages)
- [ ] Reader-facing narrative for non-Lean mathematicians
- [ ] Proof steps aligned with textbook arguments
- [ ] Time investment documented (15+ hours recommended)
- [ ] All Lean files compile without errors
- [ ] Report includes proper references and citations
- [ ] Code is well-documented with comments
- [ ] Examples illustrate the concepts clearly
- [ ] Project structure is clean and organized

## Project Structure Checklist

### Lean Files
- [ ] `MyProject.lean` - Main file importing all modules
- [ ] `MyProject/Defs.lean` - Core definitions
- [ ] `MyProject/Basic.lean` - Basic properties and lemmas
- [ ] `MyProject/Examples.lean` - Concrete examples
- [ ] `MyProject/Theorems.lean` - Main theorems and proofs

### LaTeX Files
- [ ] `report.tex` - Main report document
- [ ] `assignment.cls` - Document class (provided)
- [ ] Generated `report.pdf` - Final compiled report

### Documentation
- [ ] `README.md` - Project overview and instructions
- [ ] `lakefile.toml` - Project configuration
- [ ] `.gitignore` - Git ignore rules
- [ ] `lean-toolchain` - Lean version specification

## Self-assessment

| Criterion | Self score ( / 10 ) | Notes |
| --- | --- | --- |
| Lean formalisation completeness | | How complete is your formalization? |
| Clarity for non-Lean readers | | Can someone without Lean experience understand? |
| Proof readability | | Are proofs clear and well-structured? |
| Report structure and pacing | | Is the report well-organized? |
| Mathematical correctness | | Are the mathematical statements correct? |
| Code quality | | Is the Lean code clean and well-documented? |

## AI assessment (optional)

| Criterion | AI score ( / 10 ) | Feedback |
| --- | --- | --- |
| Lean formalisation completeness | | |
| Clarity for non-Lean readers | | |
| Proof readability | | |
| Report structure and pacing | | |

## Time Tracking

| Date | Hours | Task |
| --- | --- | --- |
| [Date] | [Hours] | [Description] |
| [Date] | [Hours] | [Description] |
| **Total** | **[Total Hours]** | |

## Notes for Improvement

[Add notes about what could be improved in future iterations]

## Submission Checklist

- [ ] All files committed to Git
- [ ] GitHub repository is public (if required)
- [ ] PDF report is generated and checked
- [ ] Lean code compiles with `lake build`
- [ ] All `#lint` commands pass
- [ ] No `sorry` or incomplete proofs remain
- [ ] References are properly formatted
- [ ] Code follows consistent style