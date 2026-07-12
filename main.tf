resource "azurerm_application_gateway" "application_gateways" {
  for_each = var.application_gateways

  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  enable_http2                      = each.value.enable_http2
  fips_enabled                      = each.value.fips_enabled
  firewall_policy_id                = each.value.firewall_policy_id
  force_firewall_policy_association = each.value.force_firewall_policy_association
  http2_enabled                     = each.value.http2_enabled
  tags                              = each.value.tags
  zones                             = each.value.zones

  dynamic "backend_address_pool" {
    for_each = each.value.backend_address_pool
    content {
      fqdns        = backend_address_pool.value.fqdns
      ip_addresses = backend_address_pool.value.ip_addresses
      name         = backend_address_pool.value.name
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
      name                            = frontend_ip_configuration.value.name
      private_ip_address              = frontend_ip_configuration.value.private_ip_address
      private_ip_address_allocation   = frontend_ip_configuration.value.private_ip_address_allocation
      private_link_configuration_name = frontend_ip_configuration.value.private_link_configuration_name
      public_ip_address_id            = frontend_ip_configuration.value.public_ip_address_id
      subnet_id                       = frontend_ip_configuration.value.subnet_id
    }
  }

  dynamic "frontend_port" {
    for_each = each.value.frontend_port
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }

  dynamic "gateway_ip_configuration" {
    for_each = each.value.gateway_ip_configuration
    content {
      name      = gateway_ip_configuration.value.name
      subnet_id = gateway_ip_configuration.value.subnet_id
    }
  }

  sku {
    capacity = each.value.sku.capacity
    name     = each.value.sku.name
    tier     = each.value.sku.tier
  }

  dynamic "authentication_certificate" {
    for_each = each.value.authentication_certificate != null ? each.value.authentication_certificate : []
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

  dynamic "backend" {
    for_each = each.value.backend != null ? each.value.backend : []
    content {
      client_ip_preservation_enabled = backend.value.client_ip_preservation_enabled
      host_name                      = backend.value.host_name
      name                           = backend.value.name
      port                           = backend.value.port
      probe_name                     = backend.value.probe_name
      protocol                       = backend.value.protocol
      timeout_in_seconds             = backend.value.timeout_in_seconds
      trusted_root_certificate_names = backend.value.trusted_root_certificate_names
    }
  }

  dynamic "backend_http_settings" {
    for_each = each.value.backend_http_settings != null ? each.value.backend_http_settings : []
    content {
      affinity_cookie_name = backend_http_settings.value.affinity_cookie_name
      dynamic "authentication_certificate" {
        for_each = backend_http_settings.value.authentication_certificate != null ? backend_http_settings.value.authentication_certificate : []
        content {
          name = authentication_certificate.value.name
        }
      }
      certificate_chain_validation_enabled = backend_http_settings.value.certificate_chain_validation_enabled
      dynamic "connection_draining" {
        for_each = backend_http_settings.value.connection_draining != null ? [backend_http_settings.value.connection_draining] : []
        content {
          drain_timeout_sec = connection_draining.value.drain_timeout_sec
          enabled           = connection_draining.value.enabled
        }
      }
      cookie_based_affinity                = backend_http_settings.value.cookie_based_affinity
      dedicated_backend_connection_enabled = backend_http_settings.value.dedicated_backend_connection_enabled
      host_name                            = backend_http_settings.value.host_name
      name                                 = backend_http_settings.value.name
      path                                 = backend_http_settings.value.path
      pick_host_name_from_backend_address  = backend_http_settings.value.pick_host_name_from_backend_address
      port                                 = backend_http_settings.value.port
      probe_name                           = backend_http_settings.value.probe_name
      protocol                             = backend_http_settings.value.protocol
      request_timeout                      = backend_http_settings.value.request_timeout
      sni_name                             = backend_http_settings.value.sni_name
      sni_validation_enabled               = backend_http_settings.value.sni_validation_enabled
      trusted_root_certificate_names       = backend_http_settings.value.trusted_root_certificate_names
    }
  }

  dynamic "custom_error_configuration" {
    for_each = each.value.custom_error_configuration != null ? each.value.custom_error_configuration : []
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

  dynamic "http_listener" {
    for_each = each.value.http_listener != null ? each.value.http_listener : []
    content {
      dynamic "custom_error_configuration" {
        for_each = http_listener.value.custom_error_configuration != null ? http_listener.value.custom_error_configuration : []
        content {
          custom_error_page_url = custom_error_configuration.value.custom_error_page_url
          status_code           = custom_error_configuration.value.status_code
        }
      }
      firewall_policy_id             = http_listener.value.firewall_policy_id
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      host_name                      = http_listener.value.host_name
      host_names                     = http_listener.value.host_names
      name                           = http_listener.value.name
      protocol                       = http_listener.value.protocol
      require_sni                    = http_listener.value.require_sni
      ssl_certificate_name           = http_listener.value.ssl_certificate_name
      ssl_profile_name               = http_listener.value.ssl_profile_name
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "listener" {
    for_each = each.value.listener != null ? each.value.listener : []
    content {
      frontend_ip_configuration_name = listener.value.frontend_ip_configuration_name
      frontend_port_name             = listener.value.frontend_port_name
      host_names                     = listener.value.host_names
      name                           = listener.value.name
      protocol                       = listener.value.protocol
      ssl_certificate_name           = listener.value.ssl_certificate_name
      ssl_profile_name               = listener.value.ssl_profile_name
    }
  }

  dynamic "private_link_configuration" {
    for_each = each.value.private_link_configuration != null ? each.value.private_link_configuration : []
    content {
      dynamic "ip_configuration" {
        for_each = private_link_configuration.value.ip_configuration
        content {
          name                          = ip_configuration.value.name
          primary                       = ip_configuration.value.primary
          private_ip_address            = ip_configuration.value.private_ip_address
          private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
          subnet_id                     = ip_configuration.value.subnet_id
        }
      }
      name = private_link_configuration.value.name
    }
  }

  dynamic "probe" {
    for_each = each.value.probe != null ? each.value.probe : []
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
      proxy_protocol_header_enabled             = probe.value.proxy_protocol_header_enabled
      timeout                                   = probe.value.timeout
      unhealthy_threshold                       = probe.value.unhealthy_threshold
    }
  }

  dynamic "redirect_configuration" {
    for_each = each.value.redirect_configuration != null ? each.value.redirect_configuration : []
    content {
      include_path         = redirect_configuration.value.include_path
      include_query_string = redirect_configuration.value.include_query_string
      name                 = redirect_configuration.value.name
      redirect_type        = redirect_configuration.value.redirect_type
      target_listener_name = redirect_configuration.value.target_listener_name
      target_url           = redirect_configuration.value.target_url
    }
  }

  dynamic "request_routing_rule" {
    for_each = each.value.request_routing_rule != null ? each.value.request_routing_rule : []
    content {
      backend_address_pool_name   = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name  = request_routing_rule.value.backend_http_settings_name
      http_listener_name          = request_routing_rule.value.http_listener_name
      name                        = request_routing_rule.value.name
      priority                    = request_routing_rule.value.priority
      redirect_configuration_name = request_routing_rule.value.redirect_configuration_name
      rewrite_rule_set_name       = request_routing_rule.value.rewrite_rule_set_name
      rule_type                   = request_routing_rule.value.rule_type
      url_path_map_name           = request_routing_rule.value.url_path_map_name
    }
  }

  dynamic "rewrite_rule_set" {
    for_each = each.value.rewrite_rule_set != null ? each.value.rewrite_rule_set : []
    content {
      name = rewrite_rule_set.value.name
      dynamic "rewrite_rule" {
        for_each = rewrite_rule_set.value.rewrite_rule != null ? rewrite_rule_set.value.rewrite_rule : []
        content {
          dynamic "condition" {
            for_each = rewrite_rule.value.condition != null ? rewrite_rule.value.condition : []
            content {
              ignore_case = condition.value.ignore_case
              negate      = condition.value.negate
              pattern     = condition.value.pattern
              variable    = condition.value.variable
            }
          }
          name = rewrite_rule.value.name
          dynamic "request_header_configuration" {
            for_each = rewrite_rule.value.request_header_configuration != null ? rewrite_rule.value.request_header_configuration : []
            content {
              header_name  = request_header_configuration.value.header_name
              header_value = request_header_configuration.value.header_value
            }
          }
          dynamic "response_header_configuration" {
            for_each = rewrite_rule.value.response_header_configuration != null ? rewrite_rule.value.response_header_configuration : []
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

  dynamic "routing_rule" {
    for_each = each.value.routing_rule != null ? each.value.routing_rule : []
    content {
      backend_address_pool_name = routing_rule.value.backend_address_pool_name
      backend_name              = routing_rule.value.backend_name
      listener_name             = routing_rule.value.listener_name
      name                      = routing_rule.value.name
      priority                  = routing_rule.value.priority
    }
  }

  dynamic "ssl_certificate" {
    for_each = each.value.ssl_certificate != null ? each.value.ssl_certificate : []
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
    for_each = each.value.ssl_profile != null ? each.value.ssl_profile : []
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
      verify_client_certificate_issuer_dn  = ssl_profile.value.verify_client_certificate_issuer_dn
      verify_client_certificate_revocation = ssl_profile.value.verify_client_certificate_revocation
    }
  }

  dynamic "trusted_client_certificate" {
    for_each = each.value.trusted_client_certificate != null ? each.value.trusted_client_certificate : []
    content {
      data = trusted_client_certificate.value.data
      name = trusted_client_certificate.value.name
    }
  }

  dynamic "trusted_root_certificate" {
    for_each = each.value.trusted_root_certificate != null ? each.value.trusted_root_certificate : []
    content {
      data                = trusted_root_certificate.value.data
      key_vault_secret_id = trusted_root_certificate.value.key_vault_secret_id
      name                = trusted_root_certificate.value.name
    }
  }

  dynamic "url_path_map" {
    for_each = each.value.url_path_map != null ? each.value.url_path_map : []
    content {
      default_backend_address_pool_name   = url_path_map.value.default_backend_address_pool_name
      default_backend_http_settings_name  = url_path_map.value.default_backend_http_settings_name
      default_redirect_configuration_name = url_path_map.value.default_redirect_configuration_name
      default_rewrite_rule_set_name       = url_path_map.value.default_rewrite_rule_set_name
      name                                = url_path_map.value.name
      dynamic "path_rule" {
        for_each = url_path_map.value.path_rule
        content {
          backend_address_pool_name   = path_rule.value.backend_address_pool_name
          backend_http_settings_name  = path_rule.value.backend_http_settings_name
          firewall_policy_id          = path_rule.value.firewall_policy_id
          name                        = path_rule.value.name
          paths                       = path_rule.value.paths
          redirect_configuration_name = path_rule.value.redirect_configuration_name
          rewrite_rule_set_name       = path_rule.value.rewrite_rule_set_name
        }
      }
    }
  }

  dynamic "waf_configuration" {
    for_each = each.value.waf_configuration != null ? [each.value.waf_configuration] : []
    content {
      dynamic "disabled_rule_group" {
        for_each = waf_configuration.value.disabled_rule_group != null ? waf_configuration.value.disabled_rule_group : []
        content {
          rule_group_name = disabled_rule_group.value.rule_group_name
          rules           = disabled_rule_group.value.rules
        }
      }
      enabled = waf_configuration.value.enabled
      dynamic "exclusion" {
        for_each = waf_configuration.value.exclusion != null ? waf_configuration.value.exclusion : []
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

