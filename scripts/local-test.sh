#!/bin/bash

# Default RAM to 8g if not provided
RAM=${1:-8g}

# Default CPUS to 4 if not provided
CPUS=${2:-4}

echo "🔧 Building & running development environment..."

docker build -t dev-environment .
docker run -d -m "$RAM" --cpus "$CPUS" -p 2222:22 dev-environment

echo "✅ Development environment is up and running on port 2222 with $RAM RAM and $CPUS CPU cores!"