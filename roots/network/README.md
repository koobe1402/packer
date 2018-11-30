### Networking
* VPC with a /16 ip address range and an internet gateway
* We are using a region and a number of availability zones. For high-availability we need at least two. We'll use 3 since most of the AWS resources are in Autoscaling Groups
* In every availability zone we are creating a private and a public subnet with a /24 ip address range
  * Public subnet CIDRs used are: 10.0.0.0/24, 10.0.1.0/24, 10.0.2.0/24
  * Private subnet CIDR used are: 10.0.10.0/24, 10.0.11.0/24, 10.0.12.0/24
* In the public subnet we place a NAT gateway and the LoadBalancer
* The private subnets are used in the autoscale group which places instances in them
