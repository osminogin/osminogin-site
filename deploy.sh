#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t hyde-my

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
message="Rebuilding site `date`"
if [ $# -eq 1 ]
  then message="$1"
fi
git commit -m "$message"

# Push source and build repos.
git push origin master

# Come Back
cd ..
