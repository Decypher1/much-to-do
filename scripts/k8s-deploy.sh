#!/bin/bash

CLUSTER_NAME="muchtodo-cluster"

echo "🚀 Creating Kind cluster (if not exists)..."
kind get clusters | grep -q $CLUSTER_NAME

if [ $? -ne 0 ]; then
  kind create cluster --name $CLUSTER_NAME
else
  echo "ℹ️ Cluster already exists"
fi

echo "📦 Loading Docker image into Kind..."
kind load docker-image much-to-do-backend:latest --name $CLUSTER_NAME

echo "📁 Applying Kubernetes manifests..."
kubectl apply -f ../k8s/

echo "⏳ Waiting for pods to be ready..."
kubectl wait --for=condition=ready pod --all --timeout=120s

echo "✅ Deployment complete!"
kubectl get pods