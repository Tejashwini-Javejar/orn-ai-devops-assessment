# Deployment Runbook – AWS GitOps Platform Capstone

## Purpose

This runbook describes the steps followed to deploy the AWS GitOps Platform Capstone project. It includes infrastructure provisioning, application containerization, CI/CD configuration, Kubernetes deployment, GitOps implementation, monitoring, and rollback procedures.

---

# Prerequisites

Before starting the deployment, ensure the following are available:

* AWS Account
* AWS EC2 instance
* Terraform installed
* AWS CLI configured
* Docker installed
* Java 17 installed
* Jenkins installed and running
* kubectl installed and configured
* Docker Hub account
* GitHub repository
* ArgoCD installed
* Prometheus installed
* Grafana installed

---

# Deployment Process

## Step 1 – Launch EC2 Instance

An AWS EC2 instance was used as the development and deployment environment because of issues with the local Visual Studio Code setup.

Connect to the EC2 instance using SSH.

```bash
ssh -i <key.pem> ec2-user@<public-ip>
```

---

## Step 2 – Clone the Repository

Clone the GitHub repository to the EC2 instance.

```bash
git clone <repository-url>
cd <repository-folder>
```

---

## Step 3 – Provision AWS Infrastructure

Navigate to the Terraform directory.

```bash
cd terraform
```

Initialize Terraform.

```bash
terraform init
```

Review the execution plan.

```bash
terraform plan
```

Create the infrastructure.

```bash
terraform apply
```

Confirm the execution when prompted.

Terraform provisions the required AWS resources, including:

* VPC
* Subnets
* IAM Roles
* Security Groups
* Amazon EKS Cluster (if applicable)

Verify the infrastructure has been created successfully.

---

## Step 4 – Configure Kubernetes Access

Update the kubeconfig file so kubectl can communicate with the cluster.

```bash
aws eks update-kubeconfig --region <region> --name <cluster-name>
```

Verify the connection.

```bash
kubectl get nodes
```

The worker nodes should appear with a **Ready** status.

---

## Step 5 – Install Required Software

Install the required tools on the EC2 instance.

* Docker
* Jenkins
* Java 17
* SonarQube
* kubectl
* ArgoCD
* Prometheus
* Grafana

Verify that each service is running correctly before proceeding.

---

## Step 6 – Build the Application

Navigate to the application directory.

```bash
cd application
```

Build the Docker image.

```bash
docker build -t capstone-project:v1 .
```

Verify that the image was created.

```bash
docker images
```

---

## Step 7 – Test the Docker Container

Run the application locally.

```bash
docker run -d -p 5000:5000 capstone-project:v1
```

Open the application in a browser to verify that it is running correctly.

Stop and remove the test container once validation is complete.

---

## Step 8 – Push the Image to Docker Hub

Log in to Docker Hub.

```bash
docker login
```

Tag the Docker image.

```bash
docker tag capstone-project:v1 <dockerhub-username>/capstone-project:v1
```

Push the image.

```bash
docker push <dockerhub-username>/capstone-project:v1
```

Verify that the image is available in the Docker Hub repository.

---

## Step 9 – Configure Jenkins

Install the required Jenkins plugins.

Configure Jenkins credentials for:

* GitHub
* Docker Hub

Create a Jenkins Pipeline job and configure it to use the Jenkinsfile stored in the GitHub repository.

The pipeline performs the following stages:

* Checkout source code
* Build application
* Run tests
* Perform SonarQube analysis
* Build Docker image
* Push Docker image to Docker Hub

Run the pipeline and verify that all stages complete successfully.

---

## Step 10 – Deploy the Application to Kubernetes

Create the Kubernetes resources using the manifest files.

```bash
kubectl apply -f deployment.yaml
```

```bash
kubectl apply -f service.yaml
```

Verify that the Deployment has been created.

```bash
kubectl get deployments
```

Verify the Pods.

```bash
kubectl get pods
```

Verify the Service.

```bash
kubectl get svc
```

The Service of type **LoadBalancer** exposes the application externally.

---

## Step 11 – Configure ArgoCD

Install ArgoCD on the Kubernetes cluster.

Create an ArgoCD Application that points to the GitHub repository containing the Kubernetes manifests.

Enable automatic synchronization.

Whenever changes are pushed to the Git repository, ArgoCD detects the updates and synchronizes the cluster to match the desired state.

This implements the GitOps deployment model.

---

## Step 12 – Verify the Deployment

After deployment, verify that:

* All Pods are running.
* The Deployment is available.
* The Service has an external endpoint.
* The application is accessible from the browser.
* ArgoCD shows the application status as **Synced** and **Healthy**.

---

## Step 13 – Configure Monitoring

Install Prometheus and Grafana.

Configure Prometheus to collect metrics from the Kubernetes cluster.

Connect Grafana to Prometheus as the data source.

Import or create dashboards to monitor:

* Node health
* Pod status
* CPU utilization
* Memory utilization
* Application availability

Verify that metrics are being collected successfully.

---

# Validation Checklist

Confirm the following before considering the deployment successful:

* Terraform completed successfully.
* AWS resources were created.
* Kubernetes nodes are in the Ready state.
* Docker image is available in Docker Hub.
* Jenkins pipeline completed successfully.
* Kubernetes Deployment is available.
* Pods are running.
* Service is accessible externally.
* ArgoCD status is Synced and Healthy.
* Prometheus is collecting metrics.
* Grafana dashboards display cluster metrics.

---

# Rollback Procedure

If a deployment fails, first identify the cause using Jenkins logs, Kubernetes events, and ArgoCD status.

To roll back the Kubernetes Deployment:

```bash
kubectl rollout undo deployment <deployment-name>
```

If GitOps is being used, revert the application manifests in the GitHub repository to the previous stable version and push the changes. ArgoCD automatically detects the updated repository state and synchronizes the cluster, restoring the previous working version of the application.

---

# Troubleshooting

**Terraform Issues**

* Verify AWS credentials.
* Run `terraform validate`.
* Check the Terraform state.

**Docker Issues**

* Confirm Docker is running.
* Verify the Dockerfile.
* Review the Docker build logs.

**Jenkins Issues**

* Verify pipeline credentials.
* Check Jenkins console output.
* Confirm Docker permissions.

**Kubernetes Issues**

* Check Pod status using `kubectl get pods`.
* Review Pod logs using `kubectl logs <pod-name>`.
* Describe resources using `kubectl describe pod <pod-name>`.

**ArgoCD Issues**

* Confirm the repository is reachable.
* Verify synchronization status.
* Check the ArgoCD application logs.

---

# Conclusion

This deployment process provisions the infrastructure using Terraform, containerizes the application with Docker, automates build and validation through Jenkins, deploys the application to Kubernetes using GitOps with ArgoCD, and monitors the environment using Prometheus and Grafana. Following these steps provides a consistent, repeatable, and reliable deployment process that aligns with modern DevOps practices.
