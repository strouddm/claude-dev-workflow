#!/bin/bash

# Claude Dev Workflow - GitHub Deployment Script
# This script helps you deploy the project to GitHub

set -e

echo "Claude Dev Workflow - GitHub Deployment"
echo "========================================="
echo

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install git first."
    exit 1
fi

# Check if gh CLI is installed (optional but helpful)
HAS_GH_CLI=false
if command -v gh &> /dev/null; then
    HAS_GH_CLI=true
    echo "GitHub CLI detected - will use for repository creation"
else
    echo "Note: GitHub CLI not found - you'll need to create the repository manually"
fi

# Get repository details
echo
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter repository name (default: claude-dev-workflow): " REPO_NAME
REPO_NAME=${REPO_NAME:-claude-dev-workflow}

read -p "Make repository public? (y/n, default: y): " IS_PUBLIC
IS_PUBLIC=${IS_PUBLIC:-y}

if [[ "$IS_PUBLIC" == "y" ]]; then
    VISIBILITY="public"
else
    VISIBILITY="private"
fi

# Initialize git repository if not already initialized
if [ ! -d .git ]; then
    echo
    echo "Initializing git repository..."
    git init
    git branch -M main
else
    echo "Git repository already initialized"
fi

# Add all files
echo "Adding files to git..."
git add .

# Determine version from CHANGELOG
VERSION=$(grep -m 1 "^## Version" CHANGELOG.md | sed 's/## Version \([^ ]*\).*/\1/' || echo "2.0.0")

# Create initial commit
echo "Creating initial commit..."
git commit -m "Initial commit: Claude Dev Workflow v${VERSION}

- AI-powered development workflow with 3 agents
- Automatic project context integration
- Product Owner, Engineer, and Manager agents
- Complete documentation and templates"

# Create GitHub repository
if [[ "$HAS_GH_CLI" == true ]]; then
    echo
    echo "Creating GitHub repository..."
    gh repo create "$GITHUB_USERNAME/$REPO_NAME" --$VISIBILITY --description "AI-powered software development workflow that reduces development cycles from weeks to days" --source=.
    
    echo "Repository created and remote added"
else
    echo
    echo "Please create a repository on GitHub:"
    echo "   1. Go to https://github.com/new"
    echo "   2. Repository name: $REPO_NAME"
    echo "   3. Description: AI-powered software development workflow that reduces development cycles from weeks to days"
    echo "   4. Visibility: $VISIBILITY"
    echo "   5. DO NOT initialize with README, .gitignore, or license"
    echo
    read -p "Press Enter when you've created the repository..."
    
    # Add remote
    echo "Adding remote origin..."
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
fi

# Push to GitHub
echo
echo "Pushing to GitHub..."
git push -u origin main

# Create initial release tag
echo
echo "Creating release tag..."
git tag -a "v${VERSION}" -m "Release v${VERSION}: Enhanced Project Context Integration"
git push origin "v${VERSION}"

# Display success message
echo
echo "Successfully deployed to GitHub!"
echo
echo "Your repository is now available at:"
echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo
echo "Next steps:"
echo "   1. Visit your repository on GitHub"
echo "   2. Add topics: ai, workflow, automation, development-tools"
echo "   3. Create a release from tag v${VERSION}"
echo "   4. Share with your team!"
echo
echo "Consider starring the repository if you find it useful!"

# Optional: Open repository in browser
if command -v open &> /dev/null; then
    read -p "Open repository in browser? (y/n): " OPEN_BROWSER
    if [[ "$OPEN_BROWSER" == "y" ]]; then
        open "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    fi
elif command -v xdg-open &> /dev/null; then
    read -p "Open repository in browser? (y/n): " OPEN_BROWSER
    if [[ "$OPEN_BROWSER" == "y" ]]; then
        xdg-open "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    fi
fi