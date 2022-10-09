data "tencentcloud_mysql_zone_config" "config" {

}

output "zone_config" {
  value = data.tencentcloud_mysql_zone_config.config
}