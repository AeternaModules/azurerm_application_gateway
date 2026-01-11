resource "azurerm_application_gateway" "application_gateways" {
  for_each = var.application_gateways

  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  enable_http2                      = each.value.enable_http2
  fips_enabled                      = each.value.fips_enabled
  firewall_policy_id                = each.value.firewall_policy_id
  force_firewall_policy_association = each.value.force_firewall_policy_association
  tags                              = each.value.tags
  zones                             = each.value.zones

  backend_address_pool {
    fqdns        = each.value.backend_address_pool.fqdns
    ip_addresses = each.value.backend_address_pool.ip_addresses
    name         = each.value.backend_address_pool.name
  }

  backend_http_settings {
    affinity_cookie_name = each.value.backend_http_settings.affinity_cookie_name
    dynamic "authentication_certificate" {
      for_each = each.value.backend_http_settings.authentication_certificate != null ? [each.value.backend_http_settings.authentication_certificate] : []
      content {
        name = authentication_certificate.value.name
      }
    }
    dynamic "connection_draining" {
      for_each = each.value.backend_http_settings.connection_draining != null ? [each.value.backend_http_settings.connection_draining] : []
      content {
        drain_timeout_sec = connection_draining.value.drain_timeout_sec
        enabled           = connection_draining.value.enabled
      }
    }
    cookie_based_affinity                = each.value.backend_http_settings.cookie_based_affinity
    dedicated_backend_connection_enabled = each.value.backend_http_settings.dedicated_backend_connection_enabled
    host_name                            = each.value.backend_http_settings.host_name
    name                                 = each.value.backend_http_settings.name
    path                                 = each.value.backend_http_settings.path
    pick_host_name_from_backend_address  = each.value.backend_http_settings.pick_host_name_from_backend_address
    port                                 = each.value.backend_http_settings.port
    probe_name                           = each.value.backend_http_settings.probe_name
    protocol                             = each.value.backend_http_settings.protocol
    request_timeout                      = each.value.backend_http_settings.request_timeout
    trusted_root_certificate_names       = each.value.backend_http_settings.trusted_root_certificate_names
  }

  frontend_ip_configuration {
    name                            = each.value.frontend_ip_configuration.name
    private_ip_address              = each.value.frontend_ip_configuration.private_ip_address
    private_ip_address_allocation   = each.value.frontend_ip_configuration.private_ip_address_allocation
    private_link_configuration_name = each.value.frontend_ip_configuration.private_link_configuration_name
    public_ip_address_id            = each.value.frontend_ip_configuration.public_ip_address_id
    subnet_id                       = each.value.frontend_ip_configuration.subnet_id
  }

  frontend_port {
    name = each.value.frontend_port.name
    port = each.value.frontend_port.port
  }

  dynamic "gateway_ip_configuration" {
    for_each = each.value.gateway_ip_configuration
    content {
      name      = gateway_ip_configuration.value.name
      subnet_id = gateway_ip_configuration.value.subnet_id
    }
  }

  http_listener {
    dynamic "custom_error_configuration" {
      for_each = each.value.http_listener.custom_error_configuration != null ? [each.value.http_listener.custom_error_configuration] : []
      content {
        custom_error_page_url = custom_error_configuration.value.custom_error_page_url
        status_code           = custom_error_configuration.value.status_code
      }
    }
    firewall_policy_id             = each.value.http_listener.firewall_policy_id
    frontend_ip_configuration_name = each.value.http_listener.frontend_ip_configuration_name
    frontend_port_name             = each.value.http_listener.frontend_port_name
    host_name                      = each.value.http_listener.host_name
    host_names                     = each.value.http_listener.host_names
    name                           = each.value.http_listener.name
    protocol                       = each.value.http_listener.protocol
    require_sni                    = each.value.http_listener.require_sni
    ssl_certificate_name           = each.value.http_listener.ssl_certificate_name
    ssl_profile_name               = each.value.http_listener.ssl_profile_name
  }

  request_routing_rule {
    backend_address_pool_name   = each.value.request_routing_rule.backend_address_pool_name
    backend_http_settings_name  = each.value.request_routing_rule.backend_http_settings_name
    http_listener_name          = each.value.request_routing_rule.http_listener_name
    name                        = each.value.request_routing_rule.name
    priority                    = each.value.request_routing_rule.priority
    redirect_configuration_name = each.value.request_routing_rule.redirect_configuration_name
    rewrite_rule_set_name       = each.value.request_routing_rule.rewrite_rule_set_name
    rule_type                   = each.value.request_routing_rule.rule_type
    url_path_map_name           = each.value.request_routing_rule.url_path_map_name
  }

  sku {
    capacity = each.value.sku.capacity
    name     = each.value.sku.name
    tier     = each.value.sku.tier
  }

  dynamic "authentication_certificate" {
    for_each = each.value.authentication_certificate != null ? [each.value.authentication_certificate] : []
    content {
      data = authentication_certificate.value.data
      name = authentication_certificate.value.name
    }
  }

  dynamic "autoscale_configuration" {
    for_each = each.value.autoscale_configuration != null ? [each.value.autoscale_configuration] : []
    content {
      max_capacity = autoscale_configuration.value.max_capacity
      min_capacity = autoscale_configuration.value.min_capacity
    }
  }

  dynamic "custom_error_configuration" {
    for_each = each.value.custom_error_configuration != null ? [each.value.custom_error_configuration] : []
    content {
      custom_error_page_url = custom_error_configuration.value.custom_error_page_url
      status_code           = custom_error_configuration.value.status_code
    }
  }

  dynamic "global" {
    for_each = each.value.global != null ? [each.value.global] : []
    content {
      request_buffering_enabled  = global.value.request_buffering_enabled
      response_buffering_enabled = global.value.response_buffering_enabled
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "private_link_configuration" {
    for_each = each.value.private_link_configuration != null ? [each.value.private_link_configuration] : []
    content {
      ip_configuration {
        name                          = private_link_configuration.value.ip_configuration.name
        primary                       = private_link_configuration.value.ip_configuration.primary
        private_ip_address            = private_link_configuration.value.ip_configuration.private_ip_address
        private_ip_address_allocation = private_link_configuration.value.ip_configuration.private_ip_address_allocation
        subnet_id                     = private_link_configuration.value.ip_configuration.subnet_id
      }
      name = private_link_configuration.value.name
    }
  }

  dynamic "probe" {
    for_each = each.value.probe != null ? [each.value.probe] : []
    content {
      host     = probe.value.host
      interval = probe.value.interval
      dynamic "match" {
        for_each = probe.value.match != null ? [probe.value.match] : []
        content {
          body        = match.value.body
          status_code = match.value.status_code
        }
      }
      minimum_servers                           = probe.value.minimum_servers
      name                                      = probe.value.name
      path                                      = probe.value.path
      pick_host_name_from_backend_http_settings = probe.value.pick_host_name_from_backend_http_settings
      port                                      = probe.value.port
      protocol                                  = probe.value.protocol
      timeout                                   = probe.value.timeout
      unhealthy_threshold                       = probe.value.unhealthy_threshold
    }
  }

  dynamic "redirect_configuration" {
    for_each = each.value.redirect_configuration != null ? [each.value.redirect_configuration] : []
    content {
      include_path         = redirect_configuration.value.include_path
      include_query_string = redirect_configuration.value.include_query_string
      name                 = redirect_configuration.value.name
      redirect_type        = redirect_configuration.value.redirect_type
      target_listener_name = redirect_configuration.value.target_listener_name
      target_url           = redirect_configuration.value.target_url
    }
  }

  dynamic "rewrite_rule_set" {
    for_each = each.value.rewrite_rule_set != null ? [each.value.rewrite_rule_set] : []
    content {
      name = rewrite_rule_set.value.name
      dynamic "rewrite_rule" {
        for_each = rewrite_rule_set.value.rewrite_rule != null ? [rewrite_rule_set.value.rewrite_rule] : []
        content {
          dynamic "condition" {
            for_each = rewrite_rule.value.condition != null ? [rewrite_rule.value.condition] : []
            content {
              ignore_case = condition.value.ignore_case
              negate      = condition.value.negate
              pattern     = condition.value.pattern
              variable    = condition.value.variable
            }
          }
          name = rewrite_rule.value.name
          dynamic "request_header_configuration" {
            for_each = rewrite_rule.value.request_header_configuration != null ? [rewrite_rule.value.request_header_configuration] : []
            content {
              header_name  = request_header_configuration.value.header_name
              header_value = request_header_configuration.value.header_value
            }
          }
          dynamic "response_header_configuration" {
            for_each = rewrite_rule.value.response_header_configuration != null ? [rewrite_rule.value.response_header_configuration] : []
            content {
              header_name  = response_header_configuration.value.header_name
              header_value = response_header_configuration.value.header_value
            }
          }
          rule_sequence = rewrite_rule.value.rule_sequence
          dynamic "url" {
            for_each = rewrite_rule.value.url != null ? [rewrite_rule.value.url] : []
            content {
              components   = url.value.components
              path         = url.value.path
              query_string = url.value.query_string
              reroute      = url.value.reroute
            }
          }
        }
      }
    }
  }

  dynamic "ssl_certificate" {
    for_each = each.value.ssl_certificate != null ? [each.value.ssl_certificate] : []
    content {
      data                = ssl_certificate.value.data
      key_vault_secret_id = ssl_certificate.value.key_vault_secret_id
      name                = ssl_certificate.value.name
      password            = ssl_certificate.value.password
    }
  }

  dynamic "ssl_policy" {
    for_each = each.value.ssl_policy != null ? [each.value.ssl_policy] : []
    content {
      cipher_suites        = ssl_policy.value.cipher_suites
      disabled_protocols   = ssl_policy.value.disabled_protocols
      min_protocol_version = ssl_policy.value.min_protocol_version
      policy_name          = ssl_policy.value.policy_name
      policy_type          = ssl_policy.value.policy_type
    }
  }

  dynamic "ssl_profile" {
    for_each = each.value.ssl_profile != null ? [each.value.ssl_profile] : []
    content {
      name = ssl_profile.value.name
      dynamic "ssl_policy" {
        for_each = ssl_profile.value.ssl_policy != null ? [ssl_profile.value.ssl_policy] : []
        content {
          cipher_suites        = ssl_policy.value.cipher_suites
          disabled_protocols   = ssl_policy.value.disabled_protocols
          min_protocol_version = ssl_policy.value.min_protocol_version
          policy_name          = ssl_policy.value.policy_name
          policy_type          = ssl_policy.value.policy_type
        }
      }
      trusted_client_certificate_names     = ssl_profile.value.trusted_client_certificate_names
      verify_client_cert_issuer_dn         = ssl_profile.value.verify_client_cert_issuer_dn
      verify_client_certificate_revocation = ssl_profile.value.verify_client_certificate_revocation
    }
  }

  dynamic "trusted_client_certificate" {
    for_each = each.value.trusted_client_certificate != null ? [each.value.trusted_client_certificate] : []
    content {
      data = trusted_client_certificate.value.data
      name = trusted_client_certificate.value.name
    }
  }

  dynamic "trusted_root_certificate" {
    for_each = each.value.trusted_root_certificate != null ? [each.value.trusted_root_certificate] : []
    content {
      data                = trusted_root_certificate.value.data
      key_vault_secret_id = trusted_root_certificate.value.key_vault_secret_id
      name                = trusted_root_certificate.value.name
    }
  }

  dynamic "url_path_map" {
    for_each = each.value.url_path_map != null ? [each.value.url_path_map] : []
    content {
      default_backend_address_pool_name   = url_path_map.value.default_backend_address_pool_name
      default_backend_http_settings_name  = url_path_map.value.default_backend_http_settings_name
      default_redirect_configuration_name = url_path_map.value.default_redirect_configuration_name
      default_rewrite_rule_set_name       = url_path_map.value.default_rewrite_rule_set_name
      name                                = url_path_map.value.name
      path_rule {
        backend_address_pool_name   = url_path_map.value.path_rule.backend_address_pool_name
        backend_http_settings_name  = url_path_map.value.path_rule.backend_http_settings_name
        firewall_policy_id          = url_path_map.value.path_rule.firewall_policy_id
        name                        = url_path_map.value.path_rule.name
        paths                       = url_path_map.value.path_rule.paths
        redirect_configuration_name = url_path_map.value.path_rule.redirect_configuration_name
        rewrite_rule_set_name       = url_path_map.value.path_rule.rewrite_rule_set_name
      }
    }
  }

  dynamic "waf_configuration" {
    for_each = each.value.waf_configuration != null ? [each.value.waf_configuration] : []
    content {
      dynamic "disabled_rule_group" {
        for_each = waf_configuration.value.disabled_rule_group != null ? [waf_configuration.value.disabled_rule_group] : []
        content {
          rule_group_name = disabled_rule_group.value.rule_group_name
          rules           = disabled_rule_group.value.rules
        }
      }
      enabled = waf_configuration.value.enabled
      dynamic "exclusion" {
        for_each = waf_configuration.value.exclusion != null ? [waf_configuration.value.exclusion] : []
        content {
          match_variable          = exclusion.value.match_variable
          selector                = exclusion.value.selector
          selector_match_operator = exclusion.value.selector_match_operator
        }
      }
      file_upload_limit_mb     = waf_configuration.value.file_upload_limit_mb
      firewall_mode            = waf_configuration.value.firewall_mode
      max_request_body_size_kb = waf_configuration.value.max_request_body_size_kb
      request_body_check       = waf_configuration.value.request_body_check
      rule_set_type            = waf_configuration.value.rule_set_type
      rule_set_version         = waf_configuration.value.rule_set_version
    }
  }
}

