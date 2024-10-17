variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

# variable "sg_name" {
#   default = "mongodb"
# }

# variable "description" {
#   default = "security group for mongodb instances"
# }


variable "mongodb_sg_ingress_rules" {
  default = [
    {
      description = "allow port 80"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "allow port 22"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  ]
}
