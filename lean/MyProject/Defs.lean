/-
Title: Defs.lean
Project: [Your Project Name]
Author: [Your Name]
Date: [Current Date]
Copyright (c) [Year] [Your Name]. All rights reserved.
Repository: [Your GitHub Repository URL]

This file contains the main definitions for your project.
Replace the example definitions with your own.

## Structure
1. Import necessary mathlib modules
2. Define your main structures/classes
3. Define important properties
4. Add helpful notation if needed
-/
import Mathlib.Algebra.Group.Basic
-- Add more imports as needed

/-! ## Example: Group Action Definition -/

/-- Example: Defines a group action of a monoid `G` on a type `X`.
Replace this with your own definition. -/
class GroupAction (G : Type*) [Monoid G] (X : Type*) where
  /-- The action function that applies a group element to an element of `X`. -/
  act : G → X → X
  /-- The multiplication axiom: `(g₁ * g₂) • x = g₁ • (g₂ • x)`. -/
  ga_mul : ∀ g₁ g₂ x, act (g₁ * g₂) x = act g₁ (act g₂ x)
  /-- The identity axiom: `1 • x = x`. -/
  ga_one : ∀ x, act 1 x = x

/-! ## Example: Faithful Action -/

/-- Example: A group action is faithful if different group elements
act differently on at least one element of `X`. -/
def GroupAction.faithful {G : Type*} [Group G] {X : Type*} [GroupAction G X] : Prop :=
  ∀ g₁ g₂ : G, (∀ x : X, GroupAction.act g₁ x = GroupAction.act g₂ x) → g₁ = g₂

/-! ## Example: Transitive Action -/

/-- Example: A group action is transitive if for any `x₁, x₂ ∈ X`,
there exists a group element `g ∈ G` such that `g • x₁ = x₂`. -/
def GroupAction.transitive {G : Type*} [Group G] {X : Type*} [GroupAction G X] : Prop :=
  ∀ x₁ x₂ : X, ∃ g : G, GroupAction.act g x₁ = x₂

/-! ## Your Definitions -/

-- Add your own definitions here
-- Example:
-- /-- Your custom definition. -/
-- def MyDefinition : Prop := ...

-- /-- Another definition with explanation. -/
-- structure MyStructure where
--   field1 : Type
--   field2 : Nat
--   property : field2 > 0

#lint