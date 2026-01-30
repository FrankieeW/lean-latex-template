/-
Title: Basic.lean
Project: [Your Project Name]
Author: [Your Name]
Date: [Current Date]
Copyright (c) [Year] [Your Name]. All rights reserved.
Repository: [Your GitHub Repository URL]

This file contains basic lemmas and theorems about your definitions.
Start with simple properties before moving to more complex results.

## Structure
1. Import your definitions
2. Declare variables
3. Prove basic properties
4. Add helpful lemmas
-/
import MyProject.Defs

/-! ## Variable Declarations -/

-- Declare variables that will be used throughout
variable {G : Type*} [Group G] {X : Type*} [GroupAction G X]

/-! ## Basic Theorems -/

-- Example: Theorem about faithful actions
theorem faithful_def {G : Type*} [Group G] {X : Type*} [GroupAction G X] :
    GroupAction.faithful (G := G) (X := X) ↔
      ∀ g₁ g₂ : G, (∀ x : X, GroupAction.act g₁ x = GroupAction.act g₂ x) → g₁ = g₂ :=
  Iff.rfl

-- Example: Theorem about transitive actions
theorem transitive_def {G : Type*} [Group G] {X : Type*} [GroupAction G X] :
    GroupAction.transitive (G := G) (X := X) ↔
      ∀ x₁ x₂ : X, ∃ g : G, GroupAction.act g x₁ = x₂ :=
  Iff.rfl

/-! ## Your Theorems and Lemmas -/

-- Add your own theorems here
-- Example:
-- theorem my_first_theorem : True := by
--   trivial

-- lemma helpful_lemma (h : P) : Q := by
--   -- proof here

-- theorem important_result : MyTheorem := by
--   -- proof here

/-! ## Linting -/

-- Run linter to check for common issues
#lint