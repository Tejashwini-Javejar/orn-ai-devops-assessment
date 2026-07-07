# AWS GitOps Platform Capstone-project overview

In this project, I built and deployed a complete Devops platform on AWS to automate the process of building, deploying, and monitoring an application.

I started by creating the required AWS infrastructure using Terraform. This helped me automate the setup of cloud resources and create the infrastructure. I used Docker to containerize the application and pushed the Docker images to Docker Hub.

I created a Jenkins CI/CD pipeline to automate the application delivery process. The pipeline performs tasks like downloading the code from GitHub, building the application, running static code analysis using SonarQube, creating Docker images, and pushing them to Docker Hub.

The application was then deployed on Kubernetes running in AWS. I used ArgoCD to implement Gitops, where any changes made in the GitHub repository are automatically detected and applied to the Kubernetes cluster. This helped maintain the application in the desired state without manual work.

For monitoring, I installed Prometheus and Grafana using Helm charts. These tools helped me monitor Kubernetes resources, application availability, CPU usage, memory usage, and overall system health.

Through this project, I gained practical experience with AWS, Terraform, Docker, Jenkins, Kubernetes, ArgoCD, Helm, Prometheus, and Grafana. I am also continuing to improve my knowledge of Helm by learning advanced concepts like creating custom charts, managing Helm releases, and using Helm with Gitops workflows.
