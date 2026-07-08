## Question: Show one Terraform example. How do you structure modules, backend state, variables and environments?


## Answer:

Yes, In my previous projects, I used Terraform to provision the resourcses using Hashicorp language. The infrastructure included a VPC, public and private subnets, an Internet Gateway, NAT Gateway, route tables, security groups, EC2 instances and an Application Load Balancer (ALB). Using Terraform allowed us to automate the infrastructure deployment and easier to manage.

In my previous project, I used a modular approach, where Terraform allows us to break down the infrastructure into small, self-contained components. We can create reusable templates instead of rewriting the same code every time. This makes the code easier to maintain, improves reusability and also reduces the time required to provision resources.

I have worked with the fallowing Terraform commands<br>

terraform init - It will initialize the terraform configuration and download the required providers<br>
terraform plan - It is a kind of dry run , where it shows what infrastructure it is going to create<br>
terraform apply- It is used to create the resources<br>
terraform destroy - It will destroy the resources as per the requirement<br>

I have also worked with the Terraform state file, which is the heart of Terraform. The state file contains all the details of the infrastructure that Terraform has created and keeps track of the resources. It helps Terraform identify the difference between the actual state and the desired state of the infrastructure, so that only the required changes are applied.

Storing the state file is an important aspect of Terraform. In my project, we used an AWS S3 bucket as a remote backend to store the Terraform state file securely. This provides a centralized location for the state file and prevents unauthorized modifications.I also used DynamoDB state locking, which ensures that only one user or process can modify the infrastructure state at a time, preventing concurrent updates and state file corruption.

I also worked with Terraform variables, which allow us to avoid hardcoding values such as the AWS region, VPC CIDR block, instance type and other configuration values. We can create input and output variables this makes the code reusable and allows the same Terraform configuration to be used across different environments.

Additionally, I worked with Terraform workspaces to maintain separate state files for different environments such as development, testing and production. This helps manage multiple environments while using the same Terraform configuration.

I have also worked with Terraform provisioners to execute commands or scripts on remote machines by establishing SSH connections after the infrastructure is provisioned, whenever additional configuration was required.
