## Question: EKS / Kubernetes Describe your EKS or Kubernetes work. Did you deploy workloads, troubleshoot pods, use Helm or manage ingress?

## Answer

Yes, I worked on a Kubernetes environment where I deployed and managed containerized applications using Kubernetes manifests.

I created and maintained Deployments, Services, and Ingess using YAML files to ensure applications were scalable and consistently configured across environments.

I exposed applications externally using different service types and Ingress, configuring routing rules to direct traffic to the services based on paths and host-based routing.

I also used Helm to package Kubernetes resources into reusable charts, which simplified deployments and allowed environment-specific configurations using values.yaml.

As part of troubleshooting, I handled common Kubernetes issues such as:

ImagePullBackOff by validating image names, registry access, and credentials<br>
CrashLoopBackOff by analyzing pod logs using kubectl logs and inspecting events using kubectl describe pod events<br>
Debugging service and networking issues using Kubernetes events and resource checks<br>

I regularly used kubectl commands for monitoring, debugging, and managing workloads.



