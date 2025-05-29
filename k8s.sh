#!/bin/bash

# Kubernetes Assignment - 1
echo "Task 1: Deploy Kubernetes cluster and NGINX deployment"
# Step 1: Cluster setup is assumed (Minikube/kubeadm)
echo "Ensure all nodes are ready:"
kubectl get nodes

echo "Creating NGINX deployment with 3 replicas..."
kubectl create deployment nginx-deployment --image=nginx --replicas=3
kubectl get deployments
kubectl get pods

# Kubernetes Assignment - 2
echo "Task 2: Expose NGINX deployment using NodePort"
kubectl expose deployment nginx-deployment --type=NodePort --port=80
kubectl get svc

# Kubernetes Assignment - 3
echo "Task 3: Scale NGINX deployment to 5 replicas"
kubectl scale deployment nginx-deployment --replicas=5
kubectl get pods

# Kubernetes Assignment - 4
echo "Task 4: Change service type to ClusterIP"
kubectl delete svc nginx-deployment
kubectl expose deployment nginx-deployment --type=ClusterIP --port=80
kubectl get svc

# Kubernetes Assignment - 5
echo "Task 5: Deploy second NGINX and configure Ingress"
kubectl create deployment nginx-second --image=nginx --replicas=3
kubectl expose deployment nginx-second --type=ClusterIP --port=80

echo "Install NGINX ingress controller (if not installed)"
echo "kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/cloud/deploy.yaml"

echo "Create an ingress resource (YAML example should be applied manually)"
