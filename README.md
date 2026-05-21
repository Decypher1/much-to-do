# StartTech Application

This repository contains the frontend and backend application code for the StartTech full-stack cloud deployment project.

---

# Application Stack

## Frontend

- React
- Vite
- Hosted on Amazon S3
- Delivered using CloudFront CDN

## Backend

- Golang API
- Dockerized application
- Deployed on EC2 instances
- Managed using Auto Scaling Group
- Load balanced with Application Load Balancer

---

# CI/CD Pipelines

GitHub Actions automates deployment for both frontend and backend services.

## Frontend Pipeline

Workflow:
```bash
.github/workflows/frontend-ci-cd.yml
```

Pipeline stages:
- Install dependencies
- Run lint checks
- Build React application
- Deploy to S3
- Invalidate CloudFront cache

---

## Backend Pipeline

Workflow:
```bash
.github/workflows/backend-ci-cd.yml
```

Pipeline stages:
- Run Go tests
- Build Docker image
- Push image to Amazon ECR
- Deploy backend container

---

# Local Development

## Frontend

```bash
cd Client
npm install
npm run dev
```

## Backend

```bash
cd Server/MuchToDo
go run cmd/api/main.go
```

---

# Docker

## Build Backend Image

```bash
docker build -t starttech-backend .
```

---

# AWS Services Used

- EC2
- Auto Scaling Group
- Application Load Balancer
- Amazon S3
- CloudFront
- Amazon ECR
- ElastiCache Redis
- CloudWatch
- MongoDB Atlas

---

# Security

- IAM least privilege access
- GitHub Secrets for credentials
- Vulnerability scanning in CI/CD
- Security Groups for network isolation

---

# Monitoring

CloudWatch Logs are used for centralized application logging.

---

# Author

Martins Umekwe
Cloud Engineering / DevOps Assessment Project