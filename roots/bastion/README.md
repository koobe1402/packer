# Bastion Host

A bastion host is a server whose purpose is to provide access to a private network from an external network, such as the Internet.
Because of its exposure to potential attack, a bastion host must minimize the chances of penetration.
It's used to mitigate the risk of allowing SSH connections from an external network to the Linux instances launched in a private subnet of your Amazon Virtual Private Cloud (VPC).

The Bastion Host is deployed by an Auto Scalling Group (ASG) configured to always deploy 1 instance.
The ASG is spanning over 3 Availability Zones (AZ). In case the AZ which is hosting the Bastion Host fails,
the ASG will create a fully functional Bastion Host in one of the remaining AZs.

This terraform recipe assumes that an Elastic IPs (EIP) is manually allocated. The bastion host automatically associates the EIP with the instance at boot time.

## SSH access to the instances

You should not put your instances directly on the internet. You should not allow SSH access to the instances directly but use a bastion server for that. You don't want to make any manual changes in the production environment. you also want to limit manual changes in other environments.
