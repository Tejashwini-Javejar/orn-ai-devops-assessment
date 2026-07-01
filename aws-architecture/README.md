## Question:Explain an AWS VPC design you built. Include public/private subnets, NAT, endpoints, security groups and high availability

## Answer:
 
 Yes, I have designed a VPC architecture for deploying the application on AWS.<br>
 First, I selected the AWS region and created a VPC by defining a CIDR block.<br>
 Inside the VPC, I created public and private subnets and distributed them across multiple availability zones to ensure high availability.<br>
 In the public subnets, I placed the application load balancer and NAT gateway.The application servers were deployed in private subnets so they are not directly exposed to the internet.<br>
 I created route tables for public and private subnets. The public route table connects to the internet gateway, while the private subnet route table sends outbound internet traffic through the NAT Gateway.<br>
 For security, I used security groups Security groups operates at the instance level and control the incoming and the outgoing traffic.<br>

## To ensure high availabilty, the architecture spans across multiple avaiability zones. The applictaion load balancer distributes the traffic across healthy instances in different availability zones, minimizing downtime if one availbilty zone becomes unavailable.
