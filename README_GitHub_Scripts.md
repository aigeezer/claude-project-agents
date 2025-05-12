# GitHub Upload Scripts for Claude Project Agents

This folder contains scripts to manage the GitHub repository for the Claude Project Agents.

Note: All scripts have been moved to the `scripts/` directory.

## Scripts

### 1. initial_github_upload.sh
Use this script for the **first time** upload to GitHub. It will:
- Initialize the git repository
- Create a .gitignore file
- Add the remote repository
- Create an initial commit
- Push all files to GitHub

### 2. update_github.sh
Use this script for **subsequent updates** to GitHub. It will:
- Check for changes
- Stage all changed files
- Ask for a commit message (or use a default)
- Pull latest changes to avoid conflicts
- Push your changes to GitHub

### 3. check_status.sh
Use this script to check the current status of your repository. It will show:
- Current branch
- Remote repository information
- Working directory status
- Unpushed commits
- Recent commit history
- Repository statistics

### 4. make_executable.sh
A helper script to make the other scripts executable.

## Usage Instructions

### First Time Setup

1. First, make the scripts executable:
   ```bash
   cd scripts
   chmod +x make_executable.sh
   ./make_executable.sh
   cd ..
   ```

2. Run the initial upload:
   ```bash
   ./scripts/initial_github_upload.sh
   ```

3. You'll be prompted for your GitHub credentials (username and personal access token)

### Updating the Repository

After making changes to any files:

```bash
./scripts/update_github.sh
```

You'll be prompted to enter a commit message. Press Enter to use the default message.

### Checking Repository Status

To see the current status of your repository:

```bash
./scripts/check_status.sh
```

This will show you what changes are pending, recent commits, and other useful information.

## Requirements

- Git must be installed on your system
- You need a GitHub account with access to the repository
- For authentication, you'll need:
  - Your GitHub username
  - A personal access token (not your password)

## Creating a Personal Access Token

1. Go to GitHub Settings > Developer settings > Personal access tokens
2. Click "Generate new token"
3. Give it a descriptive name
4. Select the 'repo' scope
5. Generate and copy the token
6. Use this token as your password when prompted

## Repository URL

The scripts are configured to work with:
https://github.com/aigeezer/claude-project-agents

## Troubleshooting

- If you get permission errors, make sure you've run `scripts/make_executable.sh`
- If authentication fails, ensure you're using a personal access token, not your password
- If the push fails, check that you have write access to the repository
