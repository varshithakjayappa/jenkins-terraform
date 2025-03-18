locals {
  ec2_userdata_script = templatefile("${path.module}/scripts/ec2_install_apache.sh", {})
}