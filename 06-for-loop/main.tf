resource "aws_instance" "roboshop" {
    # count = length(var.instances)
    for_each = var.instances
    ami = var.ami_id
    instance_type = var.aws_instance_type
    vpc_security_group_ids = [aws_security_group.roboshop[each.key].id,
    aws_security_group.common.id]
    tags = {
      Name = "${var.project}-${var.environment}-${each.key}"
    }
}
#it creates the default VPCS
resource "aws_security_group" "roboshop" {
  # count = length(var.instances)
  for_each = var.instances
  name        = "${var.project}-${var.environment}-${each.key}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

  tags = {
   Name = "${var.project}-${var.environment}-${each.key}"
  }
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
