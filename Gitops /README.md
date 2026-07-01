## Question:What is GitOps? Have you used ArgoCD or FluxCD? If not, explain how you would learn and apply it.

## Answer:

Yes, I have worked with GitOps tools such as Argo CD. GitOps is an approach where it uses git as a single source of truth for both application deployments and infrastructure configurations. Any changes made in the Git repository are automatically reflected in the Kubernetes cluster through automation tools like Argo CD.

As i have explained in the CI/CD section, I used Argo CD as part of the deployment process in the CI/CD pipeline. We stored Kubernetes manifests in a GitHub repository, and Argo CD continuously monitored this repository.

We also used Argo CD Image Updater, which automatically monitors the container registry and when a new Docker image is pushed to the container registry. It updates the image tag in the Kubernetes manifests stored in GitHub, ensuring that the latest version of the application is deployed.

Argo CD continuously performs reconciliation between the desired state in GitHub and the actual state in the Kubernetes cluster. If it detects any differences, it automatically syncs and deploys the changes to bring the cluster back to the desired state, especially when auto-sync is enabled.

In some cases, I have faced OutOfSync issue, which happened when manual changes were made directly inside the Kubernetes cluster. Since auto-sync was enabled, Argo CD automatically reverted those changes and restored the desired state from Git.

I am currently learning advanced concepts like multi-cluster management, sync waves, hooks, and progressive delivery patterns.
