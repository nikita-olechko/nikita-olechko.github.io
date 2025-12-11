#!/bin/sh
set -e

# Generate config.js from environment variables
# This allows runtime configuration for Vite apps

CONFIG_FILE="/usr/share/nginx/html/config.js"

# Create a basic config.js file
# You can extend this to include environment variables as needed
cat > "$CONFIG_FILE" <<EOF
// Runtime configuration
window.__RUNTIME_CONFIG__ = {
  // Add runtime config variables here
};
EOF

echo "Generated config.js at $CONFIG_FILE"

