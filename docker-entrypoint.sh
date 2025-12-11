#!/bin/sh
set -e

# Generate runtime config.js from environment variables
# This is the standard pattern for Vite apps on Cloud Run
/usr/local/bin/generate-config.sh

# Start nginx
exec nginx -g 'daemon off;'

