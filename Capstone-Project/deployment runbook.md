# Deployment Runbook – AWS GitOps Platform Capstone

This runbook documents the deployment activities completed for the AWS GitOps Platform Capstone project. The implementation included AWS infrastructure provisioning, application containerization, CI/CD pipeline configuration, Kubernetes deployment, GitOps integration using ArgoCD, monitoring setup, and rollback validation.

# Prerequisites Completed

Before starting the deployment, I prepared the required environment and installed the necessary tools:

* AWS Account configured
* AWS EC2 instance created and used as the deployment environment
* Terraform installed and configured
* AWS CLI installed and authenticated
* Docker installed and configured
* Java 17 installed
* Jenkins installed and running
* SonarQube installed and configured
* kubectl installed and connected with Kubernetes cluster
* Docker Hub account configured
* GitHub repository created and connected
* ArgoCD installed
* Prometheus installed
* Grafana installed

# Deployment Activities Completed

## Step 1 – AWS EC2 Environment Setup

I used an AWS EC2 instance as the development and deployment environment.

I connected to the EC2 instance using SSH:

ssh -i <key.pem> ubuntu@<public-ip>

The EC2 environment was successfully prepared for the deployment activities.

## Step 2 – Repository Setup

I cloned the project repository from GitHub into the EC2 instance.

git clone <repository-url> <br>
cd <repository-folder> <br>
The source code and deployment files were successfully downloaded and verified.<br>


## Step 3 – AWS Infrastructure Provisioning Using Terraform<br>

I navigated to the Terraform configuration directory:<br>

cd terraform<br>

Initialized Terraform:<br>

terraform init<br>

Validated the Terraform configuration and reviewed the deployment plan:<br>

terraform plan<br>

Provisioned the AWS infrastructure:<br>

terraform apply<br>

Terraform successfully created the required AWS resources:<br>

* VPC<br>
* Private and Public subnets
* Internet Gateway, Route tables and NAT gateway<br>
* IAM Roles
* Security Groups
* Amazon EKS Cluster

The infrastructure deployment was completed successfully.<br>

## Step 4 – Kubernetes Cluster Configuration

I configured Kubernetes access by updating the kubeconfig file:<br>

aws eks update-kubeconfig --region <region> --name <cluster-name><br>

Verified the Kubernetes worker nodes:<br>

kubectl get nodes

All available nodes were successfully displayed with Ready status.<br>


## Step 5 – Required Tools Installation and Verification<br>

I installed and configured the required Devops tools on the EC2 environment:<br>

* Docker
* Jenkins
* Java 17
* SonarQube
* kubectl
* ArgoCD
* Prometheus
* Grafana

Each service was checked to confirm that it was running correctly before continuing with the deployment process.<br>

## Step 6 – Application Containerization<br>

I moved into the application directory:<br>

cd application

Built the Docker image:
docker build -t capstone-project:v1 .<br>

Verified that the Docker image was created successfully:<br>
docker images

The application was successfully containerized.<br>

## Step 7 – Docker Container Testing

I tested the application locally by running the Docker container:<br>

docker run -d -p 5000:5000 capstone-project:v1

The application was accessed through the browser and verified to be running successfully.<br>

After validation, the test container was stopped and removed.<br>

## Step 8 – Docker Hub Image Deployment

I authenticated with Docker Hub:
docker login
Tagged the Docker image:

docker tag capstone-project:v1 <dockerhub-username>/capstone-project:v1<br>

Pushed the image to Docker Hub:

docker push teju96/capstone-project:v1<br>

The Docker image was successfully uploaded and made available for Kubernetes deployment.<br>


## Step 9 – Jenkins CI/CD Pipeline Configuration

I configured Jenkins with the required plugins and credentials.<br>

Configured credentials for:

* GitHub repository access
* Docker Hub authentication
* Sonarqube

Created and executed the Jenkins Pipeline using the Jenkinsfile stored in the GitHub repository.<br>

The pipeline successfully completed the following stages:

* Source code checkout
* Application build
* Test execution
* SonarQube code quality analysis
* Docker image build
* Docker Hub image push

The CI pipeline execution completed successfully.

## Step 10 – Kubernetes Application Deployment

I deployed the application into the Kubernetes cluster using the manifest files.<br>

Created the Deployment:<br>
kubectl apply -f deployment.yaml<br>

Created the Service:<br>
kubectl apply -f service.yaml<br>

Verified the Kubernetes resources:
kubectl get deployments<br>
kubectl get pods<br>
kubectl get svc<br>

The application pods were running successfully, and the Loadbalancer service was created for external access.<br>

## Step 11 – GitOps Implementation Using ArgoCD

I installed and configured ArgoCD on the Kubernetes cluster.

Created an ArgoCD Application connected to the GitHub repository containing the Kubernetes manifests.<br>

Enabled automatic synchronization.

The GitOps workflow was successfully implemented:<br>

1. Changes were committed to GitHub.
2. ArgoCD detected repository changes.
3. ArgoCD synchronized the Kubernetes cluster.
4. The deployed application matched the desired Git state.<br>

The ArgoCD application status was verified as:
Synced and Healthy

## Step 12 – Deployment Verification<br>

After completing the deployment, I verified:

* Kubernetes nodes were running successfully.
* Application pods were in Running state.
* Deployment was available.
* Service exposed the application externally.
* Application was accessible through the browser.
* ArgoCD synchronization was successful.


## Step 13 – Monitoring Setup

I installed and configured Prometheus and Grafana for monitoring using Helm.<br>

Prometheus was configured to collect Kubernetes metrics.

Grafana was connected with Prometheus as the monitoring data source.<br>

Dashboards were configured to monitor:

* Node health
* Pod availability
* CPU utilization
* Memory utilization
* Application availability

Metrics collection was verified successfully.

# Final Validation Checklist

The deployment was completed successfully after confirming:<br>

✅ Terraform provisioning completed successfully
✅ AWS resources created successfully
✅ Kubernetes nodes displayed Ready status
✅ Docker image pushed successfully to Docker Hub
✅ Jenkins pipeline completed successfully
✅ SonarQube analysis completed
✅ Kubernetes Deployment created successfully
✅ Application Pods running successfully
✅ Service accessible externally
✅ ArgoCD application status showed Synced and Healthy
✅ Prometheus metrics collected successfully
✅ Grafana dashboards displayed monitoring data

# Rollback Procedure Tested

In case of deployment failure, I verified the rollback approach.<br>

The Kubernetes deployment can be rolled back using:<br>

kubectl rollout undo deployment <deployment-name><br>

For GitOps-based rollback, the previous stable Kubernetes manifest version can be restored in the GitHub repository. After pushing the changes, ArgoCD automatically detects the repository update and synchronizes the Kubernetes environment back to the stable version.<br>


# Troubleshooting Performed

## Terraform Issues

Checked:

* AWS credentials configuration
* Terraform validation
* Terraform state information

Command used:
terraform validate

## Docker Issues

Checked:

* Docker service status
* Image build logs

## Jenkins Issues

Checked:

* Pipeline credentials
* Jenkins console logs
* Docker permissions

## Kubernetes Issues

Checked:
kubectl get pods

Reviewed logs:
kubectl logs <pod-name>

Inspected resources:
kubectl describe pod <pod-name>

## ArgoCD Issues

Verified:

* Repository connectivity
* Application synchronization status
* Application health status
* Deployment logs

# Conclusion

The AWS GitOps Platform Capstone deployment was successfully completed. The environment was provisioned using Terraform, the application was containerized using Docker, CI/CD automation was implemented using Jenkins, application deployment was managed through Kubernetes and ArgoCD using GitOps principles, and monitoring was enabled using Prometheus and Grafana.

