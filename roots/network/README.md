# Networking

The configuration with public/private subnets is recommend for running a public-facing web application, while maintaining back-end servers that aren't publicly accessible. A common example is a multi-tier website, with the web servers in a public subnet and the database servers in a private subnet.

The instances in the public subnet can send outbound traffic directly to the Internet, whereas the instances in the private subnet can't. Instead, the instances in the private subnet can access the Internet by using a network address translation (NAT) gateway that resides in the public subnet. The database servers can connect to the Internet for software updates using the NAT gateway, but the Internet cannot establish connections to the database servers.

## Configuration

The configuration includes the following:

* Virtual Private Cloud (VPC) with a /16 ip address range and an internet gateway
* We are using a region and a number of availability zones. For high-availability we need at least two. We'll use 3 since most of the AWS resources are in Autoscaling Groups
* In every availability zone we are creating a private and a public subnet with a /24 ip address range
  * Public subnet CIDRs used are: 10.0.0.0/24, 10.0.1.0/24, 10.0.2.0/24
  * Private subnet CIDR used are: 10.0.10.0/24, 10.0.11.0/24, 10.0.12.0/24
* In the public subnet we place a NAT gateway and the LoadBalancer
* The private subnets are used in the autoscale group which places instances in them
* Each subnet is associated with it's own routing table. Besides the default local network rule a new rule it's added to the routing table, as follows:
  * For public subnet a rule to the Internet Gateway (IGW)
  * For private subnets a rule to the NAT Gateway (NATGW)

### Routing

* Rules for Public Subnets

| Destination   | Target         |
| ------------- | -------------- |
| 10.0.0.0/16   | local          |
| 0.0.0.0/0     | igw-id         |


* Rules for Private Subnets

| Destination   | Target         |
| ------------- | -------------- |
| 10.0.0.0/16   | local          |
| 0.0.0.0/0     | nat-gateway-id |
