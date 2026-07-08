## Question: EKS / Kubernetes Describe your EKS or Kubernetes work. Did you deploy workloads, troubleshoot pods, use Helm or manage ingress?

## Answer

## Kubernetes Resources Used

I created and managed the following Kubernetes resources:

## Deployment

Deploy containerized applications.
Manage pod replicas.
Ensure application availability.

## Service

Kubernernet service provide stable network identity for accessing a group of pods. It uses selector to identify to which pod the traffic should be routed evn if thier IP address changes. It automaticllay balances the load among the pods. It uses different service types to expose application internally and externally.

## ConfigMap and Secrets

ConfigMap- stores non-sensitive configuration data in a plane text.
Secrets- Stores sensitive info such as token keys, passwords, API keys. and also kubernet supports encryption at rest, because secrets are base-64 encoded. Data can be encrypted at rest before getting saved in etcd.

## Ingress

Ingess is a kubernet API object it defines rules for routing external traffic to the internal services. It acts as a traffic router-deciding which service should handle which request based on the URL, Hostname and domain name.
It uses ingress controller --It does the actual implemenattaion. It listens to the ingress rules and manage the routing

## Deployment Process

I deployed Docker container images into Kubernetes using Deployment manifests.<br>
The Kubernetes Deployment manages the application pods and ensures the required number of replicas are running.<br>
I used Services and Ingress to expose the application and configure traffic routing.<br>

## Kubernetes Troubleshooting Experience
1. Pod Memory Leak Issue in Shared Kubernetes Cluster<br>

When I joined the organization, the Kubernetes cluster was shared between multiple development teams.One of the application pods started consuming excessive memory, which affected the overall cluster resource availability.<br>

--Issue<br>

A pod from one application was continuously increasing memory usage and consuming more cluster resources than expected.Since multiple teams were using the same cluster, uncontrolled resource usage from one application could impact other workloads.<br>

--Investigation<br>

I analyzed the resource usage using Kubernetes commands:<br>
kubectl top pods<br>
This helped identify pods consuming higher memory.<br>
I also checked pod details and events:<br>
kubectl describe pod <pod-name><br>
and reviewed application logs:<br>
kubectl logs <pod-name><br>

Through monitoring and resource analysis, we identified the pod causing excessive memory consumption.<br>

--Solution<br>
To prevent similar issues in the shared cluster, I implemented Kubernetes resource management:<br>
Resource Requests and Limits<br>
I configured resource limits on pods:<br>
resources:<br>
  requests:<br>
    memory: "256Mi"<br>
    cpu: "250m"<br>
  limits:<br>
    memory: "512Mi"<br>
    cpu: "500m"<br>

This ensured:<br>
Each pod received reuired minimum resources.<br>
Pods could not consume unlimited cluster resources.<br>
Kubernetes could properly schedule workloads.<br>

Namespace Resource Quota<br>
I also applied resource quotas at the namespace level.Resource quotas helped control the total amount of CPU and memory that each development team's namespace could consume.<br>

--Outcome<br>

After implementing resource limits and namespace quotas:<br>

We were able to identify the pod causing memory leakage.<br>
Resource consumption became controlled.<br>
The impact on other development teams was reduced.<br>
The Kubernetes cluster became more stable and predictable.<br>

## Other Kubernetes Issues Handled<br>
## ImagePullBackOff<br>
Issue:<br>
Pods failed to start because Kubernetes could not pull the container image.<br>

--Troubleshooting:<br>
Checked:<br>
kubectl describe pod <pod-name><br>
Validated:<br>
Image name and tag.<br>
Container registry availability.<br>
Image pull credentials.<br>

--Resolution:<br>

Corrected the image configuration and ensured Kubernetes had proper access to the container registry.<br>

## CrashLoopBackOff<br>
Issue:<br>

Application pods continuously restarted after deployment.<br>
--Troubleshooting:<br>
Checked application logs:<br>
kubectl logs <pod-name><br>
Reviewed pod events:<br>
kubectl describe pod <pod-name><br>

Checked:<br>

Serive is configured correctly<br>
Liveliness probes are correct configured<br>
Checked enviornment variables<br>

Resolution:<br>
Fixed application configuration issues and redeployed the workload.<br>

## Service and Networking Issues<br>
Issue:
Application pods were running, but the application was not accessible.<br>

Troubleshooting:<br>
Checked:<br>

kubectl get svc<br>
kubectl get endpoints<br>
kubectl get pods<br>

Verified:<br>

Service selectors.<br>
Pod labels.<br>
Target ports.<br>

Resolution:<br>
Corrected service configuration and restored application connectivity.<br>

## GitOps Deployment Using Argo CD<br>

I used Argo CD to manage Kubernetes deployments using the GitOps approach.The Kubernetes manifests were stored in GitHub, which acted as the single source of truth. ArgoCD continuously re-consiled the actual state and the desired state stored in github.<br>

## Helm Learning<br>

I am currently improving my Helm knowledge and learning advanced concepts such as:<br>

Helm charts<br>
Templates<br>
values.yaml configuration<br>
Environment-specific deployments<br>
Outcome

## Through my Kubernetes experience, I gained practical knowledge in:<br>

Deploying and managing workloads.<br>
Troubleshooting real Kubernetes issues.<br>
Managing resources in shared clusters.<br>
Improving cluster stability using resource limits and quotas.<br>
Implementing Gitops deployments using Argo CD.<br>

