#!/bin/bash

echo "🔧 Setting up environment..."

# Get the repo root directory
REPO_ROOT=$(pwd)

# Create ssh directory if it doesn't exist
mkdir -p "$REPO_ROOT/ssh"

# Generate SSH access keys for user login
ssh-keygen -t ed25519 -N "" -f "$REPO_ROOT/ssh/access_key"

# Generate SSH host keys for server identity
ssh-keygen -t ed25519 -N "" -f "$REPO_ROOT/ssh/host_key"

# Set proper permissions on host keys
chmod 600 "$REPO_ROOT/ssh/host_key"
chmod 644 "$REPO_ROOT/ssh/host_key.pub"

echo "✅ SSH keys generated successfully!"