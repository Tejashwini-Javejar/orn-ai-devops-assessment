Commands used as part of the application deployments.

## Cluster & basic information
kubectl version - checks the vesrion of our kubernet cluster<br>
kubectl cluster-info - We can see cluster details like API server info<br>
kubectl get nodes -We can check all nodes status in the cluster<br>
kubectl describe node- We can see detailed info about a node like CPU, memory, and running pods<br>

## Deployments & workloads
kubectl get deployments - We can see all running deployments<br>
kubectl describe deployment - We can check details of a deployment<br>
kubectl apply -f deployment.yaml- We can create or update deployment using YAML file<br>
kubectl delete -f deployment.yaml - We can delete deployment using YAML file<br>
kubectl rollout status deployment - We can check if deployment update is successful<br>
kubectl rollout history deployment - We can see previous versions of deployment<br>
kubectl rollout undo deployment/name -We can rollback to previous version if something breaks<br>

## Pods 
kubectl get pods- We can check all pods and their status<br>
kubectl get pods -o wide - We can see extra details like node name and IP<br>
kubectl describe pod <pod-name>- We can check detailed information about a pod<br>
kubectl logs <pod-name>- We can see logs details<br>
kubectl logs -f <pod-name>- We can see live logs of a running pod<br>
kubectl exec -it <pod-name> -- /bin/bash- We can enter inside a running container<br>
kubectl delete pod <pod-name>- We can delete a pod<br>

## Services
kubectl get services - We can see all services in the cluster<br>
kubectl describe service <name> -We can check service details<br>
kubectl apply -f service.yaml- We can create or update service using YAML<br>

## Ingress 
kubectl get ingress- We can check all ingress details<br>
kubectl describe ingress <name>-We can see how traffic is routed<br>
kubectl apply -f ingress.yaml-We can create or update ingress rules<br>


## Debugging & troubleshooting
kubectl get events- We can see what is happening in the cluster<br>
kubectl logs <pod-name>- We can check logs to find issues<br>
kubectl logs <pod-name> --previous- We can check logs of a crashed pod<br>

## Scaling & updates
kubectl scale deployment <name> --replicas=3 - We can increase or decrease number of pods<br>

## Namespace commands
kubectl get namespaces- We can see all namespaces<br>
kubectl create namespace <name>- We can create a new namespace<br>
kubectl get pods -n <namespace>- We can see pods in a specific namespace<br>

## Helm commands 
helm version - We can check Helm version<br>
helm create <chart-name>- We can create a Helm chart structure<br>
helm install <name> ./chart - We can deploy application using Helm<br>
helm upgrade <name> ./chart- We can update application using Helm<br>
helm list- We can see all Helm deployments<br>
helm status <name>- We can check deployment status<br>

 
