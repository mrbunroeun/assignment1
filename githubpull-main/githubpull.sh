#!/bin/bash

# Extract the username from the URL
if [[ "$1" =~ github\.com/([^/]+) ]]; then
    username="${BASH_REMATCH[1]}"
else
    echo "Invalid GitHub URL."
    exit 1
fi

# Use GitHub API to fetch public repositories
curl -s "https://api.github.com/users/$username/repos" | \
    grep '"name":' | \
    cut -d '"' -f 4 > "${username}.txt"

echo "Saved repository list to ${username}.txt"
