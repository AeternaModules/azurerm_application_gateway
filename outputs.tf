output "application_gateways" {
  description = "All application_gateway resources"
  value       = azurerm_application_gateway.application_gateways
  sensitive   = true
}
output "application_gateways_authentication_certificate" {
  description = "List of authentication_certificate values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.authentication_certificate]
  sensitive   = true
}
output "application_gateways_autoscale_configuration" {
  description = "List of autoscale_configuration values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.autoscale_configuration]
}
output "application_gateways_backend" {
  description = "List of backend values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.backend]
}
output "application_gateways_backend_address_pool" {
  description = "List of backend_address_pool values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.backend_address_pool]
}
output "application_gateways_backend_http_settings" {
  description = "List of backend_http_settings values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.backend_http_settings]
}
output "application_gateways_custom_error_configuration" {
  description = "List of custom_error_configuration values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.custom_error_configuration]
}
output "application_gateways_enable_http2" {
  description = "List of enable_http2 values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.enable_http2]
}
output "application_gateways_fips_enabled" {
  description = "List of fips_enabled values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.fips_enabled]
}
output "application_gateways_firewall_policy_id" {
  description = "List of firewall_policy_id values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.firewall_policy_id]
}
output "application_gateways_force_firewall_policy_association" {
  description = "List of force_firewall_policy_association values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.force_firewall_policy_association]
}
output "application_gateways_frontend_ip_configuration" {
  description = "List of frontend_ip_configuration values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.frontend_ip_configuration]
}
output "application_gateways_frontend_port" {
  description = "List of frontend_port values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.frontend_port]
}
output "application_gateways_gateway_ip_configuration" {
  description = "List of gateway_ip_configuration values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.gateway_ip_configuration]
}
output "application_gateways_global" {
  description = "List of global values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.global]
}
output "application_gateways_http2_enabled" {
  description = "List of http2_enabled values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.http2_enabled]
}
output "application_gateways_http_listener" {
  description = "List of http_listener values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.http_listener]
}
output "application_gateways_identity" {
  description = "List of identity values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.identity]
}
output "application_gateways_listener" {
  description = "List of listener values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.listener]
}
output "application_gateways_location" {
  description = "List of location values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.location]
}
output "application_gateways_name" {
  description = "List of name values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.name]
}
output "application_gateways_private_endpoint_connection" {
  description = "List of private_endpoint_connection values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.private_endpoint_connection]
}
output "application_gateways_private_link_configuration" {
  description = "List of private_link_configuration values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.private_link_configuration]
}
output "application_gateways_probe" {
  description = "List of probe values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.probe]
}
output "application_gateways_redirect_configuration" {
  description = "List of redirect_configuration values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.redirect_configuration]
}
output "application_gateways_request_routing_rule" {
  description = "List of request_routing_rule values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.request_routing_rule]
}
output "application_gateways_resource_group_name" {
  description = "List of resource_group_name values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.resource_group_name]
}
output "application_gateways_rewrite_rule_set" {
  description = "List of rewrite_rule_set values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.rewrite_rule_set]
}
output "application_gateways_routing_rule" {
  description = "List of routing_rule values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.routing_rule]
}
output "application_gateways_sku" {
  description = "List of sku values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.sku]
}
output "application_gateways_ssl_certificate" {
  description = "List of ssl_certificate values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.ssl_certificate]
  sensitive   = true
}
output "application_gateways_ssl_policy" {
  description = "List of ssl_policy values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.ssl_policy]
}
output "application_gateways_ssl_profile" {
  description = "List of ssl_profile values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.ssl_profile]
}
output "application_gateways_tags" {
  description = "List of tags values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.tags]
}
output "application_gateways_trusted_client_certificate" {
  description = "List of trusted_client_certificate values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.trusted_client_certificate]
  sensitive   = true
}
output "application_gateways_trusted_root_certificate" {
  description = "List of trusted_root_certificate values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.trusted_root_certificate]
  sensitive   = true
}
output "application_gateways_url_path_map" {
  description = "List of url_path_map values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.url_path_map]
}
output "application_gateways_waf_configuration" {
  description = "List of waf_configuration values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.waf_configuration]
}
output "application_gateways_zones" {
  description = "List of zones values across all application_gateways"
  value       = [for k, v in azurerm_application_gateway.application_gateways : v.zones]
}

