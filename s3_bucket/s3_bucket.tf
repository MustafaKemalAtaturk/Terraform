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
