#!/bin/bash

# Reset to Defaults Script for Claude Project Agents
# This script restores all paths to the original default values

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Claude Project Agents - Reset to Defaults${NC}"
echo -e "${BLUE}=======================================${NC}"
echo ""

# Check if configuration exists
if [ ! -f ".claude_config" ]; then
    echo -e "${YELLOW}No configuration file found.${NC}"
    echo -e "${YELLOW}Paths may already be at default values.${NC}"
    
    # Ask if user wants to proceed anyway
    echo -e "${GREEN}Reset to default path (/Users/tony) anyway? (y/n):${NC}"
    read -r CONFIRM
    
    if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
        echo -e "${RED}Reset cancelled.${NC}"
        exit 1
    fi
    
    CURRENT_PATH="/Users/tony"
    ORIGINAL_PATH="/Users/tony"
else
    # Read configuration
    source .claude_config
    CURRENT_PATH="$USER_BASE_PATH"
fi

DEFAULT_PATH="/Users/tony"

# Confirm reset
echo -e "${YELLOW}This will reset all paths from '$CURRENT_PATH' to '$DEFAULT_PATH'${NC}"
echo -e "${GREEN}Proceed? (y/n):${NC}"
read -r CONFIRM

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo -e "${RED}Reset cancelled.${NC}"
    exit 1
fi

# Create backup directory
BACKUP_DIR="backups/reset_$(date +%Y%m%d_%H%M%S)"
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

# Backup current files
echo -e "${GREEN}Backing up current files...${NC}"
for file in $MD_FILES; do
    cp "$file" "$BACKUP_DIR/$(basename "$file")"
    echo -e "  Backed up: $(basename "$file")"
done

# Also backup README if it exists
if [ -f "README.md" ]; then
    cp "README.md" "$BACKUP_DIR/README.md"
fi

# Reset paths in all markdown files
echo -e "${GREEN}Resetting paths to defaults...${NC}"
UPDATED_COUNT=0

for file in $MD_FILES; do
    # Create a temporary file
    TEMP_FILE="${file}.tmp"
    
    # Replace current path with default path
    sed "s|$CURRENT_PATH|$DEFAULT_PATH|g" "$file" > "$TEMP_FILE"
    
    # Check if any replacements were made
    if ! cmp -s "$file" "$TEMP_FILE"; then
        mv "$TEMP_FILE" "$file"
        echo -e "  ${GREEN}Reset: $(basename "$file")${NC}"
        ((UPDATED_COUNT++))
    else
        rm "$TEMP_FILE"
        echo -e "  ${YELLOW}No changes: $(basename "$file")${NC}"
    fi
done

# Also reset the main README if it exists
if [ -f "README.md" ]; then
    TEMP_FILE="README.md.tmp"
    sed "s|$CURRENT_PATH|$DEFAULT_PATH|g" "README.md" > "$TEMP_FILE"
    if ! cmp -s "README.md" "$TEMP_FILE"; then
        mv "$TEMP_FILE" "README.md"
        echo -e "  ${GREEN}Reset: README.md${NC}"
        ((UPDATED_COUNT++))
    else
        rm "$TEMP_FILE"
    fi
fi

# Remove configuration file
if [ -f ".claude_config" ]; then
    echo -e "${GREEN}Removing configuration file...${NC}"
    rm .claude_config
fi

# Summary
echo ""
echo -e "${BLUE}Reset Complete!${NC}"
echo -e "${GREEN}✓ Reset $UPDATED_COUNT files to defaults${NC}"
echo -e "${GREEN}✓ Backups saved to: $BACKUP_DIR${NC}"
echo -e "${GREEN}✓ Configuration file removed${NC}"
echo ""
echo -e "${YELLOW}All paths have been reset to:${NC}"
echo -e "${BLUE}  Default path: $DEFAULT_PATH${NC}"
echo ""
echo -e "${GREEN}You can run ./setup_environment.sh to configure a custom path again.${NC}"
