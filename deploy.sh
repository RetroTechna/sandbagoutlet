#!/bin/bash
# =============================================================
# Deploy sandbagoutlet.com
# Push to GitHub → Cloudflare Pages auto-deploys
# Usage: ./deploy.sh
# =============================================================
set -e

echo "=== sandbagoutlet.com deploy ==="
echo ""

# Show what changed
git status --short

# Check if there are changes to commit
if git diff --quiet HEAD && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo ""
  echo "No changes to deploy. Working tree is clean."
  exit 0
fi

echo ""
git add -A

echo -n "Commit message: "
read msg
git commit -m "${msg:-Update site}"

git push origin main

echo ""
echo "Pushed to GitHub. Cloudflare Pages will auto-deploy in ~30 seconds."
echo ""
echo "  Preview:    https://sandbagoutlet.pages.dev"
echo "  Production: https://sandbagoutlet.com"
echo "  Dashboard:  https://dash.cloudflare.com → Workers & Pages → sandbagoutlet"
