module "hwork2_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  public_subnets  = ["10.0.104.0/24", "10.0.105.0/24", "10.0.106.0/24"]
  enable_nat_gateway = true
  enable_vpn_gateway = true
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
resource "aws_s3_bucket" "devopseduit" {
  bucket = "devopseduit"
  acl    = "private"
  versioning {
    enabled = true
  }

  tags = {
    Name        = "Devosp Homework bucket"
    Environment = "Dvps"
  }
}

resource "aws_s3_bucket_object" "homeworks" {
    bucket = "devopseduit"
    acl    = "private"
    key    = "Homeworks/"
}
resource "aws_s3_bucket_object" "test_object" {
  bucket = "devopseduit"
  key    = "Homeworks/test_object_file.txt"
  source = "files/test_object.txt"
  etag = filemd5("files/test_object.txt")
}