Terraform AWS EC2 Deployment
This project contains Terraform configurations to provision an Ubuntu EC2 instance on AWS using infrastructure as code (IaC).

Stack Used
Terraform (v1.x+)

AWS EC2

Ubuntu AMI

AWS Key Pair

AWS Security Group




 What It Does

 
Creates an Ubuntu EC2 instance

Creates a key pair and uses an SSH key

Configures Security Group to allow ports:

22 (SSH)

8080 (Jenkins/Tomcat etc.)

5000 (Flask apps or similar)

Outputs the public IP of the EC2 instance



Requirements

AWS CLI configured (aws configure)

Terraform installed

A valid AWS SSH public key (.pem not required, just .pub)

An AWS IAM user with EC2 permissions


