# aws-profile
Wrapper script to generate & pass AWS AssumeRole keys to other scripts

### Setup config

Populate config ~/.aws/config with desired profiles

```bash
[profile project]
aws_access_key_id=SOME-ACCESS-KEY-1
aws_secret_access_key=SOME-SECRET-KEY-1
region=us-east-2

[profile user]
aws_access_key_id=SOME-ACCESS-KEY-2
aws_secret_access_key=SOME-SECRET-KEY-2
region=eu-west-1
```

### Usage

```bash
$AWS_DEFAULT_PROFILE=project aws-profile command [args]
```

# Terraform

This repository contains the Terraform modules and code for creating a fully working AWS Environment consisting of:
* [State Management](#roots/terraform-state/README.md)
* [Networking](#networking)
* [Bastion Host](#bastion)
* [NAT GW](#natgw)
* [RDS](#rds)
* [Elastic Beanstalk](#eb)

### Networking
* VPC with a /16 ip address range and an internet gateway
* We are using a region and a number of availability zones. For high-availability we need at least two. We'll use 3 since most of the AWS resources are in Autoscaling Groups
* In every availability zone we are creating a private and a public subnet with a /24 ip address range
  * Public subnet CIDRs used are: 10.0.0.0/24, 10.0.1.0/24, 10.0.2.0/24
  * Private subnet CIDR used are: 10.0.10.0/24, 10.0.11.0/24, 10.0.12.0/24
* In the public subnet we place a NAT gateway and the LoadBalancer
* The private subnets are used in the autoscale group which places instances in them

## Terraform module

To be able to create the stated infrastructure we are using Terraform. To allow everyone to use the infrastructure code, this repository contains the code as Terraform modules so it can be easily used by others.

Details regarding how a module works or why it is setup is described in the module itself if needed.

The philosophy is that the modules should provide as much as possible of sane defaults. That way when using the modules it is possible to quickly configure them but still change when needed. That is also why we introduced something like a name 'default' as the default value for some of the components.

### Running the terraform code

Each AWS resource is living in it's own directory, inside roots, and has to be deployed individually. This separation is made to isolate resources form each other.

Quick way to create this from the repository as is:

```bash
terraform init
terraform get
terraform apply
```

## SSH access to the instances

You should not put your instances directly on the internet. You should not allow SSH access to the instances directly but use a bastion server for that. You don't want to make any manual changes in the production environment. you also want to limit manual changes in other environments.
