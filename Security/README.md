## Question:How do you secure AWS credentials, Kubernetes secrets and CI/CD access?

## Answer:

In my previous project, we secured AWS credentials, Kubernetes secrets, and CI/CD access by following security best practices.

For AWS credentials, we avoided storing access keys in code. We used IAM roles and policies to provide only the required permissions. For sensitive information like database passwords and API keys, we used AWS Secrets Manager, which provides secure storage, access control, and secret rotation.

For Kubernetes, we used Kubernetes Secrets to store sensitive information instead of keeping passwords in ConfigMaps or YAML files. We also implemented RBAC to control who can access secrets. In production environments, secrets can also be encrypted at rest in etcd for additional security.

For CI/CD security, we followed the principle of least privilege. Jenkins used dedicated service accounts with limited permissions, and credentials were stored in Jenkins Credentials Manager instead of being written directly in pipeline scripts.

## Issue handled
once during a code review, we found that a database password was hardcoded in a Kubernetes deployment YAML file. We removed the hardcoded value and replaced it with a Kubernetes Secret, which reduced the risk of credential exposure.

## Outcome
These practices helped us protect sensitive information and reduce security risks.


