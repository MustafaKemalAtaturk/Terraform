variable "cidr_ip_block" {}
variable "region" {}
variable "public_ip_cidr1" {}
variable "public_ip_cidr2" {}
variable "public_ip_cidr3" {}
variable "private_ip_cidr1" {}
variable "private_ip_cidr2" {}
variable "private_ip_cidr3" {}
variable "tags" {
	type = map(string)
}