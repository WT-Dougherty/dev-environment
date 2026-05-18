#!/bin/bash

echo "🔧 Building & running development environment..."

docker build -t dev-environment .
docker run -d -m 8g -p 2222:22 dev-environment


echo "✅ Development environment is up and running on port 2222!"