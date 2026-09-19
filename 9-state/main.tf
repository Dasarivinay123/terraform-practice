resource "aws_instance" "aws_demo" {
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_terraform.id]
  tags = {
    Name        = "aws_demo-change"
    Project     = "roboshop"
    Environment = "dev"
  }
}
#it creates the default VPCS
resource "aws_security_group" "allow_terraform" {
  name        = "allow_tls-change"
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
