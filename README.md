# MuchToDo Application – Containerization & Kubernetes Deployment

## 📌 Project Overview

This project demonstrates the containerization and deployment of the **MuchToDo API**, a task management backend built with Go. The application is packaged using Docker, orchestrated with Docker Compose, and deployed to a Kubernetes cluster using Kind.

The objective is to showcase practical DevOps skills, including containerization, multi-service orchestration, and Kubernetes-based deployment with service exposure.

---

## 🛠️ Tech Stack

* **Backend:** Go (Golang) with Gin framework
* **Database:** MongoDB
* **Cache (optional):** Redis
* **Containerization:** Docker
* **Orchestration:** Docker Compose
* **Kubernetes:** Kind (Kubernetes in Docker)
* **Ingress Controller:** NGINX Ingress

---

## 🐳 Docker Setup

### 1. Build and Run Containers

```bash
docker-compose up -d --build
```

### 2. Services Included

* Backend API (`muchtodo-backend`)
* MongoDB (`mongodb`)
* Mongo Express (`mongo-express`)
* Redis (`redis`)
* Redis Commander (`redis-commander`)

### 3. Verify Running Containers

```bash
docker ps
```

### 4. Access Application

```text
http://localhost:8080/ping
```

Expected response:

```json
{"message":"pong"}
```

---

## ☸️ Kubernetes Deployment (Kind)

### 1. Create Cluster

```bash
kind create cluster --name muchtodo-cluster
```

### 2. Load Docker Image into Cluster

```bash
kind load docker-image much-to-do-backend:latest --name muchtodo-cluster
```

### 3. Apply Kubernetes Manifests

```bash
kubectl apply -f k8s/
```

### 4. Verify Pods

```bash
kubectl get pods
```

---

## 🌐 Service Exposure

### Option 1: NodePort (if configured)

```text
http://localhost:<nodeport>/ping
```

---

### Option 2: Ingress (Recommended)

#### Install Ingress Controller

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```

#### Apply Ingress Resource

```bash
kubectl apply -f k8s/ingress.yaml
```

#### Add Host Entry (Windows)

```text
127.0.0.1 muchtodo.local
```

#### Port Forward (Kind Requirement)

```bash
kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80
```

#### Access Application

```text
http://muchtodo.local:8080/ping
```

Expected response:

```json
{"message":"pong"}
```

---

## 📸 Deployment Evidence

Screenshots are provided in the `evidence/` folder demonstrating:

1. Docker build process completion
2. Docker containers running successfully
3. Application responding via Docker Compose
4. Kind cluster creation
5. Kubernetes pods running
6. Application accessible via Ingress
7. Kubernetes resources (`pods`, `services`, `ingress`)

---

## 📂 Project Structure

```text
much-to-do/
│
├── Server/MuchToDo/        # Go backend source code
├── k8s/                    # Kubernetes manifests
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
│   ├── mongodb-deployment.yaml
│   ├── mongodb-service.yaml
│   └── ingress.yaml
│
├── docker-compose.yml
├── Dockerfile
└── evidence/               # Screenshots for submission
```

---

## ✅ Key Achievements

* Successfully containerized a Go backend application
* Configured multi-service architecture using Docker Compose
* Deployed application to Kubernetes using Kind
* Implemented service exposure via NodePort and Ingress
* Verified application accessibility in both Docker and Kubernetes environments

---

## 🚀 Conclusion

This project demonstrates end-to-end deployment of a backend application from local development to containerized orchestration and Kubernetes deployment. It highlights practical DevOps skills including container management, service networking, and cluster-based deployment.

---
