#!/bin/bash
# =============================================================
# Deploy sandbagoutlet.com to Cloudflare Pages
# Usage: ./deploy.sh
# =============================================================
set -e

PROJECT_NAME="sandbagoutlet"
DEPLOY_DIR="."

echo "Deploying ${PROJECT_NAME} to Cloudflare Pages..."

# Check wrangler is available
if ! command -v wrangler &> /dev/null; then
  echo "Error: wrangler CLI not found."
  echo "Install it with: npm install -g wrangler"
  echo "Then authenticate: wrangler login"
  exit 1
fi

# Check authentication
if ! wrangler whoami &> /dev/null; then
  echo "Error: Not authenticated. Run: wrangler login"
  exit 1
fi

# Deploy
wrangler pages deploy "${DEPLOY_DIR}" --project-name "${PROJECT_NAME}"

echo ""
echo "Deploy complete!"
echo "Preview: https://${PROJECT_NAME}.pages.dev"
echo "Production: https://sandbagoutlet.com (after custom domain setup)"
