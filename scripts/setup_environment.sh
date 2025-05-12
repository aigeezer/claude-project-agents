#!/bin/bash

# Setup Environment Script for Claude Project Agents
# This script configures all prompts with the user's preferred file paths

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Claude Project Agents - Environment Setup${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Default values
DEFAULT_PATH="/Users/tony"
BACKUP_DIR="backups/$(date +%Y%m%d_%H%M%S)"

# Get user input
echo -e "${YELLOW}Current default path: $DEFAULT_PATH${NC}"
echo -e "${GREEN}Enter your base directory path (e.g., /Users/yourname or /home/yourname):${NC}"
read -r USER_PATH

# If user doesn't enter anything, use current directory
if [ -z "$USER_PATH" ]; then
    echo -e "${YELLOW}No path entered. Using current directory...${NC}"
    USER_PATH=$(pwd)
fi

# Remove trailing slash if present
USER_PATH="${USER_PATH%/}"

# Confirm the path
echo -e "${BLUE}You entered: $USER_PATH${NC}"
echo -e "${YELLOW}This will replace all instances of '$DEFAULT_PATH' with '$USER_PATH'${NC}"
echo -e "${GREEN}Proceed? (y/n):${NC}"
read -r CONFIRM

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo -e "${RED}Setup cancelled.${NC}"
    exit 1
fi

# Create backup directory
echo -e "${GREEN}Creating backup directory...${NC}"
mkdir -p "$BACKUP_DIR"

# Find all markdown files
echo -e "${GREEN}Finding all markdown files...${NC}"
MD_FILES=$(find docs -name "*.md" 2>/dev/null)

if [ -z "$MD_FILES" ]; then
    echo -e "${RED}No markdown files found in docs directory.${NC}"
    echo -e "${YELLOW}Make sure you're running this script from the repository root.${NC}"
    exit 1
fi

# Backup original files
echo -e "${GREEN}Backing up original files...${NC}"
for file in $MD_FILES; do
    cp "$file" "$BACKUP_DIR/$(basename "$file")"
    echo -e "  Backed up: $(basename "$file")"
done

# Also backup this README if it exists
if [ -f "README.md" ]; then
    cp "README.md" "$BACKUP_DIR/README.md"
fi

# Replace paths in all markdown files
echo -e "${GREEN}Updating paths in documentation...${NC}"
UPDATED_COUNT=0

for file in $MD_FILES; do
    # Create a temporary file
    TEMP_FILE="${file}.tmp"
    
    # Replace the default path with the user's path
    sed "s|$DEFAULT_PATH|$USER_PATH|g" "$file" > "$TEMP_FILE"
    
    # Check if any replacements were made
    if ! cmp -s "$file" "$TEMP_FILE"; then
        mv "$TEMP_FILE" "$file"
        echo -e "  ${GREEN}Updated: $(basename "$file")${NC}"
        ((UPDATED_COUNT++))
    else
        rm "$TEMP_FILE"
        echo -e "  ${YELLOW}No changes: $(basename "$file")${NC}"
    fi
done

# Also update the main README if it exists
if [ -f "README.md" ]; then
    TEMP_FILE="README.md.tmp"
    sed "s|$DEFAULT_PATH|$USER_PATH|g" "README.md" > "$TEMP_FILE"
    if ! cmp -s "README.md" "$TEMP_FILE"; then
        mv "$TEMP_FILE" "README.md"
        echo -e "  ${GREEN}Updated: README.md${NC}"
        ((UPDATED_COUNT++))
    else
        rm "$TEMP_FILE"
    fi
fi

# Create a configuration file to remember the user's choice
echo -e "${GREEN}Saving configuration...${NC}"
cat > .claude_config << EOL
# Claude Project Agents Configuration
# Generated on $(date)
USER_BASE_PATH="$USER_PATH"
ORIGINAL_PATH="$DEFAULT_PATH"
EOL

# Summary
echo ""
echo -e "${BLUE}Setup Complete!${NC}"
echo -e "${GREEN}✓ Updated $UPDATED_COUNT files${NC}"
echo -e "${GREEN}✓ Backups saved to: $BACKUP_DIR${NC}"
echo -e "${GREEN}✓ Configuration saved to: .claude_config${NC}"
echo ""
echo -e "${YELLOW}Your environment is now configured for:${NC}"
echo -e "${BLUE}  Base path: $USER_PATH${NC}"
echo -e "${BLUE}  Projects will be created at: $USER_PATH/[project-name]/${NC}"
echo ""
echo -e "${GREEN}You can now start using the Claude Project Agents!${NC}"
echo -e "${YELLOW}Begin with: docs/1. ProjectManagerPrompt.md${NC}"
