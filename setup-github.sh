#!/bin/bash
# One-time setup: links this folder to github.com/jordanlayao/jlayao-3d
set -e

cd "$(dirname "$0")"
GH="${GH:-/opt/homebrew/bin/gh}"

if ! "$GH" auth status &>/dev/null; then
  echo "→ Log in to GitHub (follow the prompts)..."
  "$GH" auth login
fi

echo "→ Creating repo jlayao-3d on GitHub (if it doesn't exist)..."
"$GH" repo create jlayao-3d --public --source=. --remote=origin --push \
  || git push -u origin main

echo ""
echo "Done! Your site will be live at:"
echo "  https://jordanlayao.github.io/jlayao-3d/"
echo ""
echo "Enable Pages: repo → Settings → Pages → main branch → / (root)"
echo ""
echo "To sync future changes:"
echo "  git add -A && git commit -m \"Your message\" && git push"
