resource "aws_instance" "aws_demo" {
    ami = var.ami_id
    instance_type = var.aws_instance_type
    vpc_security_group_ids = [aws_security_group.allow_terraform.id]
    tags = var.ec2_tags
}
#it creates the default VPCS
resource "aws_security_group" "allow_terraform" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

  tags = var.sg_tags
}
