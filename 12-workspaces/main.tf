resource "aws_instance" "aws_demo" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [aws_security_group.allow_terraform.id]
  tags = {
    Name        = "${var.project}-${local.environment}-workspace"
    Project     = var.project
    Environment = local.environment
  }
}
#it creates the default VPCS
resource "aws_security_group" "allow_terraform" {
  name        = "${var.project}-${local.environment}-workspace"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project}-${local.environment}-workspace"
    Project     = var.project
    Environment = local.environment
  }
}
