# Commit Message Guidelines

## Commit Types

Use one of the following prefixes for your commit messages:

- `feat`: A new feature
- `fix`: A bug fix
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `docs`: Documentation only changes
- `chore`: Changes to the build process or auxiliary tools
- `test`: Adding missing tests or correcting existing tests

## Format

```
<type>: <subject>

<body>

<footer>
```

### Examples

```
feat: add permutation representation theorem

- Define sigma and sigmaPerm functions
- Prove phi_mul and phi_one lemmas
- Add group_action_to_perm_representation theorem

Closes #123
```

```
fix: correct type error in stabilizer definition

The stabilizer definition had a type mismatch when G is not a group.
Now requires [Group G] explicitly.

Fixes #456
```

```
docs: update README with build instructions

Add detailed instructions for:
- Setting up Lean 4
- Installing dependencies
- Building the project
- Running tests
```

## Rules

1. **Use imperative mood**: "add feature" not "added feature" or "adds feature"
2. **Capitalize first letter**: "Add feature" not "add feature"
3. **No period at end**: Keep subject line concise
4. **Limit to 72 characters**: Subject line should be brief
5. **Reference issues**: Use "Closes #123" or "Fixes #456" in footer
6. **Explain why, not what**: Body should explain reasoning, not just describe changes

## Why These Rules?

- **Consistency**: Makes git history readable and searchable
- **Automation**: Enables automatic changelog generation
- **Clarity**: Helps team members understand changes
- **Debugging**: Makes it easier to find when bugs were introduced