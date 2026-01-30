/-
Title: Examples.lean
Project: [Your Project Name]
Author: [Your Name]
Date: [Current Date]
Copyright (c) [Year] [Your Name]. All rights reserved.
Repository: [Your GitHub Repository URL]

This file contains examples and instances of your definitions.
Add concrete examples to illustrate how your definitions work.

## Structure
1. Import necessary modules
2. Define concrete examples
3. Prove that examples satisfy your definitions
4. Add non-examples if helpful
-/
import MyProject.Defs
import MyProject.Basic

/-! ## Example Instances -/

-- Example: Define a concrete group action
-- instance : GroupAction G X where
--   act := ...
--   ga_mul := ...
--   ga_one := ...

-- Example: Show that your definition is non-trivial
-- example : ∃ (G : Type) [Group G] (X : Type) [GroupAction G X], 
--   GroupAction.faithful (G := G) (X := X) := by
--   -- proof here

/-! ## Your Examples -/

-- Add your own examples here
-- Example:
-- /-- A simple example of your definition. -/
-- example : MyDefinition := ...

-- /-- A more complex example with proof. -/
-- theorem complex_example : ... := by
--   -- proof here

#lint