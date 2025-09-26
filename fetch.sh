#!/usr/bin/env bash
# Sync local repo with origin

REPO_DIR="/opt/homepage/config"
SCRIPT_NAME="fetch.sh"
LINK_PATH="/usr/local/bin/fetch"

echo ">>> Changing directory to $REPO_DIR"
cd "$REPO_DIR" || { echo "Repo not found"; exit 1; }

echo ">>> Fetching latest from origin..."
git fetch origin

echo ">>> Resetting local branch to match origin/main..."
git reset --hard origin/main

echo ">>> Cleaning untracked files and directories..."
git clean -fd

echo ">>> Making $SCRIPT_NAME executable..."
chmod +x "$REPO_DIR/$SCRIPT_NAME"

echo ">>> Creating symlink at $LINK_PATH"
ln -sf "$REPO_DIR/$SCRIPT_NAME" "$LINK_PATH"

echo ">>> Sync complete. You can now run 'fetch' from anywhere."