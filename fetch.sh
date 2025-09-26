#!/usr/bin/env bash
# Sync local repo with origin

REPO_DIR="/opt/homepage/config"

echo ">>> Changing directory to $REPO_DIR"
cd "$REPO_DIR" || { echo "Repo not found"; exit 1; }

echo ">>> Fetching latest from origin..."
git fetch origin

echo ">>> Resetting local branch to match origin/main..."
git reset --hard origin/main

echo ">>> Cleaning untracked files and directories..."
git clean -fd

echo ">>> Sync complete."