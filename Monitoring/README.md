## Question: How do you combine CloudWatch with Prometheus/Grafana for production monitoring?

## Answer:

I haven't had the opportunity to combine CloudWatch with Prometheus and Grafana in my previous project.

In my project, we used Amazon CloudWatch to monitor AWS resources such as EC2, EBS, ALB, and CloudWatch Logs. We created  custom alarms to notify the team when resource utilization crossed thresholds.

For Kubernetes, we used Prometheus to collect metrics from nodes, pods, and containers, and Grafana to visualize and analyse those metrics through dashboards.

From my understanding, in a production environment these tools can be combined by using CloudWatch for AWS infrastructure monitoring and Prometheus/Grafana for Kubernetes and application-level monitoring. This provides a complete view of both AWS resources and the workloads running on Kubernetes. Although I understand the architecture, I have not implemented this integration myself.

## Outcome
These monitoring tools helps to detect issues faster and improve troubleshooting.
