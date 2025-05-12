# 🚀 Quick Start Guide

Welcome to the Claude Project Management Agent Pipeline! This guide will get you up and running in minutes.

## Step 1: Clone the Repository

```bash
git clone https://github.com/aigeezer/claude-project-agents.git
cd claude-project-agents
```

## Step 2: Run Setup

```bash
cd scripts
chmod +x make_executable.sh
./make_executable.sh
cd ..
./scripts/setup_environment.sh
```

When prompted, enter your preferred base directory path (e.g., `/Users/yourname`).

## Step 3: Start Your First Project

1. Open Claude in your browser
2. Copy the content from `docs/1. ProjectManagerPrompt.md`
3. Paste it into Claude
4. Tell Claude about your project idea
5. Follow the agent's instructions

## Step 4: Continue Through the Pipeline

Each agent will:
- Create documentation in your project folder
- Prepare deliverables for the next agent
- Update the build plan

Progress through all 9 agents:
1. Project Manager
2. UI/UX Designer
3. Technical Architect
4. Frontend Developer
5. Backend Developer
6. DevOps Engineer
7. QA Engineer
8. Site Reliability Engineer
9. Product Analyst

## That's it! 🎉

Your project will have comprehensive documentation and a clear development path from concept to production.

### Need Help?

- Check the main [README.md](README.md) for detailed information
- Run `./scripts/reset_to_defaults.sh` to reset paths if needed
- Open an issue on GitHub for support
