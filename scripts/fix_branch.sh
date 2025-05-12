#!/bin/bash

# Fix Branch Script for Claude Project Agents
# This script helps resolve branch conflicts between main and master

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Claude Project Agents - Branch Fix${NC}"
echo -e "${BLUE}==================================${NC}"

# Navigate to the project directory
cd "/Users/tony/claude project management"

# Check current branch
CURRENT_BRANCH=$(git branch --show-current)
echo -e "${YELLOW}Current branch: $CURRENT_BRANCH${NC}"

# If already on main, just pull latest
if [ "$CURRENT_BRANCH" = "main" ]; then
    echo -e "${GREEN}Already on main branch. Pulling latest changes...${NC}"
    git pull origin main
    exit 0
fi

# If on master, need to merge with main
if [ "$CURRENT_BRANCH" = "master" ]; then
    echo -e "${YELLOW}On master branch. Need to sync with main...${NC}"
    
    # Fetch all branches
    echo -e "${GREEN}Fetching all branches...${NC}"
    git fetch --all
    
    # Create or checkout main branch
    echo -e "${GREEN}Switching to main branch...${NC}"
    git checkout main || git checkout -b main origin/main
    
    # Merge master into main
    echo -e "${GREEN}Merging master branch into main...${NC}"
    git merge master --no-edit
    
    # Push the merged main branch
    echo -e "${GREEN}Pushing merged main branch...${NC}"
    git push origin main
    
    # Delete local master branch
    echo -e "${YELLOW}Deleting local master branch...${NC}"
    git branch -d master
    
    echo -e "${GREEN}✅ Branch fix complete! Now using main branch.${NC}"
fi

# Show current status
echo -e "\n${BLUE}Current status:${NC}"
git status

echo -e "\n${GREEN}You can now use update_github.sh to push changes.${NC}"
