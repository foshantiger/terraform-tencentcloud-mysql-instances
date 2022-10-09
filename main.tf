locals {

  instances = flatten([
    for instance in var.instances: {
      instance_name = instance.instance_name
      mem_size = instance.mem_size
      volume_size = instance.volume_size
      auto_renew_flag = instance.auto_renew_flag == null  ? 0 : instance.auto_renew_flag
      availability_zone = instance.availability_zone
      charge_type = instance.charge_type == null || instance.charge_type == "" ? "POSTPAID" : instance.charge_type
      cpu = instance.cpu
      device_type = instance.device_type == null || instance.device_type == "" ? "UNIVERSAL" : instance.device_type
      engine_version = instance.engine_version == null || instance.engine_version == "" ? "5.7" : instance.engine_version
      fast_upgrade = instance.fast_upgrade
      first_slave_zone = instance.first_slave_zone
      force_delete = instance.force_delete == null ? false : instance.force_delete
      internet_service = instance.internet_service == null ? 0 : instance.internet_service
      intranet_port = instance.intranet_port == null ? 3306 : instance.intranet_port
      param_template_id = instance.param_template_id
      parameters = instance.parameters == null ? {} : instance.parameters
      prepaid_period = instance.prepaid_period == null || instance.prepaid_period == 0 ? 1 : instance.prepaid_period
      project_id = instance.project_id == null ? 0 : instance.project_id
      root_password = instance.root_password == "" ? null : instance.root_password
      second_slave_zone = instance.second_slave_zone
      security_groups = instance.security_groups
      slave_deploy_mode = instance.slave_deploy_mode == null ? 0 : instance.slave_deploy_mode
      slave_sync_mode = instance.slave_sync_mode == null ? 0 : instance.slave_sync_mode
      subnet_id = instance.subnet_id
      vpc_id = instance.vpc_id
      tags = instance.tags == null ? {} : instance.tags
    }
  ])

  instance_map = { for instance in local.instances: format("%s.%s", instance.vpc_id, instance.instance_name) => instance }
  instance_id_map = { for key, instance in module.mysql_instances: key => instance.id}

}

module "mysql_instances" {
  for_each = local.instance_map
  source = "./modules/instance"

  instance_name = each.value.instance_name
  mem_size = each.value.mem_size
  volume_size = each.value.volume_size
  auto_renew_flag = each.value.auto_renew_flag == null  ? 0 : each.value.auto_renew_flag
  availability_zone = each.value.availability_zone
  charge_type = each.value.charge_type == null || each.value.charge_type == "" ? "POSTPAID" : each.value.charge_type
  cpu = each.value.cpu
  device_type = each.value.device_type == null || each.value.device_type == "" ? "UNIVERSAL" : each.value.device_type
  engine_version = each.value.engine_version == null || each.value.engine_version == "" ? "5.7" : each.value.engine_version
  fast_upgrade = each.value.fast_upgrade
  first_slave_zone = each.value.first_slave_zone
  force_delete = each.value.force_delete == null ? false : each.value.force_delete
  internet_service = each.value.internet_service == null ? 0 : each.value.internet_service
  intranet_port = each.value.intranet_port == null ? 3306 : each.value.intranet_port
  param_template_id = each.value.param_template_id
  parameters = each.value.parameters == null ? {} : each.value.parameters
  prepaid_period = each.value.prepaid_period == null || each.value.prepaid_period == 0 ? 1 : each.value.prepaid_period
  project_id = each.value.project_id == null ? 0 : each.value.project_id
  root_password = each.value.root_password == "" ? null : each.value.root_password
  second_slave_zone = each.value.second_slave_zone
  security_groups = each.value.security_groups
  slave_deploy_mode = each.value.slave_deploy_mode == null ? 0 : each.value.slave_deploy_mode
  slave_sync_mode = each.value.slave_sync_mode == null ? 0 : each.value.slave_sync_mode
  subnet_id = each.value.subnet_id
  vpc_id = each.value.vpc_id
  tags = each.value.tags == null ? {} : each.value.tags
}