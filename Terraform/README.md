## Question: Show one Terraform example. How do you structure modules, backend state, variables and environments?


## Answer:<br>

Yes. In my previous project, we used Terraform to provision and manage AWS infrastructure. The infrastructure included a VPC, public and private subnets, an Internet Gateway, NAT Gateway, route tables, security groups, EC2 instances, an Application Load Balancer (ALB), and Auto Scaling Groups. We used Terraform, AWS, GitHub, and Jenkins to automate infrastructure deployments.<br>

My role was to write and maintain Terraform code, create reusable modules, configure the remote backend, review changes using terraform plan, and deploy the infrastructure through our Jenkins pipeline.<br>

To keep the code clean and reusable, we followed a modular approach. Instead of writing everything in one file, we created separate modules for different resources like VPC, EC2, ALB, and Security Groups. Whenever we needed these resources in another project or environment, we simply reused the same modules instead of writing the code again.<br>

Our project structure looked something like this:<br>

terraform/<br>
│
├── modules/<br>
│   ├── vpc/<br>
│   ├── ec2/<br>
│   ├── alb/<br>
│   └── security-group/<br>
│
├── environments/<br>
│   ├── dev/<br>
│   ├── qa/<br>
│   └── prod/<br>
│
├── backend.tf<br>
├── variables.tf<br>
└── providers.tf<br>

For the Terraform state file, we used an AWS S3 bucket as the remote backend so that the whole team could use the same state file. We also used DynamoDB for state locking, DynamoDB enables state locking whenever the remote backend is configured, it ensures only user or process can modify the changes at once.<br>

We used variables instead of hardcoding values. For example, the AWS region, VPC CIDR, instance type, and ami ID were stored in variables.tf. Each environment, like Dev, QA, and Production, had its own terraform.tfvars file with different values. This allowed us to use the same Terraform code for all environments.<br>

Along with this I worked on terraform workspaces where it mainatins seperate state file foe each enviornment so there wont be any conflicts between the enviornments.

The Terraform commands I used regularly :<br>

terraform init– Initializes the Terraform project.<br>
terraform plan – Kind of dry run, Shows what changes Terraform will make.<br>
terraform apply – Creates or updates the infrastructure.<br>
terraform destroy – Deletes the infrastructure when required.<br>


## Issues handled<br>

One issue I worked on was state drift. Sometimes someone changed a resource manually in the AWS Console. When I ran terraform plan, Terraform showed the differences. I checked the changes and either imported the resource into the Terraform state or updated the Terraform code so that everything matched again.<br>

I also faced a backend issue where Terraform couldn't access the state file in S3. I checked the IAM permissions, verified the S3 bucket and DynamoDB table, and then reinitialized Terraform. After that, the deployment worked successfully.<br>

## Outcome<br>

Using Terraform helped us automate infrastructure creation, reduce manual work, and keep the infrastructure consistent across Development, QA, and Production environments. Reusable modules also made the code easier to maintain and saved time during new deployments.<br>
