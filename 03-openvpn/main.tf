module "openvpn" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  ami                    = data.aws_ami.centos8.id
  name                   = "${var.project_name}-${var.environment}-openvpn"
  instance_type          = "t2.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.openvpn_sg_id.value]
  subnet_id              = data.aws_subnet.default.id
  user_data              = file("openvpn.sh")
  tags = {
    Name = "${var.project_name}-${var.environment}-openvpn"
  }
}

