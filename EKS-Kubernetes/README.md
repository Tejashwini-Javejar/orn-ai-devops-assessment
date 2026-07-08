## Question: EKS / Kubernetes Describe your EKS or Kubernetes work. Did you deploy workloads, troubleshoot pods, use Helm or manage ingress?

## Answer

## Kubernetes Resources Used

I created and managed the following Kubernetes resources:

## Deployment
Used Deployment resources to:

Deploy containerized applications.
Manage pod replicas.
Ensure application availability.

## Service
Used Kubernetes Services to:

Provide stable network access to applications.
Expose applications inside and outside the cluster.

## ConfigMap and Secrets
Used ConfigMaps and Secrets to:

Manage application configuration.
Store sensitive information securely.

## Ingress
Used Ingress for:

External application access.
Routing traffic to services based on rules.
Used ingrss controller to manage routing

## Deployment Process

I deployed Docker container images into Kubernetes using Deployment manifests.<br>
The Kubernetes Deployment manages the application pods and ensures the required number of replicas are running.<br>
I used Services and Ingress to expose the application and configure traffic routing.<br>

## Kubernetes Troubleshooting Experience
1. Pod Memory Leak Issue in Shared Kubernetes Cluster

When I joined the organization, the Kubernetes cluster was shared between multiple development teams.One of the application pods started consuming excessive memory, which affected the overall cluster resource availability.

--Issue

A pod from one application was continuously increasing memory usage and consuming more cluster resources than expected.Since multiple teams were using the same cluster, uncontrolled resource usage from one application could impact other workloads.

--Investigation

I analyzed the resource usage using Kubernetes commands:
kubectl top pods
This helped identify pods consuming higher memory.
I also checked pod details and events:
kubectl describe pod <pod-name>
and reviewed application logs:
kubectl logs <pod-name>

Through monitoring and resource analysis, we identified the pod causing excessive memory consumption.

--Solution
To prevent similar issues in the shared cluster, I implemented Kubernetes resource management:
Resource Requests and Limits
I configured resource limits on pods:
resources:
  requests:
    memory: "256Mi"
    cpu: "250m"
  limits:
    memory: "512Mi"
    cpu: "500m"

This ensured:
Each pod received reuired minimum resources.
Pods could not consume unlimited cluster resources.
Kubernetes could properly schedule workloads.

Namespace Resource Quota
I also applied resource quotas at the namespace level.Resource quotas helped control the total amount of CPU and memory that each development team's namespace could consume.

--Outcome

After implementing resource limits and namespace quotas:

We were able to identify the pod causing memory leakage.
Resource consumption became controlled.
The impact on other development teams was reduced.
The Kubernetes cluster became more stable and predictable.

## Other Kubernetes Issues Handled
## ImagePullBackOff
Issue:
Pods failed to start because Kubernetes could not pull the container image.

--Troubleshooting:
Checked:
kubectl describe pod <pod-name>
Validated:
Image name and tag.
Container registry availability.
Image pull credentials.

--Resolution:

Corrected the image configuration and ensured Kubernetes had proper access to the container registry.

## CrashLoopBackOff
Issue:

Application pods continuously restarted after deployment.
--Troubleshooting:
Checked application logs:
kubectl logs <pod-name>
Reviewed pod events:
kubectl describe pod <pod-name>

Checked:

Serive is configured correctly
Liveliness probes are correct configured
Checked enviornment variables

Resolution:
Fixed application configuration issues and redeployed the workload.

## Service and Networking Issues
Issue:
Application pods were running, but the application was not accessible.

Troubleshooting:
Checked:

kubectl get svc
kubectl get endpoints
kubectl get pods

Verified:

Service selectors.
Pod labels.
Target ports.

Resolution:
Corrected service configuration and restored application connectivity.

## GitOps Deployment Using Argo CD

I used Argo CD to manage Kubernetes deployments using the GitOps approach.The Kubernetes manifests were stored in GitHub, which acted as the single source of truth. ArgoCD continuously re-consiled the actual state and the desired state stored in github.

## Helm Learning

I am currently improving my Helm knowledge and learning advanced concepts such as:

Helm charts
Templates
values.yaml configuration
Environment-specific deployments
Outcome

## Through my Kubernetes experience, I gained practical knowledge in:

Deploying and managing workloads.
Troubleshooting real Kubernetes issues.
Managing resources in shared clusters.
Improving cluster stability using resource limits and quotas.
Implementing Gitops deployments using Argo CD.

