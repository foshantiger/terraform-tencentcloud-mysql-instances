variable "instance_name" {
  description = "The name of a mysql instance."
  type        = string
}

variable "mem_size" {
  description = "Memory size (in MB)."
  type        = number
}

variable "volume_size" {
  description = "Disk size (in GB)."
  type        = number
}

variable "auto_renew_flag" {
  description = "Auto-renew flag. 0 - default state (manual renewal); 1 - automatic renewal.Only supported PREPAID instance."
  type        = number
  default     = 0
}

variable "availability_zone" {
  description = "Indicates which availability zone will be used."
  type        = string
}

variable "charge_type" {
  description = "Pay type of instance. Valid values:PREPAID, POSTPAID. Default is POSTPAID."
  type        = string
  default     = "POSTPAID"
  validation {
    condition     = contains(["PREPAID", "POSTPAID"], var.charge_type)
    error_message = "Valid charge_type: PREPAID, POSTPAID."
  }
}

variable "cpu" {
  description = "CPU cores."
  type        = number
}

variable "device_type" {
  description = "Specify device type, available values: UNIVERSAL (default), EXCLUSIVE, BASIC."
  type        = string
  default     = "UNIVERSAL"
  validation {
    condition     = contains(["UNIVERSAL", "EXCLUSIVE", "BASIC"], var.device_type)
    error_message = "Valid device_type: UNIVERSAL, EXCLUSIVE, BASIC."
  }
}

variable "engine_version" {
  description = "The version number of the database engine to use. Supported versions include 5.5/5.6/5.7/8.0, and default is 5.7."
  type        = string
  default     = "5.7"
}

variable "fast_upgrade" {
  description = "Specify whether to enable fast upgrade when upgrade instance spec, available value: 1 - enabled, 0 - disabled."
  type        = number
  default     = 1
}

variable "first_slave_zone" {
  description = "Zone information about first slave instance."
  type        = string
}

variable "force_delete" {
  description = "Indicate whether to delete instance directly or not. Default is false. If set true, the instance will be deleted instead of staying recycle bin. Note: only works for PREPAID instance."
  type        = bool
  default     = false
}

variable "internet_service" {
  description = "Indicates whether to enable the access to an instance from public network: 0 - No, 1 - Yes."
  type        = number
  default     = 0
}

variable "intranet_port" {
  description = "Public access port. Valid value ranges: [1024~65535]. The default value is 3306."
  type        = number
  validation {
    condition     = var.intranet_port >= 1024 && var.intranet_port <= 65535 && floor(var.intranet_port) == var.intranet_port
    error_message = "Valid value ranges: [1024~65535]."
  }
  default     = 3306
}

variable "param_template_id" {
  description = "Specify parameter template id."
  type        = number
}

variable "parameters" {
  description = "List of parameters to use."
  type        = map(string)
}

variable "prepaid_period" {
  description = "Period of instance. NOTES: Only supported prepaid instance."
  type        = number
  default     = 1
}

variable "project_id" {
  description = "Project ID, default value is 0."
  type        = number
  default     = 0
}

variable "root_password" {
  description = "Password of root account."
  type        = string
}

variable "second_slave_zone" {
  description = "Zone information about second slave instance."
  type        = string
}

variable "security_groups" {
  description = "A list of security group IDs to associate with."
  type        = list(string)
}

variable "slave_deploy_mode" {
  description = "Availability zone deployment method. Available values: 0 - Single availability zone; 1 - Multiple availability zones."
  type        = number
  default     = 0
}

variable "slave_sync_mode" {
  description = "Data replication mode. 0 - Async replication; 1 - Semisync replication; 2 - Strongsync replication."
  type        = number
  default     = 0
}

variable "subnet_id" {
  description = "Private network ID. If vpc_id is set, this value is required."
  type        = string
}

variable "tags" {
  description = "Instance tags."
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "ID of VPC, which can be modified once every 24 hours and can't be removed."
  type        = string
}