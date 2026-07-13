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
    - sku (block):
        - capacity (optional)
        - name (required)
        - tier (required)
Optional:
    - enable_http2
    - fips_enabled
    - firewall_policy_id
    - force_firewall_policy_association
    - http2_enabled
    - tags
    - zones
    - authentication_certificate (block):
        - data (required)
        - name (required)
    - autoscale_configuration (block):
        - max_capacity (optional)
        - min_capacity (required)
    - backend (block):
        - client_ip_preservation_enabled (optional)
        - host_name (optional)
        - name (required)
        - port (required)
        - probe_name (optional)
        - protocol (required)
        - timeout_in_seconds (optional)
        - trusted_root_certificate_names (optional)
    - backend_http_settings (block):
        - affinity_cookie_name (optional)
        - authentication_certificate (optional, block):
            - name (required)
        - certificate_chain_validation_enabled (optional)
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
        - sni_name (optional)
        - sni_validation_enabled (optional)
        - trusted_root_certificate_names (optional)
    - custom_error_configuration (block):
        - custom_error_page_url (required)
        - status_code (required)
    - global (block):
        - request_buffering_enabled (required)
        - response_buffering_enabled (required)
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
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - listener (block):
        - frontend_ip_configuration_name (required)
        - frontend_port_name (required)
        - host_names (optional)
        - name (required)
        - protocol (required)
        - ssl_certificate_name (optional)
        - ssl_profile_name (optional)
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
        - path (optional)
        - pick_host_name_from_backend_http_settings (optional)
        - port (optional)
        - protocol (required)
        - proxy_protocol_header_enabled (optional)
        - timeout (required)
        - unhealthy_threshold (required)
    - redirect_configuration (block):
        - include_path (optional)
        - include_query_string (optional)
        - name (required)
        - redirect_type (required)
        - target_listener_name (optional)
        - target_url (optional)
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
    - routing_rule (block):
        - backend_address_pool_name (required)
        - backend_name (required)
        - listener_name (required)
        - name (required)
        - priority (required)
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
        - verify_client_certificate_issuer_dn (optional)
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
    http2_enabled                     = optional(bool)
    tags                              = optional(map(string))
    zones                             = optional(set(string))
    backend_address_pool = list(object({
      fqdns        = optional(set(string))
      ip_addresses = optional(set(string))
      name         = string
    }))
    frontend_ip_configuration = list(object({
      name                            = string
      private_ip_address              = optional(string)
      private_ip_address_allocation   = optional(string)
      private_link_configuration_name = optional(string)
      public_ip_address_id            = optional(string)
      subnet_id                       = optional(string)
    }))
    frontend_port = list(object({
      name = string
      port = number
    }))
    gateway_ip_configuration = list(object({
      name      = string
      subnet_id = string
    }))
    sku = object({
      capacity = optional(number)
      name     = string
      tier     = string
    })
    trusted_root_certificate = optional(list(object({
      data                = optional(string)
      key_vault_secret_id = optional(string)
      name                = string
    })))
    trusted_client_certificate = optional(list(object({
      data = string
      name = string
    })))
    ssl_profile = optional(list(object({
      name = string
      ssl_policy = optional(object({
        cipher_suites        = optional(list(string))
        disabled_protocols   = optional(list(string))
        min_protocol_version = optional(string)
        policy_name          = optional(string)
        policy_type          = optional(string)
      }))
      trusted_client_certificate_names     = optional(list(string))
      verify_client_cert_issuer_dn         = optional(bool)
      verify_client_certificate_issuer_dn  = optional(bool)
      verify_client_certificate_revocation = optional(string)
    })))
    ssl_policy = optional(object({
      cipher_suites        = optional(list(string))
      disabled_protocols   = optional(list(string))
      min_protocol_version = optional(string)
      policy_name          = optional(string)
      policy_type          = optional(string)
    }))
    ssl_certificate = optional(list(object({
      data                = optional(string)
      key_vault_secret_id = optional(string)
      name                = string
      password            = optional(string)
    })))
    routing_rule = optional(list(object({
      backend_address_pool_name = string
      backend_name              = string
      listener_name             = string
      name                      = string
      priority                  = number
    })))
    rewrite_rule_set = optional(list(object({
      name = string
      rewrite_rule = optional(list(object({
        condition = optional(list(object({
          ignore_case = optional(bool)
          negate      = optional(bool)
          pattern     = string
          variable    = string
        })))
        name = string
        request_header_configuration = optional(list(object({
          header_name  = string
          header_value = string
        })))
        response_header_configuration = optional(list(object({
          header_name  = string
          header_value = string
        })))
        rule_sequence = number
        url = optional(object({
          components   = optional(string)
          path         = optional(string)
          query_string = optional(string)
          reroute      = optional(bool)
        }))
      })))
    })))
    request_routing_rule = optional(list(object({
      backend_address_pool_name   = optional(string)
      backend_http_settings_name  = optional(string)
      http_listener_name          = string
      name                        = string
      priority                    = optional(number)
      redirect_configuration_name = optional(string)
      rewrite_rule_set_name       = optional(string)
      rule_type                   = string
      url_path_map_name           = optional(string)
    })))
    redirect_configuration = optional(list(object({
      include_path         = optional(bool)
      include_query_string = optional(bool)
      name                 = string
      redirect_type        = string
      target_listener_name = optional(string)
      target_url           = optional(string)
    })))
    probe = optional(list(object({
      host     = optional(string)
      interval = number
      match = optional(object({
        body        = optional(string)
        status_code = list(string)
      }))
      minimum_servers                           = optional(number)
      name                                      = string
      path                                      = optional(string)
      pick_host_name_from_backend_http_settings = optional(bool)
      port                                      = optional(number)
      protocol                                  = string
      proxy_protocol_header_enabled             = optional(bool)
      timeout                                   = number
      unhealthy_threshold                       = number
    })))
    listener = optional(list(object({
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      host_names                     = optional(set(string))
      name                           = string
      protocol                       = string
      ssl_certificate_name           = optional(string)
      ssl_profile_name               = optional(string)
    })))
    url_path_map = optional(list(object({
      default_backend_address_pool_name   = optional(string)
      default_backend_http_settings_name  = optional(string)
      default_redirect_configuration_name = optional(string)
      default_rewrite_rule_set_name       = optional(string)
      name                                = string
      path_rule = list(object({
        backend_address_pool_name   = optional(string)
        backend_http_settings_name  = optional(string)
        firewall_policy_id          = optional(string)
        name                        = string
        paths                       = list(string)
        redirect_configuration_name = optional(string)
        rewrite_rule_set_name       = optional(string)
      }))
    })))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    http_listener = optional(list(object({
      custom_error_configuration = optional(list(object({
        custom_error_page_url = string
        status_code           = string
      })))
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
    })))
    global = optional(object({
      request_buffering_enabled  = bool
      response_buffering_enabled = bool
    }))
    custom_error_configuration = optional(list(object({
      custom_error_page_url = string
      status_code           = string
    })))
    backend_http_settings = optional(list(object({
      affinity_cookie_name = optional(string)
      authentication_certificate = optional(list(object({
        name = string
      })))
      certificate_chain_validation_enabled = optional(bool)
      connection_draining = optional(object({
        drain_timeout_sec = number
        enabled           = bool
      }))
      cookie_based_affinity                = string
      dedicated_backend_connection_enabled = optional(bool)
      host_name                            = optional(string)
      name                                 = string
      path                                 = optional(string)
      pick_host_name_from_backend_address  = optional(bool)
      port                                 = number
      probe_name                           = optional(string)
      protocol                             = string
      request_timeout                      = optional(number)
      sni_name                             = optional(string)
      sni_validation_enabled               = optional(bool)
      trusted_root_certificate_names       = optional(list(string))
    })))
    backend = optional(list(object({
      client_ip_preservation_enabled = optional(bool)
      host_name                      = optional(string)
      name                           = string
      port                           = number
      probe_name                     = optional(string)
      protocol                       = string
      timeout_in_seconds             = optional(number)
      trusted_root_certificate_names = optional(list(string))
    })))
    autoscale_configuration = optional(object({
      max_capacity = optional(number)
      min_capacity = number
    }))
    authentication_certificate = optional(list(object({
      data = string
      name = string
    })))
    private_link_configuration = optional(list(object({
      ip_configuration = list(object({
        name                          = string
        primary                       = bool
        private_ip_address            = optional(string)
        private_ip_address_allocation = string
        subnet_id                     = string
      }))
      name = string
    })))
    waf_configuration = optional(object({
      disabled_rule_group = optional(list(object({
        rule_group_name = string
        rules           = optional(list(number))
      })))
      enabled = bool
      exclusion = optional(list(object({
        match_variable          = string
        selector                = optional(string)
        selector_match_operator = optional(string)
      })))
      file_upload_limit_mb     = optional(number)
      firewall_mode            = string
      max_request_body_size_kb = optional(number)
      request_body_check       = optional(bool)
      rule_set_type            = optional(string)
      rule_set_version         = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.backend_address_pool) >= 1
      )
    ])
    error_message = "Each backend_address_pool list must contain at least 1 items"
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
        length(v.frontend_port) >= 1
      )
    ])
    error_message = "Each frontend_port list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.gateway_ip_configuration) >= 1 && length(v.gateway_ip_configuration) <= 2
      )
    ])
    error_message = "Each gateway_ip_configuration list must contain between 1 and 2 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.private_link_configuration == null || alltrue([for item in v.private_link_configuration : (length(item.ip_configuration) >= 1)])
      )
    ])
    error_message = "Each ip_configuration list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.url_path_map == null || alltrue([for item in v.url_path_map : (length(item.path_rule) >= 1)])
      )
    ])
    error_message = "Each path_rule list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.zones == null || (alltrue([for x in v.zones : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend_http_settings == null || alltrue([for item in v.backend_http_settings : (item.affinity_cookie_name == null || (length(item.affinity_cookie_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend_http_settings == null || alltrue([for item in v.backend_http_settings : (item.connection_draining == null || (item.connection_draining.drain_timeout_sec >= 1 && item.connection_draining.drain_timeout_sec <= 3600))])
      )
    ])
    error_message = "must be between 1 and 3600"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend_http_settings == null || alltrue([for item in v.backend_http_settings : (item.host_name == null || (length(item.host_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend_http_settings == null || alltrue([for item in v.backend_http_settings : (item.path == null || (anytrue([for p in ["/"] : startswith(item.path, p)])))])
      )
    ])
    error_message = "must start with one of the allowed prefixes"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend_http_settings == null || alltrue([for item in v.backend_http_settings : (item.request_timeout == null || (item.request_timeout >= 1 && item.request_timeout <= 86400))])
      )
    ])
    error_message = "must be between 1 and 86400"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend_http_settings == null || alltrue([for item in v.backend_http_settings : (item.sni_name == null || (length(item.sni_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend_http_settings == null || alltrue([for item in v.backend_http_settings : (item.trusted_root_certificate_names == null || (alltrue([for x in item.trusted_root_certificate_names : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend == null || alltrue([for item in v.backend : (item.host_name == null || (length(item.host_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.backend == null || alltrue([for item in v.backend : (item.timeout_in_seconds == null || (item.timeout_in_seconds >= 1 && item.timeout_in_seconds <= 86400))])
      )
    ])
    error_message = "must be between 1 and 86400"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.http_listener == null || alltrue([for item in v.http_listener : (item.host_names == null || (alltrue([for x in item.host_names : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.listener == null || alltrue([for item in v.listener : (item.host_names == null || (alltrue([for x in item.host_names : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.private_link_configuration == null || alltrue([for item in v.private_link_configuration : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.private_link_configuration == null || alltrue([for item in v.private_link_configuration : (alltrue([for item in item.ip_configuration : (length(item.name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.request_routing_rule == null || alltrue([for item in v.request_routing_rule : (item.redirect_configuration_name == null || (length(item.redirect_configuration_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.request_routing_rule == null || alltrue([for item in v.request_routing_rule : (item.rewrite_rule_set_name == null || (length(item.rewrite_rule_set_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.request_routing_rule == null || alltrue([for item in v.request_routing_rule : (item.priority == null || (item.priority >= 1 && item.priority <= 20000))])
      )
    ])
    error_message = "must be between 1 and 20000"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.routing_rule == null || alltrue([for item in v.routing_rule : (item.priority >= 1 && item.priority <= 20000)])
      )
    ])
    error_message = "must be between 1 and 20000"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.redirect_configuration == null || alltrue([for item in v.redirect_configuration : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.redirect_configuration == null || alltrue([for item in v.redirect_configuration : (item.target_listener_name == null || (length(item.target_listener_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.redirect_configuration == null || alltrue([for item in v.redirect_configuration : (item.target_url == null || (length(item.target_url) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.autoscale_configuration == null || (v.autoscale_configuration.min_capacity >= 0 && v.autoscale_configuration.min_capacity <= 100)
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.autoscale_configuration == null || (v.autoscale_configuration.max_capacity == null || (v.autoscale_configuration.max_capacity >= 2 && v.autoscale_configuration.max_capacity <= 125))
      )
    ])
    error_message = "must be between 2 and 125"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.authentication_certificate == null || alltrue([for item in v.authentication_certificate : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.authentication_certificate == null || alltrue([for item in v.authentication_certificate : (length(item.data) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.trusted_root_certificate == null || alltrue([for item in v.trusted_root_certificate : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.trusted_root_certificate == null || alltrue([for item in v.trusted_root_certificate : (item.data == null || (length(item.data) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.probe == null || alltrue([for item in v.probe : (item.interval >= 1 && item.interval <= 86400)])
      )
    ])
    error_message = "must be between 1 and 86400"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.probe == null || alltrue([for item in v.probe : (item.timeout >= 1 && item.timeout <= 86400)])
      )
    ])
    error_message = "must be between 1 and 86400"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.probe == null || alltrue([for item in v.probe : (item.unhealthy_threshold >= 1 && item.unhealthy_threshold <= 20)])
      )
    ])
    error_message = "must be between 1 and 20"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.probe == null || alltrue([for item in v.probe : (item.host == null || (length(item.host) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.probe == null || alltrue([for item in v.probe : (item.path == null || (anytrue([for p in ["/"] : startswith(item.path, p)])))])
      )
    ])
    error_message = "must start with one of the allowed prefixes"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.rewrite_rule_set == null || alltrue([for item in v.rewrite_rule_set : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.rewrite_rule_set == null || alltrue([for item in v.rewrite_rule_set : (item.rewrite_rule == null || alltrue([for item in item.rewrite_rule : (length(item.name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.rewrite_rule_set == null || alltrue([for item in v.rewrite_rule_set : (item.rewrite_rule == null || alltrue([for item in item.rewrite_rule : (item.rule_sequence >= 1 && item.rule_sequence <= 1000)]))])
      )
    ])
    error_message = "must be between 1 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.rewrite_rule_set == null || alltrue([for item in v.rewrite_rule_set : (item.rewrite_rule == null || alltrue([for item in item.rewrite_rule : (item.url == null || (item.url.components == null || (contains(["path_only", "query_string_only"], item.url.components))))]))])
      )
    ])
    error_message = "must be one of: path_only, query_string_only"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.ssl_certificate == null || alltrue([for item in v.ssl_certificate : (item.data == null || (can(base64decode(item.data))))])
      )
    ])
    error_message = "must be valid base64"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.ssl_profile == null || alltrue([for item in v.ssl_profile : (item.trusted_client_certificate_names == null || (alltrue([for x in item.trusted_client_certificate_names : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.url_path_map == null || alltrue([for item in v.url_path_map : (item.default_redirect_configuration_name == null || (length(item.default_redirect_configuration_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.url_path_map == null || alltrue([for item in v.url_path_map : (item.default_rewrite_rule_set_name == null || (length(item.default_rewrite_rule_set_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.url_path_map == null || alltrue([for item in v.url_path_map : (alltrue([for item in item.path_rule : (item.redirect_configuration_name == null || (length(item.redirect_configuration_name) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.url_path_map == null || alltrue([for item in v.url_path_map : (alltrue([for item in item.path_rule : (item.rewrite_rule_set_name == null || (length(item.rewrite_rule_set_name) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.waf_configuration == null || (v.waf_configuration.file_upload_limit_mb == null || (v.waf_configuration.file_upload_limit_mb >= 1 && v.waf_configuration.file_upload_limit_mb <= 750))
      )
    ])
    error_message = "must be between 1 and 750"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.waf_configuration == null || (v.waf_configuration.max_request_body_size_kb == null || (v.waf_configuration.max_request_body_size_kb >= 1 && v.waf_configuration.max_request_body_size_kb <= 128))
      )
    ])
    error_message = "must be between 1 and 128"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.waf_configuration == null || (v.waf_configuration.disabled_rule_group == null || alltrue([for item in v.waf_configuration.disabled_rule_group : (item.rules == null || (alltrue([for x in item.rules : x >= 1])))]))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.waf_configuration == null || (v.waf_configuration.exclusion == null || alltrue([for item in v.waf_configuration.exclusion : (item.selector == null || (length(item.selector) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.application_gateways : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 84 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

