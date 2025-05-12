# Claude Project Management Agent Pipeline

**Important: This pipeline is designed for the Claude Desktop App. The MCP tools will not work in the web-based version of Claude.**

A comprehensive AI agent pipeline for end-to-end application development using Claude. This system provides structured prompts for 9 specialized AI agents that work together to take a project from initial concept through to production deployment and analytics.

## 🎯 Project Overview

This pipeline consists of 9 specialized AI agents, each handling a specific phase of application development:

1. **Project Manager** - Discovery & Planning Phase
2. **UI/UX Designer** - Design & User Experience Phase
3. **Technical Architect** - System Design & Architecture Phase
4. **Frontend Developer** - User Interface Implementation Phase
5. **Backend Developer** - Server-Side Implementation Phase
6. **DevOps Engineer** - Deployment & Infrastructure Phase
7. **QA Engineer** - Quality Assurance & Testing Phase
8. **Site Reliability Engineer** - Production Operations Phase
9. **Product Analyst** - Analytics & Optimization Phase

Each agent creates specific deliverables that feed into the next phase, ensuring comprehensive documentation and seamless handoffs throughout the development lifecycle.

## 🛠️ Required MCP Tools

The AI agent prompts utilize several MCP (Model Context Protocol) tools. To use all features of the prompts, you'll need the following MCPs:

### Core MCPs Used:
- **Sequential Thinking** - For complex problem-solving and planning
- **Web Search** - For researching best practices and current information
- **Tavily** - For deep technical research and documentation
- **Context7** - For accessing up-to-date library documentation
- **Knowledge Graph** - For maintaining project continuity across agents
- **Filesystem** - For reading and writing project files
- **Google Drive** (optional) - For team collaboration and document sharing
- **Fetch** - For analyzing competitor websites and documentation

### MCP Resources:
- **Configuration File**: A pre-configured `claude_desktop_config.json` is included in this repository
- **MCP Servers Directory**: [MCP Servers Repository](https://github.com/modelcontextprotocol/servers) - Collection of available MCP servers
- **Awesome MCP Servers**: [Awesome MCP Servers](https://github.com/appcypher/awesome-mcp-servers) - Curated list of MCP servers
- **MCP Documentation**: [MCP Docs](https://modelcontextprotocol.io/introduction) - Official documentation

### Quick Setup:
1. Download the included `claude_desktop_config.json`
2. Place it in your Claude Desktop configuration directory:
   - **macOS**: `/Users/[yourname]/Library/Application Support/Claude/`
   - **Windows**: `%APPDATA%\Claude\`
   - **Linux**: `~/.config/claude/`
3. Restart Claude Desktop to load the MCPs

Note: Not all MCPs are required for basic functionality. The agents will work with available tools and notify you if a specific MCP is needed for a task.

## 🚀 Quick Start

### 1. Download the Repository

```bash
git clone https://github.com/aigeezer/claude-project-agents.git
cd claude-project-agents
```

### 2. Initial Setup

Run the setup script to configure the prompts for your environment:

```bash
cd scripts
chmod +x make_executable.sh
./make_executable.sh
cd ..
./scripts/setup_environment.sh
```

The script will:
- Ask for your preferred base directory (e.g., `/Users/yourname` or `/home/yourname`)
- Update all prompts with your file paths
- Create backup copies of the original files

### 3. Using the Agents

Each agent has its own prompt file in the `docs` directory. To use them:

1. Start with `1. ProjectManagerPrompt.md`
2. Copy the prompt content into Claude
3. Follow the agent's instructions
4. Each agent will create deliverables that the next agent will use
5. Progress sequentially through all 9 agents

## 📁 Repository Structure

```
claude-project-agents/
├── docs/
│   ├── 1. ProjectManagerPrompt.md
│   ├── 2. TechnicalArchitectPrompt.md
│   ├── 3. UIUXDesignerPrompt.md
│   ├── 4. FrontendDeveloperPrompt.md
│   ├── 5. BackendDeveloperPrompt.md
│   ├── 6. DevOpsEngineerPrompt.md
│   ├── 7. QAEngineerPrompt.md
│   ├── 8. SiteReliabilityEngineerPrompt.md
│   ├── 9. ProductAnalystPrompt.md
│   ├── 10. AgentSummary.md
│   └── build-plan-template.md
├── scripts/
│   ├── setup_environment.sh      # Configuration script
│   ├── reset_to_defaults.sh      # Reset script
│   ├── initial_github_upload.sh  # Initial GitHub upload
│   ├── update_github.sh          # GitHub updates
│   ├── check_status.sh           # Repository status
│   ├── fix_branch.sh             # Branch fix utility
│   └── make_executable.sh        # Make scripts executable
├── claude_desktop_config.json    # MCP configuration file
├── QUICK_START.md               # Quick start guide
├── README.md                    # This file
└── README_GitHub_Scripts.md     # GitHub scripts documentation
```

## ⚙️ Configuration

### Default Path Structure

The prompts use the following default path structure:
- Base path: `/Users/tony/`
- Project path: `/Users/tony/[project-name]/`
- Documentation path: `/Users/tony/[project-name]/docs/[Role Name]/`

### Customizing Paths

When you run `scripts/setup_environment.sh`, you'll be prompted to enter your preferred base directory. The script will automatically update all references throughout the documentation.

Example:
```
Enter your base directory path (e.g., /Users/yourname or /home/yourname): /Users/john
```

This will update all paths from `/Users/tony/` to `/Users/john/`.

### Manual Configuration

If you prefer to manually update the paths:
1. Search for `/Users/tony/` in all `.md` files
2. Replace with your preferred base path
3. Ensure consistency across all documents

## 📋 How the Pipeline Works

### 1. Sequential Workflow
Each agent builds upon the work of previous agents:
- Agents read deliverables from previous phases
- They create new documents in their role-specific folders
- They update the central `build-plan.md` file
- They store important metadata in the knowledge graph

### 2. Knowledge Graph Integration
The pipeline uses Claude's knowledge graph for continuity:
- Project Manager stores the project path
- Subsequent agents retrieve this path
- Important decisions and patterns are preserved

### 3. MCP Tool Usage
All agents utilize MCP (Model Context Protocol) tools:
- Sequential Thinking for complex problem-solving
- Web Search for research and best practices
- Context7 for documentation
- Filesystem for reading/writing files
- Knowledge Graph for maintaining state

## 🛠️ Key Features

- **Consistent Documentation**: All deliverables follow standardized formats
- **Role-Based Organization**: Each agent has its own documentation folder
- **Progressive Enhancement**: Each phase builds on previous work
- **Comprehensive Coverage**: From initial concept to production analytics
- **Flexibility**: Agents can be customized for specific project needs

## 📝 Deliverables by Agent

### Project Manager
- MarketResearch.md
- PRD.md (Product Requirements Document)
- BusinessModel.md
- TechnicalFeasibility.md
- ProjectTimeline.md

### UI/UX Designer
- UserPersonas.md
- UserFlows.md
- Wireframes.md
- DesignSystem.md
- PrototypeSpec.md

### Technical Architect
- SystemArchitecture.md
- DataModel.md
- APISpecification.md
- SecurityArchitecture.md
- InfrastructureSpec.md
- build-plan.md

### [Additional agents create their specific deliverables...]

## 🔧 Troubleshooting

### Common Issues

1. **Permission Errors**
   ```bash
   chmod +x scripts/setup_environment.sh
   ```

2. **Path Not Found**
   - Ensure your base directory exists
   - Check for typos in the path
   - Use absolute paths (starting with `/`)

3. **Script Errors**
   - Make sure you have bash installed
   - Run scripts from the repository root directory

### Resetting to Defaults

If you need to reset the paths to default:
```bash
./scripts/reset_to_defaults.sh
```

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📜 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

Created for the Claude AI community to streamline application development workflows.

---

For questions or support, please open an issue on GitHub.
