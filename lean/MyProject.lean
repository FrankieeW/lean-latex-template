/-
Title: MyProject.lean
Project: [Your Project Name]
Author: [Your Name]
Date: [Current Date]
Copyright (c) [Year] [Your Name]. All rights reserved.
Repository: [Your GitHub Repository URL]

This is the main file of your Lean 4 project. It imports all modules
and serves as the entry point for your formalization.

## Usage
1. Replace `MyProject` with your actual project name
2. Update the imports to match your module structure
3. Add your main theorems and definitions here
-/
import MyProject.Defs
import MyProject.Basic
-- Add more imports as needed for your project

/-
# [Your Project Title]

## Overview
[Brief description of your project]

## Main Results
[List your main theorems and definitions]

## How to Use
1. Run `lake build` to compile the project
2. Use `#check` to verify definitions
3. Use `#lint` to check for common issues

## References
[Add your references here]
-/

-- Example: Check that your definitions are well-formed
#check MyProject.Defs.MyDefinition

-- Run linter to check for common issues
#lint