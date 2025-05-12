#!/bin/bash

# GitHub Update Script for Claude Project Agents
# This script updates the repository with any changes

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting GitHub update process...${NC}"

# Navigate to the project directory
cd "/Users/tony/claude project management"

# Check if git repository exists
if [ ! -d .git ]; then
    echo -e "${RED}Error: Git repository not initialized${NC}"
    echo -e "${YELLOW}Please run 'initial_github_upload.sh' first${NC}"
    exit 1
fi

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)
echo -e "${BLUE}Current branch: $CURRENT_BRANCH${NC}"

# Ensure we're on the main branch
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo -e "${YELLOW}Switching to main branch...${NC}"
    git checkout main || git checkout -b main
fi

# Check for changes
echo -e "${BLUE}Checking for changes...${NC}"
if [ -z "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}No changes to commit${NC}"
    exit 0
fi

# Show status
echo -e "${BLUE}Current status:${NC}"
git status --short

# Stage all changes
echo -e "${GREEN}Staging all changes...${NC}"
git add .

# Get commit message from user
echo -e "${YELLOW}Enter commit message (or press Enter for default):${NC}"
read -r commit_msg

# Use default message if none provided
if [ -z "$commit_msg" ]; then
    commit_date=$(date +"%Y-%m-%d %H:%M:%S")
    commit_msg="Updated Claude Project Agents - $commit_date"
fi

# Commit changes
echo -e "${GREEN}Committing changes...${NC}"
git commit -m "$commit_msg"

# Pull latest changes first (to avoid conflicts)
echo -e "${GREEN}Pulling latest changes from remote...${NC}"
git pull origin main --rebase

# Push changes
echo -e "${GREEN}Pushing changes to GitHub...${NC}"
git push origin main

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Update successful!${NC}"
    echo -e "${GREEN}View changes at: https://github.com/aigeezer/claude-project-agents${NC}"
else
    echo -e "${RED}Push failed. Please check your credentials and try again.${NC}"
    exit 1
fi

# Show recent commits
echo -e "${BLUE}Recent commits:${NC}"
git log --oneline -5
