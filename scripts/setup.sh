#!/bin/bash

echo "🔧 Setting up environment..."

# Generate SSH access keys for user login
ssh-keygen -t ed25519 -N "" -f ssh/access_key

# Generate SSH host keys for server identity
ssh-keygen -t ed25519 -N "" -f ssh/host_key

# Set proper permissions on host keys
chmod 600 ssh/host_key
chmod 644 ssh/host_key.pub

echo "✅ SSH keys generated successfully!"