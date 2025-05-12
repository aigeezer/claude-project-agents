#!/bin/bash

# Make all scripts executable
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

chmod +x "$SCRIPT_DIR/initial_github_upload.sh"
chmod +x "$SCRIPT_DIR/update_github.sh"
chmod +x "$SCRIPT_DIR/check_status.sh"
chmod +x "$SCRIPT_DIR/setup_environment.sh"
chmod +x "$SCRIPT_DIR/reset_to_defaults.sh"

echo "All scripts are now executable!"
echo "To configure for your environment: ./scripts/setup_environment.sh"
echo "To run the initial upload: ./scripts/initial_github_upload.sh"
echo "To run updates: ./scripts/update_github.sh"
echo "To check status: ./scripts/check_status.sh"
echo "To reset to defaults: ./scripts/reset_to_defaults.sh"
