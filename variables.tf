variable "application_gateways" {
  description = <<EOT
Map of application_gateways, attributes below
Required:
    - location
    - name
    - resource_group_name
    - backend_address_pool (block):
        - fqdns (optional)
        - ip_addresses (optional)
        - name (required)
    - backend_http_settings (block):
        - affinity_cookie_name (optional)
        - authentication_certificate (optional, block):
            - name (required)
        - connection_draining (optional, block):
            - drain_timeout_sec (required)
            - enabled (required)
        - cookie_based_affinity (required)
        - dedicated_backend_connection_enabled (optional)
        - host_name (optional)
        - name (required)
        - path (optional)
        - pick_host_name_from_backend_address (optional)
        - port (required)
        - probe_name (optional)
        - protocol (required)
        - request_timeout (optional)
        - trusted_root_certificate_names (optional)
    - frontend_ip_configuration (block):
        - name (required)
        - private_ip_address (optional)
        - private_ip_address_allocation (optional)
        - private_link_configuration_name (optional)
        - public_ip_address_id (optional)
        - subnet_id (optional)
    - frontend_port (block):
        - name (required)
        - port (required)
    - gateway_ip_configuration (block):
        - name (required)
        - subnet_id (required)
    - http_listener (block):
        - custom_error_configuration (optional, block):
            - custom_error_page_url (required)
            - status_code (required)
        - firewall_policy_id (optional)
        - frontend_ip_configuration_name (required)
        - frontend_port_name (required)
        - host_name (optional)
        - host_names (optional)
        - name (required)
        - protocol (required)
        - require_sni (optional)
        - ssl_certificate_name (optional)
        - ssl_profile_name (optional)
    - request_routing_rule (block):
        - backend_address_pool_name (optional)
        - backend_http_settings_name (optional)
        - http_listener_name (required)
        - name (required)
        - priority (optional)
        - redirect_configuration_name (optional)
        - rewrite_rule_set_name (optional)
        - rule_type (required)
        - url_path_map_name (optional)
    - sku (block):
        - capacity (optional)
        - name (required)
        - tier (required)
Optional:
    - enable_http2
    - fips_enabled
    - firewall_policy_id
    - force_firewall_policy_association
    - tags
    - zones
    - authentication_certificate (block):
        - data (required)
        - name (required)
    - autoscale_configuration (block):
        - max_capacity (optional)
        - min_capacity (required)
    - custom_error_configuration (block):
        - custom_error_page_url (required)
        - status_code (required)
    - global (block):
        - request_buffering_enabled (required)
        - response_buffering_enabled (required)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - private_link_configuration (block):
        - ip_configuration (required, block):
            - name (required)
            - primary (required)
            - private_ip_address (optional)
            - private_ip_address_allocation (required)
            - subnet_id (required)
        - name (required)
    - probe (block):
        - host (optional)
        - interval (required)
        - match (optional, block):
            - body (optional)
            - status_code (required)
        - minimum_servers (optional)
        - name (required)
        - path (required)
        - pick_host_name_from_backend_http_settings (optional)
        - port (optional)
        - protocol (required)
        - timeout (required)
        - unhealthy_threshold (required)
    - redirect_configuration (block):
        - include_path (optional)
        - include_query_string (optional)
        - name (required)
        - redirect_type (required)
        - target_listener_name (optional)
        - target_url (optional)
    - rewrite_rule_set (block):
        - name (required)
        - rewrite_rule (optional, block):
            - condition (optional, block):
                - ignore_case (optional)
                - negate (optional)
                - pattern (required)
                - variable (required)
            - name (required)
            - request_header_configuration (optional, block):
                - header_name (required)
                - header_value (required)
            - response_header_configuration (optional, block):
                - header_name (required)
                - header_value (required)
            - rule_sequence (required)
            - url (optional, block):
                - components (optional)
                - path (optional)
                - query_string (optional)
                - reroute (optional)
    - ssl_certificate (block):
        - data (optional)
        - key_vault_secret_id (optional)
        - name (required)
        - password (optional)
    - ssl_policy (block):
        - cipher_suites (optional)
        - disabled_protocols (optional)
        - min_protocol_version (optional)
        - policy_name (optional)
        - policy_type (optional)
    - ssl_profile (block):
        - name (required)
        - ssl_policy (optional, block):
            - cipher_suites (optional)
            - disabled_protocols (optional)
            - min_protocol_version (optional)
            - policy_name (optional)
            - policy_type (optional)
        - trusted_client_certificate_names (optional)
        - verify_client_cert_issuer_dn (optional)
        - verify_client_certificate_revocation (optional)
    - trusted_client_certificate (block):
        - data (required)
        - name (required)
    - trusted_root_certificate (block):
        - data (optional)
        - key_vault_secret_id (optional)
        - name (required)
    - url_path_map (block):
        - default_backend_address_pool_name (optional)
        - default_backend_http_settings_name (optional)
        - default_redirect_configuration_name (optional)
        - default_rewrite_rule_set_name (optional)
        - name (required)
        - path_rule (required, block):
            - backend_address_pool_name (optional)
            - backend_http_settings_name (optional)
            - firewall_policy_id (optional)
            - name (required)
            - paths (required)
            - redirect_configuration_name (optional)
            - rewrite_rule_set_name (optional)
    - waf_configuration (block):
        - disabled_rule_group (optional, block):
            - rule_group_name (required)
            - rules (optional)
        - enabled (required)
        - exclusion (optional, block):
            - match_variable (required)
            - selector (optional)
            - selector_match_operator (optional)
        - file_upload_limit_mb (optional)
        - firewall_mode (required)
        - max_request_body_size_kb (optional)
        - request_body_check (optional)
        - rule_set_type (optional)
        - rule_set_version (required)
EOT

  type = map(object({
    location                          = string
    name                              = string
    resource_group_name               = string
    enable_http2                      = optional(bool)
    fips_enabled                      = optional(bool)
    firewall_policy_id                = optional(string)
    force_firewall_policy_association = optional(bool)
    tags                              = optional(map(string))
    zones                             = optional(set(string))
    backend_address_pool = object({
      fqdns        = optional(set(string))
      ip_addresses = optional(set(string))
      name         = string
    })
    backend_http_settings = list(object({
      affinity_cookie_name = optional(string)
      authentication_certificate = optional(object({
        name = string
      }))
      connection_draining = optional(object({
        drain_timeout_sec = number
        enabled           = bool
      }))
      cookie_based_affinity                = string
      dedicated_backend_connection_enabled = optional(bool) # Default: false
      host_name                            = optional(string)
      name                                 = string
      path                                 = optional(string)
      pick_host_name_from_backend_address  = optional(bool) # Default: false
      port                                 = number
      probe_name                           = optional(string)
      protocol                             = string
      request_timeout                      = optional(number) # Default: 30
      trusted_root_certificate_names       = optional(list(string))
    }))
    frontend_ip_configuration = list(object({
      name                            = string
      private_ip_address              = optional(string)
      private_ip_address_allocation   = optional(string) # Default: "Dynamic"
      private_link_configuration_name = optional(string)
      public_ip_address_id            = optional(string)
      subnet_id                       = optional(string)
    }))
    frontend_port = object({
      name = string
      port = number
    })
    gateway_ip_configuration = list(object({
      name      = string
      subnet_id = string
    }))
    http_listener = object({
      custom_error_configuration = optional(object({
        custom_error_page_url = string
        status_code           = string
      }))
      firewall_policy_id             = optional(string)
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      host_name                      = optional(string)
      host_names                     = optional(set(string))
      name                           = string
      protocol                       = string
      require_sni                    = optional(bool)
      ssl_certificate_name           = optional(string)
      ssl_profile_name               = optional(string)
    })
    request_routing_rule = list(object({
      backend_address_pool_name   = optional(string)
      backend_http_settings_name  = optional(string)
      http_listener_name          = string
      name                        = string
      priority                    = optional(number)
      redirect_configuration_name = optional(string)
      rewrite_rule_set_name       = optional(string)
      rule_type                   = string
      url_path_map_name           = optional(string)
    }))
    sku = object({
      capacity = optional(number)
      name     = string
      tier     = string
    })
    trusted_root_certificate = optional(object({
      data                = optional(string)
      key_vault_secret_id = optional(string)
      name                = string
    }))
    trusted_client_certificate = optional(object({
      data = string
      name = string
    }))
    ssl_profile = optional(object({
      name = string
      ssl_policy = optional(object({
        cipher_suites        = optional(list(string))
        disabled_protocols   = optional(list(string))
        min_protocol_version = optional(string)
        policy_name          = optional(string)
        policy_type          = optional(string)
      }))
      trusted_client_certificate_names     = optional(list(string))
      verify_client_cert_issuer_dn         = optional(bool) # Default: false
      verify_client_certificate_revocation = optional(string)
    }))
    ssl_policy = optional(object({
      cipher_suites        = optional(list(string))
      disabled_protocols   = optional(list(string))
      min_protocol_version = optional(string)
      policy_name          = optional(string)
      policy_type          = optional(string)
    }))
    ssl_certificate = optional(object({
      data                = optional(string)
      key_vault_secret_id = optional(string)
      name                = string
      password            = optional(string)
    }))
    rewrite_rule_set = optional(object({
      name = string
      rewrite_rule = optional(object({
        condition = optional(object({
          ignore_case = optional(bool) # Default: false
          negate      = optional(bool) # Default: false
          pattern     = string
          variable    = string
        }))
        name = string
        request_header_configuration = optional(object({
          header_name  = string
          header_value = string
        }))
        response_header_configuration = optional(object({
          header_name  = string
          header_value = string
        }))
        rule_sequence = number
        url = optional(object({
          components   = optional(string)
          path         = optional(string)
          query_string = optional(string)
          reroute      = optional(bool) # Default: false
        }))
      }))
    }))
    redirect_configuration = optional(object({
      include_path         = optional(bool) # Default: false
      include_query_string = optional(bool) # Default: false
      name                 = string
      redirect_type        = string
      target_listener_name = optional(string)
      target_url           = optional(string)
    }))
    global = optional(object({
      request_buffering_enabled  = bool
      response_buffering_enabled = bool
    }))
    private_link_configuration = optional(object({
      ip_configuration = list(object({
        name                          = string
        primary                       = bool
        private_ip_address            = optional(string)
        private_ip_address_allocation = string
        subnet_id                     = string
      }))
      name = string
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    url_path_map = optional(object({
      default_backend_address_pool_name   = optional(string)
      default_backend_http_settings_name  = optional(string)
      default_redirect_configuration_name = optional(string)
      default_rewrite_rule_set_name       = optional(string)
      name                                = string
      path_rule = object({
        backend_address_pool_name   = optional(string)
        backend_http_settings_name  = optional(string)
        firewall_policy_id          = optional(string)
        name                        = string
        paths                       = list(string)
        redirect_configuration_name = optional(string)
        rewrite_rule_set_name       = optional(string)
      })
    }))
    custom_error_configuration = optional(object({
      custom_error_page_url = string
      status_code           = string
    }))
    autoscale_configuration = optional(object({
      max_capacity = optional(number)
      min_capacity = number
    }))
    authentication_certificate = optional(object({
      data = string
      name = string
    }))
    probe = optional(object({
      host     = optional(string)
      interval = number
      match = optional(object({
        body        = optional(string)
        status_code = list(string)
      }))
      minimum_servers                           = optional(number) # Default: 0
      name                                      = string
      path                                      = string
      pick_host_name_from_backend_http_settings = optional(bool) # Default: false
      port                                      = optional(number)
      protocol                                  = string
      timeout                                   = number
      unhealthy_threshold                       = number
    }))
    waf_configuration = optional(object({
      disabled_rule_group = optional(object({
        rule_group_name = string
        rules           = optional(list(number))
      }))
      enabled = bool
      exclusion = optional(object({
        match_variable          = string
        selector                = optional(string)
        selector_match_operator = optional(string)
      }))
      file_upload_limit_mb     = optional(number) # Default: 100
      firewall_mode            = string
      max_request_body_size_kb = optional(number) # Default: 128
      request_body_check       = optional(bool)   # Default: true
      rule_set_type            = optional(string) # Default: "OWASP"
      rule_set_version         = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.backend_http_settings) >= 1
      )
    ])
    error_message = "Each backend_http_settings list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.frontend_ip_configuration) >= 1
      )
    ])
    error_message = "Each frontend_ip_configuration list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.gateway_ip_configuration) <= 2
      )
    ])
    error_message = "Each gateway_ip_configuration list must contain at most 2 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.request_routing_rule) >= 1
      )
    ])
    error_message = "Each request_routing_rule list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.private_link_configuration.ip_configuration) >= 1
      )
    ])
    error_message = "Each ip_configuration list must contain at least 1 items"
  }
}

