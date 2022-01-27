# Terraform
# To explain terraform/vpc
# This resource runs that command 

# - terraform apply -var-file=variable.tfvars 


- This terraform resorce creates private and public vpc on aws
- Adds Internet Gateway
- Creates and attaches a NAT GW to the private subnet
- Creates and configures the route tables.
- Creates an S3 bucket called devops which includes a directory called homeworks and 
  creates an encrypted object in that directory called test_object.txt.

# To explain terraform/vpc/modul
# This resource runs that command 

# - terraform apply in terraform/vpc/modul directory 


- The module.tf file in this module makes all the operations for vpc easier with the help of terraform-aws-modules/vpc/aws. 
