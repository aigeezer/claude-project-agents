#!/bin/bash

# Initial GitHub Upload Script for Claude Project Agents
# This script initializes the repository and uploads all files to GitHub

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting initial GitHub upload process...${NC}"

# Navigate to the project directory
cd "/Users/tony/claude project management"

# Initialize git repository if not already initialized
if [ ! -d .git ]; then
    echo -e "${GREEN}Initializing git repository...${NC}"
    git init
else
    echo -e "${YELLOW}Git repository already initialized${NC}"
fi

# Create .gitignore file
echo -e "${GREEN}Creating .gitignore file...${NC}"
cat > .gitignore << EOL
# MacOS
.DS_Store
.AppleDouble
.LSOverride

# Temporary files
*.tmp
*.temp
*~

# Log files
*.log

# IDE files
.idea/
.vscode/
*.swp
*.swo

# Build files
build/
dist/
node_modules/

# Environment files
.env
.env.local

# Private or sensitive files
private/
secrets/
EOL

# Add remote repository
echo -e "${GREEN}Adding remote repository...${NC}"
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/aigeezer/claude-project-agents.git

# Stage all files
echo -e "${GREEN}Staging all files...${NC}"
git add .

# Create initial commit
echo -e "${GREEN}Creating initial commit...${NC}"
commit_date=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "Initial commit: Claude Project Management Agent Pipeline - $commit_date"

# Push to GitHub
echo -e "${GREEN}Pushing to GitHub...${NC}"
echo -e "${YELLOW}You may be prompted for your GitHub credentials${NC}"
git push -u origin main || git push -u origin master

# If push failed due to branch name, try creating main branch
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}Initial push failed. Creating 'main' branch and retrying...${NC}"
    git branch -M main
    git push -u origin main
fi

echo -e "${GREEN}✅ Initial upload complete!${NC}"
echo -e "${GREEN}Repository URL: https://github.com/aigeezer/claude-project-agents${NC}"
echo -e "${YELLOW}For future updates, use the 'update_github.sh' script${NC}"
