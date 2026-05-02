#!/bin/bash

CLUSTER_NAME="muchtodo-cluster"

echo "🧹 Deleting Kubernetes resources..."
kubectl delete -f ../k8s/ --ignore-not-found

echo "🗑️ Deleting Kind cluster..."
kind delete cluster --name $CLUSTER_NAME

echo "✅ Cleanup complete"