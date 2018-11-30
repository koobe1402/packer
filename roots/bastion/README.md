A bastion host is a server whose purpose is to provide access to a private network from an external network, such as the Internet. 
Because of its exposure to potential attack, a bastion host must minimize the chances of penetration. 
It's used to mitigate the risk of allowing SSH connections from an external network to the Linux instances launched in a private subnet of your Amazon Virtual Private Cloud (VPC).

The Bastion Host is deployed by an Auto Scalling Group (ASG) configured to always deploy 1 instance.
The ASG is spanning over 3 Availability Zones (AZ). In case the AZ which is hosting the Bastion Host fails,
the ASG will create a fully functional Bastion Host in one of the remaining AZs.
