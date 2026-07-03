## Question:How do you secure AWS credentials, Kubernetes secrets and CI/CD access?

## Answer:

In my project, we secured AWS credentials, Kubernetes secrets, and CI/CD access using multiple security tools.

For AWS credentials, we used IAM roles instead of hardcoding access keys. For storing sensitive information such as database passwords, API keys, and application secrets, we used AWS Secrets Manager. It allows us to securely stores secrets, supports automatic password rotation, and controls access through IAM policies.

For Kubernetes, we used Kubernetes Secrets to store sensitive data such as application credentials and database passwords instead of keeping them in ConfigMaps or kubernetes manifest files. We also enforced RBAC (Role-Based Access Control) so that only authorized users and service accounts could access the secrets. In production, Kubernetes Secrets can also be encrypted at rest in etcd by enabling encryption at the cluster level. Although Secrets are stored as Base64-encoded values in YAML files, Base64 is only an encoding mechanism and not encryption.

For CI/CD access, we followed the principle of least privilege. Jenkins had a dedicated service account with only the required permissions. Credentials were stored securely in the Jenkins Credentials Store rather than in pipeline code.

One issue we encountered was that an team initially kept a database password inside a Kubernetes deployment YAML file. During a code review, we identified the issue and replaced the hardcoded password with a Kubernetes Secret.So it has reduced the risk of exposing credentials.

