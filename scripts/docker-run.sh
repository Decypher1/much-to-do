#!/bin/bash

echo "🚀 Starting application with Docker Compose..."

docker-compose up -d

if [ $? -eq 0 ]; then
  echo "✅ Application is running"
  docker ps
else
  echo "❌ Failed to start application"
  exit 1
fi