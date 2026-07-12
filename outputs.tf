output "application_gateways_authentication_certificate" {
  description = "Map of authentication_certificate values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.authentication_certificate }
  sensitive   = true
}
output "application_gateways_autoscale_configuration" {
  description = "Map of autoscale_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.autoscale_configuration }
}
output "application_gateways_backend" {
  description = "Map of backend values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.backend }
}
output "application_gateways_backend_address_pool" {
  description = "Map of backend_address_pool values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.backend_address_pool }
}
output "application_gateways_backend_http_settings" {
  description = "Map of backend_http_settings values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.backend_http_settings }
}
output "application_gateways_custom_error_configuration" {
  description = "Map of custom_error_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.custom_error_configuration }
}
output "application_gateways_enable_http2" {
  description = "Map of enable_http2 values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.enable_http2 }
}
output "application_gateways_fips_enabled" {
  description = "Map of fips_enabled values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.fips_enabled }
}
output "application_gateways_firewall_policy_id" {
  description = "Map of firewall_policy_id values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.firewall_policy_id }
}
output "application_gateways_force_firewall_policy_association" {
  description = "Map of force_firewall_policy_association values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.force_firewall_policy_association }
}
output "application_gateways_frontend_ip_configuration" {
  description = "Map of frontend_ip_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.frontend_ip_configuration }
}
output "application_gateways_frontend_port" {
  description = "Map of frontend_port values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.frontend_port }
}
output "application_gateways_gateway_ip_configuration" {
  description = "Map of gateway_ip_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.gateway_ip_configuration }
}
output "application_gateways_global" {
  description = "Map of global values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.global }
}
output "application_gateways_http2_enabled" {
  description = "Map of http2_enabled values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.http2_enabled }
}
output "application_gateways_http_listener" {
  description = "Map of http_listener values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.http_listener }
}
output "application_gateways_identity" {
  description = "Map of identity values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.identity }
}
output "application_gateways_listener" {
  description = "Map of listener values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.listener }
}
output "application_gateways_location" {
  description = "Map of location values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.location }
}
output "application_gateways_name" {
  description = "Map of name values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.name }
}
output "application_gateways_private_endpoint_connection" {
  description = "Map of private_endpoint_connection values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.private_endpoint_connection }
}
output "application_gateways_private_link_configuration" {
  description = "Map of private_link_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.private_link_configuration }
}
output "application_gateways_probe" {
  description = "Map of probe values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.probe }
}
output "application_gateways_redirect_configuration" {
  description = "Map of redirect_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.redirect_configuration }
}
output "application_gateways_request_routing_rule" {
  description = "Map of request_routing_rule values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.request_routing_rule }
}
output "application_gateways_resource_group_name" {
  description = "Map of resource_group_name values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.resource_group_name }
}
output "application_gateways_rewrite_rule_set" {
  description = "Map of rewrite_rule_set values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.rewrite_rule_set }
}
output "application_gateways_routing_rule" {
  description = "Map of routing_rule values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.routing_rule }
}
output "application_gateways_sku" {
  description = "Map of sku values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.sku }
}
output "application_gateways_ssl_certificate" {
  description = "Map of ssl_certificate values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.ssl_certificate }
  sensitive   = true
}
output "application_gateways_ssl_policy" {
  description = "Map of ssl_policy values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.ssl_policy }
}
output "application_gateways_ssl_profile" {
  description = "Map of ssl_profile values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.ssl_profile }
}
output "application_gateways_tags" {
  description = "Map of tags values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.tags }
}
output "application_gateways_trusted_client_certificate" {
  description = "Map of trusted_client_certificate values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.trusted_client_certificate }
  sensitive   = true
}
output "application_gateways_trusted_root_certificate" {
  description = "Map of trusted_root_certificate values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.trusted_root_certificate }
  sensitive   = true
}
output "application_gateways_url_path_map" {
  description = "Map of url_path_map values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.url_path_map }
}
output "application_gateways_waf_configuration" {
  description = "Map of waf_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.waf_configuration }
}
output "application_gateways_zones" {
  description = "Map of zones values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.zones }
}

