resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ var.ec2_sg_python_api, var.ec2_sg_ssh_http]
  associate_public_ip_address = var.enable_public_ip_address
  user_data = local.ec2_userdata_script
  key_name = "terraform"
   tags = {
    Name = "${var.project_name}-ec2"
    Environment = var.environment
  }
}


resource "aws_key_pair" "key-pair" {
  key_name = "terraform"
  public_key = format("%s%s", "ssh -i /home/ubuntu/keys/aws_ec2_terraform ubuntu@", aws_instance.ec2.public_ip)
  
}