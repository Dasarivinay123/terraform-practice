resource "aws_instance" "aws_demo" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_terraform.id]
  tags = {
    Name        = "aws_demo"
    Project     = "roboshop"
    Environment = "dev"
  }
}
#it creates the default VPCS
resource "aws_security_group" "allow_terraform" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "allow_terraform"
    Project     = "roboshop"
    Environment = "dev"
  }
}
