# NAT Gateway

Nat Gateways (NAT GW) are using network address translation (NAT) to enable instances in a private subnet to connect to the internet or other AWS services, but prevent the internet from initiating a connection with those instances.

NAT GWS are created in public subnets. When creating a NAT GW you must specify the public subnet in which the NAT gateway should reside.

This terraform recipe assumes that 3 Elastic IPs (EIP) are manually allocated. Altghough terraform can automatically create the EIPs, it's a best practice to manually reserve the EIPS with the assumption that the EIPS can be included in external whitelists.
The EIPs values are confugired in eip_allocations variable in vars.tf file. 
