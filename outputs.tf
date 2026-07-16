output "application_gateways_id" {
  description = "Map of id values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.id if v.id != null && length(v.id) > 0 }
}
output "application_gateways_authentication_certificate" {
  description = "Map of authentication_certificate values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.authentication_certificate if v.authentication_certificate != null && length(v.authentication_certificate) > 0 }
  sensitive   = true
}
output "application_gateways_autoscale_configuration" {
  description = "Map of autoscale_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.autoscale_configuration if v.autoscale_configuration != null && length(v.autoscale_configuration) > 0 }
}
output "application_gateways_backend" {
  description = "Map of backend values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.backend if v.backend != null && length(v.backend) > 0 }
}
output "application_gateways_backend_address_pool" {
  description = "Map of backend_address_pool values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.backend_address_pool if v.backend_address_pool != null && length(v.backend_address_pool) > 0 }
}
output "application_gateways_backend_http_settings" {
  description = "Map of backend_http_settings values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.backend_http_settings if v.backend_http_settings != null && length(v.backend_http_settings) > 0 }
}
output "application_gateways_custom_error_configuration" {
  description = "Map of custom_error_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.custom_error_configuration if v.custom_error_configuration != null && length(v.custom_error_configuration) > 0 }
}
output "application_gateways_enable_http2" {
  description = "Map of enable_http2 values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.enable_http2 if v.enable_http2 != null }
}
output "application_gateways_fips_enabled" {
  description = "Map of fips_enabled values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.fips_enabled if v.fips_enabled != null }
}
output "application_gateways_firewall_policy_id" {
  description = "Map of firewall_policy_id values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.firewall_policy_id if v.firewall_policy_id != null && length(v.firewall_policy_id) > 0 }
}
output "application_gateways_force_firewall_policy_association" {
  description = "Map of force_firewall_policy_association values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.force_firewall_policy_association if v.force_firewall_policy_association != null }
}
output "application_gateways_frontend_ip_configuration" {
  description = "Map of frontend_ip_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.frontend_ip_configuration if v.frontend_ip_configuration != null && length(v.frontend_ip_configuration) > 0 }
}
output "application_gateways_frontend_port" {
  description = "Map of frontend_port values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.frontend_port if v.frontend_port != null && length(v.frontend_port) > 0 }
}
output "application_gateways_gateway_ip_configuration" {
  description = "Map of gateway_ip_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.gateway_ip_configuration if v.gateway_ip_configuration != null && length(v.gateway_ip_configuration) > 0 }
}
output "application_gateways_global" {
  description = "Map of global values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.global if v.global != null && length(v.global) > 0 }
}
output "application_gateways_http2_enabled" {
  description = "Map of http2_enabled values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.http2_enabled if v.http2_enabled != null }
}
output "application_gateways_http_listener" {
  description = "Map of http_listener values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.http_listener if v.http_listener != null && length(v.http_listener) > 0 }
}
output "application_gateways_identity" {
  description = "Map of identity values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "application_gateways_listener" {
  description = "Map of listener values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.listener if v.listener != null && length(v.listener) > 0 }
}
output "application_gateways_location" {
  description = "Map of location values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.location if v.location != null && length(v.location) > 0 }
}
output "application_gateways_name" {
  description = "Map of name values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.name if v.name != null && length(v.name) > 0 }
}
output "application_gateways_private_endpoint_connection" {
  description = "Map of private_endpoint_connection values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.private_endpoint_connection if v.private_endpoint_connection != null && length(v.private_endpoint_connection) > 0 }
}
output "application_gateways_private_link_configuration" {
  description = "Map of private_link_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.private_link_configuration if v.private_link_configuration != null && length(v.private_link_configuration) > 0 }
}
output "application_gateways_probe" {
  description = "Map of probe values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.probe if v.probe != null && length(v.probe) > 0 }
}
output "application_gateways_redirect_configuration" {
  description = "Map of redirect_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.redirect_configuration if v.redirect_configuration != null && length(v.redirect_configuration) > 0 }
}
output "application_gateways_request_routing_rule" {
  description = "Map of request_routing_rule values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.request_routing_rule if v.request_routing_rule != null && length(v.request_routing_rule) > 0 }
}
output "application_gateways_resource_group_name" {
  description = "Map of resource_group_name values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "application_gateways_rewrite_rule_set" {
  description = "Map of rewrite_rule_set values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.rewrite_rule_set if v.rewrite_rule_set != null && length(v.rewrite_rule_set) > 0 }
}
output "application_gateways_routing_rule" {
  description = "Map of routing_rule values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.routing_rule if v.routing_rule != null && length(v.routing_rule) > 0 }
}
output "application_gateways_sku" {
  description = "Map of sku values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "application_gateways_ssl_certificate" {
  description = "Map of ssl_certificate values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.ssl_certificate if v.ssl_certificate != null && length(v.ssl_certificate) > 0 }
  sensitive   = true
}
output "application_gateways_ssl_policy" {
  description = "Map of ssl_policy values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.ssl_policy if v.ssl_policy != null && length(v.ssl_policy) > 0 }
}
output "application_gateways_ssl_profile" {
  description = "Map of ssl_profile values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.ssl_profile if v.ssl_profile != null && length(v.ssl_profile) > 0 }
}
output "application_gateways_tags" {
  description = "Map of tags values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "application_gateways_trusted_client_certificate" {
  description = "Map of trusted_client_certificate values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.trusted_client_certificate if v.trusted_client_certificate != null && length(v.trusted_client_certificate) > 0 }
  sensitive   = true
}
output "application_gateways_trusted_root_certificate" {
  description = "Map of trusted_root_certificate values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.trusted_root_certificate if v.trusted_root_certificate != null && length(v.trusted_root_certificate) > 0 }
  sensitive   = true
}
output "application_gateways_url_path_map" {
  description = "Map of url_path_map values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.url_path_map if v.url_path_map != null && length(v.url_path_map) > 0 }
}
output "application_gateways_waf_configuration" {
  description = "Map of waf_configuration values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.waf_configuration if v.waf_configuration != null && length(v.waf_configuration) > 0 }
}
output "application_gateways_zones" {
  description = "Map of zones values across all application_gateways, keyed the same as var.application_gateways"
  value       = { for k, v in azurerm_application_gateway.application_gateways : k => v.zones if v.zones != null && length(v.zones) > 0 }
}

