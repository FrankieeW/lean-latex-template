#!/bin/bash

# Lean Project Template Initialization Script
# This script creates a new Lean 4 project from the template

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Template repository
TEMPLATE_REPO="https://github.com/FrankieeW/lean-latex-template.git"

print_header() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║         Lean Project Template Initialization             ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

check_dependencies() {
    print_step "Checking dependencies..."
    
    # Check if git is installed
    if ! command -v git &> /dev/null; then
        print_error "Git is not installed. Please install git first."
        exit 1
    fi
    
    # Check if Lean is installed (optional check)
    if ! command -v lean &> /dev/null; then
        print_warning "Lean 4 not found in PATH. You'll need to install it later."
    fi
    
    # Check if lake is installed (optional check)
    if ! command -v lake &> /dev/null; then
        print_warning "Lake not found in PATH. You'll need to install it later."
    fi
    
    print_step "Dependencies check completed."
}

# Function to clean and convert project name
clean_project_name() {
    local name="$1"
    
    # Remove special characters except letters, numbers, spaces, and hyphens
    name=$(echo "$name" | sed 's/[^a-zA-Z0-9 -]//g')
    
    # Trim leading/trailing spaces
    name=$(echo "$name" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    # Convert to PascalCase (capitalize first letter of each word)
    name=$(echo "$name" | sed -E 's/\b([a-z])/\u\1/g')
    
    # Remove spaces
    name=$(echo "$name" | sed 's/[[:space:]]//g')
    
    # If empty after cleaning, use default
    if [[ -z "$name" ]]; then
        name="LeanProject"
    fi
    
    echo "$name"
}

get_project_name() {
    # Check if we're running in a terminal
    if [[ -t 0 ]]; then
        # Interactive mode - read from terminal
        while true; do
            echo -e "\n${BLUE}Enter your project name (e.g., DedekindDomain, GroupTheory):${NC}"
            read -r raw_project_name
            
            # Validate project name
            if [[ -z "$raw_project_name" ]]; then
                print_error "Project name cannot be empty."
                continue
            fi
            
            # Clean and convert the project name
            project_name=$(clean_project_name "$raw_project_name")
            
            echo -e "${YELLOW}Raw input: $raw_project_name${NC}"
            echo -e "${YELLOW}Cleaned name: $project_name${NC}"
            echo -e "Is this correct? (y/n)"
            read -r confirm
            
            if [[ "$confirm" =~ ^[Yy]$ ]]; then
                break
            fi
        done
    else
        # Non-interactive mode - use command line arguments or defaults
        if [[ -n "$1" ]]; then
            raw_project_name="$1"
            # Clean and convert the project name
            project_name=$(clean_project_name "$raw_project_name")
            echo -e "${YELLOW}Raw input: $raw_project_name${NC}"
            echo -e "${YELLOW}Cleaned name: $project_name${NC}"
        else
            # Try to get project name from URL or use default
            project_name="LeanProject"
            echo -e "${YELLOW}No project name provided. Using default: $project_name${NC}"
            echo -e "${YELLOW}To specify a name, use: curl ... | bash -s -- ProjectName${NC}"
        fi
    fi
}

get_target_directory() {
    if [[ -t 0 ]]; then
        # Interactive mode
        echo -e "\n${BLUE}Where would you like to create the project?${NC}"
        echo "1. Current directory ($(pwd))"
        echo "2. Specify a different directory"
        echo "3. Create in home directory (~/Projects)"
        
        read -r choice
        
        case $choice in
            1)
                target_dir="$(pwd)/$project_name"
                ;;
            2)
                echo -e "\n${BLUE}Enter the full path:${NC}"
                read -r custom_path
                target_dir="$custom_path/$project_name"
                ;;
            3)
                target_dir="$HOME/Projects/$project_name"
                mkdir -p "$HOME/Projects"
                ;;
            *)
                print_error "Invalid choice. Using current directory."
                target_dir="$(pwd)/$project_name"
                ;;
        esac
    else
        # Non-interactive mode - use current directory
        target_dir="$(pwd)/$project_name"
        echo -e "${YELLOW}Creating project in current directory: $target_dir${NC}"
    fi
    
    # Check if directory already exists
    if [[ -d "$target_dir" ]]; then
        if [[ -t 0 ]]; then
            # Interactive mode - ask for confirmation
            print_error "Directory $target_dir already exists."
            echo -e "${YELLOW}Do you want to overwrite it? (y/n)${NC}"
            read -r overwrite
            
            if [[ "$overwrite" =~ ^[Yy]$ ]]; then
                rm -rf "$target_dir"
            else
                print_error "Aborting."
                exit 1
            fi
        else
            # Non-interactive mode - don't overwrite, use a new name
            counter=1
            while [[ -d "${target_dir}_${counter}" ]]; do
                ((counter++))
            done
            target_dir="${target_dir}_${counter}"
            echo -e "${YELLOW}Directory exists. Using: $target_dir${NC}"
        fi
    fi
}

clone_template() {
    print_step "Cloning template repository..."
    
    # Clone the template
    git clone "$TEMPLATE_REPO" "$target_dir" 2>/dev/null
    
    if [[ $? -ne 0 ]]; then
        print_error "Failed to clone template repository."
        exit 1
    fi
    
    # Remove .git directory to start fresh
    rm -rf "$target_dir/.git"
    
    print_step "Template cloned successfully."
}

rename_project() {
    print_step "Renaming project to $project_name..."
    
    cd "$target_dir" || exit 1
    
    # Rename Lean directory
    if [[ -d "lean/MyProject" ]]; then
        mv "lean/MyProject" "lean/$project_name"
    fi
    
    # Rename main Lean file
    if [[ -f "lean/MyProject.lean" ]]; then
        mv "lean/MyProject.lean" "lean/$project_name.lean"
    fi
    
    # Update lakefile.toml
    if [[ -f "lakefile.toml" ]]; then
        sed -i '' "s/name = \"MyProject\"/name = \"$project_name\"/g" lakefile.toml
        sed -i '' "s/defaultTargets = \\[\"MyProject\"\\]/defaultTargets = [\"$project_name\"]/g" lakefile.toml
    fi
    
    # Update imports in Lean files
    find lean -name "*.lean" -type f | while read -r file; do
        sed -i '' "s/import MyProject\./import $project_name\./g" "$file"
        sed -i '' "s/import MyProject$/import $project_name/g" "$file"
    done
    
    # Update README.md
    if [[ -f "README.md" ]]; then
        sed -i '' "s/MyProject/$project_name/g" README.md
        sed -i '' "s/lean-latex-template/$project_name/g" README.md
    fi
    
    # Update LaTeX report
    if [[ -f "tex/report.tex" ]]; then
        sed -i '' "s/\[Your Project Title\]/$project_name Formalization/g" tex/report.tex
        sed -i '' "s/\[Your Project Name\]/$project_name/g" tex/report.tex
    fi
    
    print_step "Project renamed successfully."
}

initialize_git() {
    print_step "Initializing Git repository..."
    
    cd "$target_dir" || exit 1
    
    git init
    git add .
    git commit -m "feat: initial commit - $project_name project
    
    - Created from Lean project template
    - Project name: $project_name
    - Includes Lean 4 formalization structure
    - Includes LaTeX report template"
    
    print_step "Git repository initialized."
}

setup_project() {
    print_step "Setting up project dependencies..."
    
    cd "$target_dir" || exit 1
    
    # Initialize Lake project
    if command -v lake &> /dev/null; then
        lake update
        lake build
        
        if [[ $? -eq 0 ]]; then
            print_step "Project built successfully."
        else
            print_warning "Project build had issues. You may need to fix dependencies."
        fi
    else
        print_warning "Lake not found. Skipping project build."
        echo "You can build the project later with:"
        echo "  cd $target_dir && lake update && lake build"
    fi
}

print_summary() {
    echo -e "\n${GREEN}══════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}          Project Created Successfully!                    ${NC}"
    echo -e "${GREEN}══════════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${BLUE}Project Details:${NC}"
    echo -e "  Name:        $project_name"
    echo -e "  Location:    $target_dir"
    echo ""
    echo -e "${BLUE}Next Steps:${NC}"
    echo "  1. Navigate to project directory:"
    echo -e "     ${YELLOW}cd $target_dir${NC}"
    echo ""
    echo "  2. Review and update project files:"
    echo "     - Edit lean/$project_name/Defs.lean (add your definitions)"
    echo "     - Edit lean/$project_name/Basic.lean (add basic theorems)"
    echo "     - Edit tex/report.tex (update report content)"
    echo "     - Update README.md with project specifics"
    echo ""
    echo "  3. Build the project:"
    echo -e "     ${YELLOW}lake update && lake build${NC}"
    echo ""
    echo "  4. Start development:"
    echo "     - Add new Lean files in lean/$project_name/"
    echo "     - Prove theorems and add examples"
    echo "     - Update LaTeX report as you progress"
    echo ""
    echo "  5. Generate final report:"
    echo -e "     ${YELLOW}cd tex && latexmk -pdf report.tex${NC}"
    echo ""
    echo -e "${BLUE}Useful Commands:${NC}"
    echo "  lake build          # Build the project"
    echo "  lean --run lean/$project_name.lean  # Test compilation"
    echo "  #lint              # Add to Lean files for linting"
    echo ""
    echo -e "${GREEN}Happy formalizing! 🎉${NC}"
}

main() {
    local project_name_arg="$1"
    
    print_header
    check_dependencies
    get_project_name "$project_name_arg"
    get_target_directory
    clone_template
    rename_project
    initialize_git
    setup_project
    print_summary
}

# Run the script
main "$@"