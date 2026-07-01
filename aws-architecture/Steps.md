## Create a VPC

First, I created a Virtual Private Cloud (VPC) in AWS.<br>
Selected AWS Region us-east1<br>
Created a VPC with CIDR block: 10.0.0.0/16<br>

## Create Subnets (Public and Private across AZs)

Next, I divided the VPC into subnets for high availability.<br>
Public Subnets<br>
public-subnet-1 → AZ-a → 10.0.1.0/24<br>
public-subnet-2 → AZ-b → 10.0.2.0/24<br>
Private Subnets<br>
private-subnet-1 → AZ-a → 10.0.11.0/24<br>
private-subnet-2 → AZ-b → 10.0.12.0/24<br>

## Attach Internet Gateway (IGW)

Then I created and attached an Internet Gateway to the VPC.<br>
Created IGW<br>
Attached it to my VPC<br>

## Configure Public Route Table<br>

I created a route table for public subnets.<br>
Route table: public-rt<br>
Added route:<br>
0.0.0.0/0 → Internet Gateway<br>
Associated it with both public subnets<br>

## Create NAT Gateway

To allow private subnet instances to access the internet securely:<br>
Created NAT Gateway in a public subnet<br>
Allocated an Elastic IP<br>

## Configure Private Route Table

Then I created a route table for private subnets.<br>
Route table: private-rt<br>
Added route:<br>
0.0.0.0/0 → NAT Gateway<br>
Associated with private subnets<br>

## Launch EC2 Instances in Private Subnets<br>

I launched EC2 instances inside private subnets.<br>
Selected private subnet<br>
Disabled public IP<br>
Installed application on instances<br>

## Set up Application Load Balancer (ALB)<br>

Next, I created an Application Load Balancer.<br>
Type: Internet-facing ALB<br>
Placed in public subnets (multi-AZ)<br>
Created a Target Group and security groups<br>
selected private EC2 instances<br>

## Configure Security Groups
ALB Security Group:<br>
Allow HTTP (80) / HTTPS (443) from anywhere<br>
EC2 Security Group:<br>
Allow traffic only from ALB security group<br>

## High Availability Design

Finally, I ensured high availability by:<br>
Deploying subnets across multiple Availability Zones<br>
Running EC2 instances in private subnets in different AZs<br>
Using ALB to distribute traffic across healthy instances<br>








