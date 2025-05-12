#!/bin/bash

# Check Status Script for Claude Project Agents
# This script shows the current status of the repository

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Claude Project Agents - Repository Status${NC}"
echo -e "${BLUE}========================================${NC}"

# Navigate to the project directory
cd "/Users/tony/claude project management"

# Check if git repository exists
if [ ! -d .git ]; then
    echo -e "${RED}Git repository not initialized${NC}"
    echo -e "${YELLOW}Run './initial_github_upload.sh' to initialize${NC}"
    exit 1
fi

# Show current branch
echo -e "${GREEN}Current branch:${NC}"
git branch --show-current

# Show remote information
echo -e "\n${GREEN}Remote repository:${NC}"
git remote -v

# Show status
echo -e "\n${GREEN}Working directory status:${NC}"
git status --short

# Show unpushed commits
echo -e "\n${GREEN}Unpushed commits:${NC}"
BRANCH=$(git branch --show-current)
git log origin/$BRANCH..HEAD --oneline 2>/dev/null || echo "None"

# Show recent commits
echo -e "\n${GREEN}Recent commits:${NC}"
git log --oneline -5

# Show file count
echo -e "\n${GREEN}Repository statistics:${NC}"
file_count=$(find . -type f -not -path "./.git/*" | wc -l)
echo "Total files: $file_count"

# Show last update
echo -e "\n${GREEN}Last commit date:${NC}"
git log -1 --format=%cd
