#!/usr/bin/env bash
set -euo pipefail

echo "Starting setup..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load helpers
source "$SCRIPT_DIR/../lib/utils.sh"

# Run modules
run_module "$SCRIPT_DIR/modules/updates.sh"
run_module "$SCRIPT_DIR/modules/gnome.sh"
#run_module "$SCRIPT_DIR/modules/apps.sh"
#run_module "$SCRIPT_DIR/modules/browser.sh"

echo "Setup complete."