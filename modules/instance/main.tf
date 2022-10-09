locals {
  availability_zone = data.tencentcloud_vpc_subnets.subnets.instance_list[0].availability_zone
}

data "tencentcloud_vpc_subnets" "subnets" {
  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id
}

resource "tencentcloud_mysql_instance" "this" {
  instance_name = var.instance_name
  mem_size = var.mem_size
  volume_size = var.volume_size
  auto_renew_flag = var.charge_type == "PREPAID" ? var.auto_renew_flag : null
  availability_zone = var.availability_zone
  charge_type = var.charge_type
  cpu = var.cpu
  device_type = var.device_type
  engine_version = var.engine_version
  fast_upgrade = var.fast_upgrade
  first_slave_zone = var.first_slave_zone
  force_delete = var.force_delete
  internet_service = var.internet_service
  intranet_port = var.intranet_port
  param_template_id = var.param_template_id
  parameters = var.parameters
  prepaid_period = var.charge_type == "PREPAID" ? var.prepaid_period : null
  project_id = var.project_id
  root_password = var.root_password
  second_slave_zone = var.second_slave_zone
  security_groups = var.security_groups
  slave_deploy_mode = var.slave_deploy_mode
  slave_sync_mode = var.slave_sync_mode
  subnet_id = var.subnet_id
  vpc_id = var.vpc_id
  tags = var.tags
}