variable "ami_id" {
  type        = string
  description = "RHEL 9  Join Devops Image"
  default     = "ami-0220d79f3f480ecf5" # Provide a fallback default
}

variable "aws_instance_type" {
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small","t3.medium","t3.large"], var.aws_instance_type)
    error_message = "The instance type must be t3.micro, t3.small, t3.medium, or t3.large."
  }
}
# variable "ec2_tags" {
#   type        = map
#   default     = {
#       Name        = "aws_demo"
#       Project     = "roboshop"
#       Environment = "dev"
#     }
# }
variable "sg_name" {
  type        = string
  default     = "allow_terraform"
}
variable "port" {
  type        = number
  default     = 0
}
variable "cidr" {
  type        = list
  default     = ["0.0.0.0/0"]
}
# variable "sg_tags" {
#   type        = map
#   default     = {
#       Name        = "aws_terraform"
#       Project     = "roboshop"
#       Environment = "dev"
#     }
# }
variable "project" {
  type        = string
  default     = "roboshop"
}
variable "environment" {
  type        = string
  default     = "prod"
}
variable "instances" {
  type = map
  default = {
    mongodb = {
      "instance_type" = "t3.micro"
    },
    redis = {
      "instance_type" = "t3.micro"
    },
    mysql = {
      "instance_type" = "t3.micro"
    },
    rabbitmq = {
      "instance_type" = "t3.micro"
    },
    catalogue = {
      "instance_type" = "t3.micro"
    },
    user = {
      "instance_type" = "t3.micro"
    },
    cart = {
      "instance_type" = "t3.micro"
    },
    shipping = {
      "instance_type" = "t3.micro"
    },
    payment = {
      "instance_type" = "t3.micro"
    },
    frontend = {
      "instance_type" = "t3.micro"
    }
  }
}
variable "zone_id" {
  type        = string
  default     = "Z0259442CKV1OWK97ZR9"
}
variable "domain_name" {
  type        = string
  default     = "vinaydevops.online"
}