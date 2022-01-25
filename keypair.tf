resource "aws_key_pair" "devops" {
  key_name   = "devops-key"
  public_key = file("~/.ssh/id_rsa.pub")
  }