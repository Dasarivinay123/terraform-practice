resource "aws_instance" "roboshop" {
    count = length(var.instances)
    ami = var.ami_id
    instance_type = var.aws_instance_type
    vpc_security_group_ids = [aws_security_group.roboshop[count.index].id,
    aws_security_group.common.id]
    tags = merge(var.common_tags, {
      Name = "terraform-demo-1"
    })  
}
#it creates the default VPCS
resource "aws_security_group" "roboshop" {
  count = length(var.instances)
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

  tags = merge(var.common_tags, {
      Name = "allow-terraform"
    })
   # first it creates theSG, modify the instance SG.
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-common"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

  tags = {
   Name = "${var.project}-${var.environment}-commmon"
  }
     # first it creates theSG, modify the instance SG.
  lifecycle {
    create_before_destroy = true
  }
}
