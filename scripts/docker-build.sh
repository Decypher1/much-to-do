#!/bin/bash

echo "🚀 Building Docker images..."

docker-compose build

if [ $? -eq 0 ]; then
  echo "✅ Docker build completed successfully"
else
  echo "❌ Docker build failed"
  exit 1
fi