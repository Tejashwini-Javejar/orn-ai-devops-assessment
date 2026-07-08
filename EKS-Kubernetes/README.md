## Question: EKS / Kubernetes Describe your EKS or Kubernetes work. Did you deploy workloads, troubleshoot pods, use Helm or manage ingress?

## Answer

## Kubernetes Resources Used
I have hands-on experience deploying and managing containerized applications on Kubernetes. I created and maintained Deployments, Services, ConfigMaps, Secrets, and Ingress resources to deploy applications and expose them internally and externally.

I deployed workloads using Kubernetes manifests and used Argo CD to implement Gitops-based deployments, where Kubernetes manifests were stored in GitHub and automatically synchronized with the cluster

I created and managed the following Kubernetes resources:

## Deployment

Deploy containerized applications.
Manage pod replicas.
Ensure application availability.

## Service

Kubernernet service provide stable network identity for accessing a group of pods. It uses selector to identify to which pod the traffic should be routed evn if thier IP address changes. It automaticllay balances the load among the pods. It uses different service types to expose application internally and externally.

## ConfigMap and Secrets

ConfigMap- stores non-sensitive configuration data in a plane text.<br>
Secrets- Stores sensitive info such as token keys, passwords, API keys. and also kubernet supports encryption at rest, because secrets are base-64 encoded. Data can be encrypted at rest before getting saved in etcd.

## Ingress<br>

Ingess is a kubernet API object it defines rules for routing external traffic to the internal services. It acts as a traffic router-deciding which service should handle which request based on the URL, Hostname and domain name.<br>
It uses ingress controller --It does the actual implemenattaion. It listens to the ingress rules and manage the routing<br>

## Deployment Process<br>

I deployed Docker container images into Kubernetes using Deployment manifests.<br>
The Kubernetes Deployment manages the application pods and ensures the required number of replicas are running.<br>
I used Services and Ingress to expose the application and configure traffic routing.<br>

# Kubernetes Troubleshooting Experience<br>

## Pod Memory Leak Issue in a Shared Kubernetes Cluster<br>

When I joined the organization, we had a Kubernetes cluster that was shared by multiple development teams. One day, an application pod started using a very high amount of memory, which affected the available resources in the cluster.<br>

Because multiple teams were using the same cluster, one application's excessive resource usage could impact other applications. I needed to identify the issue and make sure it would not happen again.<br>

## Issue<br>

One application pod was continuously increasing its memory usage. Over time, it started consuming more resources than expected and created pressure on the Kubernetes cluster.<br>

This could have affected other teams applications by reducing the available CPU and memory resources.<br>

## Investigation<br>

I started troubleshooting by checking the resource usage of all running pods using:<br>

kubectl top pods<br>

This helped me identify which pods were using more memory and CPU.<br>

After identifying the pod, I checked pod events details using:<br>

kubectl describe pod <pod-name><br>

This helped me understand the pod status, events, and resource-related issues.<br>

I also checked the application logs using:<br>

kubectl logs <pod-name><br>

By analyzing the resource usage, pod details, and application logs, I was able to identify the pod that was causing high memory leakage.<br>

## Solution

To prevent this issue in the future, we implemented Kubernetes resource management.<br>

### Resource Requests and Limits<br>

I added CPU and memory requests and limits to the application pods.<br>

Example:<br>

resources:<br>
  requests:<br>
    memory: "256Mi"<br>
    cpu: "250m"<br>
  limits:<br>
    memory: "512Mi"<br>
    cpu: "500m"<br>

This helped because:<br>

* The pod received the minimum resources it needed to run.<br>
* The pod could not consume more memory or CPU.<br>
* Other applications in the cluster were protected from resource issues.<br>

### Namespace Resource Quota

Since multiple teams were using the same Kubernetes cluster, we also applied resource quotas at the namespace level. Namespace quotas controlled how much CPU and memory each teams applications could use and also implemeneted resource limit on the podos.<br>
This prevented one team from consuming too many cluster resources and affecting other teams.<br>

## Outcome<br>

After implementing resource limits and quotas:<br>

* We identified and controlled the application causing high memory usage.<br>
* Cluster resource usage became more stable.<br>
* Other teams applications were not impacted.<br>
* The Kubernetes environment became more reliable and predictable.<br>
* 
# Other Kubernetes Issues Handled<br>

## ImagePullBackOff Issue<br>

### Problem<br>

Some pods failed to start because Kubernetes was unable to download the required container image.<br>

### Troubleshooting<br>

I checked the pod details using:<br>

kubectl describe pod <pod-name><br>

I verified:<br>

* The image name was correct.<br>
* The image tag was correct.<br>
* The container registry was available.<br>
* Kubernetes had the correct credentials to access the image.<br>

### Solution<br>

I corrected the image configuration and updated the required registry access details.<br>
After the changes, Kubernetes was able to pull the image successfully and start the application.<br>

# CrashLoopBackOff Issue<br>

## Problem<br>

After deployment, some application pods continuously restarted and entered the CrashLoopBackOff state.<br>

## Troubleshooting<br>

I checked the application logs:<br>
kubectl logs <pod-name><br>

I also checked pod events:
kubectl describe pod <pod-name>

I verified:<br>

* Application configuration.<br>
* Environment variables.<br>
* Kubernetes service configuration.<br>
* Liveness and readiness probes.<br>
* Valid CMD arguments<br>

## Solution<br>

I fixed the application configuration issues, updated the Kubernetes deployment files, and redeployed the application.After the changes, the pods started successfully and remained stable.<br>

# Kubernetes Service and Networking Issue<br>

## Problem<br>

The application pods were running, but users were unable to access the application.

## Troubleshooting<br>

I checked:

kubectl get svc<br>
kubectl get endpoints<br>
kubectl get pods<br
                  
I verified:

* Service configuration.<br>
* Pod labels.<br>
* Service selectors.<br>
* Application ports.<br>

## Solution<br>

I corrected the service configuration and updated the required labels and selectors.<br>

After the changes, the service was able to connect with the application pods and the application became accessible.<br>

# GitOps Deployment Using Argo CD<br>

I used Argo CD to manage Kubernetes deployments using the GitOps approach.In our setup, Kubernetes manifest files were stored in GitHub. GitHub acted as the single source of truth for all deployments.Argo CD continuously checked the Kubernetes cluster and compared the current running state with the desired state stored in GitHub.If there was any difference, Argo CD automatically synchronized the changes.<br>

Using Argo CD helped us achieve:<br>

* Consistent deployments.<br>
* Better tracking of changes.<br>
* Easier rollback.<br>
* Reduced manual deployment work.<br>
  
# Helm Learning Experience

I am currently improving my Helm knowledge and learning more advanced concepts such as:<br>

* Helm charts.<br>
* Templates.<br>
* values.yaml configuration<br>
* Environment-specific deployments.<br><br>

I am learning how Helm helps create reusable Kubernetes deployment templates and makes application deployments easier across different environments.


# Overall Kubernetes Experience

Through my Kubernetes experience, I gained practical knowledge in:<br>

* Deploying and managing applications on Kubernetes.<br>
* Troubleshooting real Kubernetes issues.<br>
* Managing resources in shared Kubernetes clusters.<br>
* Improving cluster stability using resource limits and quotas.<br>
* Implementing GitOps deployments using Argo CD.<br>
  

These experiences helped me understand how to maintain stable, reliable, and scalable Kubernetes environments.<br>
