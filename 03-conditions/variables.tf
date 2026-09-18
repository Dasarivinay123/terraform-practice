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
variable "ec2_tags" {
  type        = map
  default     = {
      Name        = "aws_demo"
      Project     = "roboshop"
      Environment = "dev"
    }
}
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
variable "sg_tags" {
  type        = map
  default     = {
      Name        = "aws_terraform"
      Project     = "roboshop"
      Environment = "dev"
    }
}
variable "environment" {
  type        = string
  default     = "dev"
}