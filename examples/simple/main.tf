
module "mysql-instances" {
  source = "../.."
  instances = [
    {
      instance_name = "tigerhhchen-tf-test"
      mem_size = 1000
      volume_size = 50
      # auto_renew_flag = 0
      availability_zone = "ap-guangzhou-7"
      # charge_type = "POSTPAID"
      # cpu = 1
      # device_type = "UNIVERSAL"
      engine_version = "8.0"
      # fast_upgrade = 1
      # first_slave_zone = "ap-guangzhou-6"
      # force_delete = false
      internet_service = 1
      # intranet_port = 3306
      # param_template_id = 0
      # prepaid_period = 1
      # project_id = 0
      root_password = "Change@me"
      # second_slave_zone = "ap-guangzhou-6"
      security_groups = ["sg-5b29sk1b"]
      # slave_deploy_mode = 0
      # slave_sync_mode = 0
      subnet_id = "subnet-b9bhnzsq"
      vpc_id = "vpc-6og1oe1b"
      tags = {
        app = "terraform"
      }
    },
    {
      # before_run = "5s"
      instance_name = "tigerhhchen-tf-test2"
      mem_size = 1000
      volume_size = 50
      # auto_renew_flag = 0
      availability_zone = "ap-guangzhou-6"
      # charge_type = "POSTPAID"
      # cpu = 1
      # device_type = "UNIVERSAL"
      # engine_version = "8.0"
      # fast_upgrade = 1
      first_slave_zone = "ap-guangzhou-7"
      # force_delete = false
      internet_service = 1
      # intranet_port = 3306
      # param_template_id = 0
      # prepaid_period = 1
      # project_id = 0
      root_password = "Change@me"
      second_slave_zone = "ap-guangzhou-6"
      security_groups = ["sg-5b29sk1b"]
      slave_deploy_mode = 1
      slave_sync_mode = 1
      subnet_id = "subnet-b9bhnzsq"
      vpc_id = "vpc-6og1oe1b"
      tags = {
        app = "terraform2"
      }
      parameters = {
        max_connections = "1000",
        character_set_server = "UTF8MB4"
      }
    },
  ]
}