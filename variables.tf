variable "instances" {
  type = list(object({
    instance_name = string
    mem_size = number
    volume_size = number
    auto_renew_flag = optional(number)
    availability_zone = string
    charge_type = optional(string)
    cpu = optional(number)
    device_type = optional(string)
    engine_version = optional(string)
    fast_upgrade = optional(number)
    first_slave_zone = optional(string)
    force_delete = optional(bool)
    internet_service = optional(number)
    intranet_port = optional(number)
    param_template_id = optional(number)
    parameters = optional(map(string))
    prepaid_period = optional(number)
    project_id = optional(number)
    root_password = optional(string)
    second_slave_zone = optional(string)
    security_groups = list(string)
    slave_deploy_mode = optional(number)
    slave_sync_mode = optional(number)
    subnet_id = string
    vpc_id = string
    tags = optional(map(string))
  }))
  default = []
}
