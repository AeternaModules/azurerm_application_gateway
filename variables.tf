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
  # --- Unconfirmed validation candidates, derived from azurerm_application_gateway's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: zones[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: backend_address_pool.fqdns[*]
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: backend_address_pool.ip_addresses[*]
  #   source:    [from validate.IPv4Address] !ok
  # path: backend_address_pool.ip_addresses[*]
  #   source:    [from validate.IPv4Address] four == nil
  # path: backend_http_settings.cookie_based_affinity
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: backend_http_settings.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: backend_http_settings.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: backend_http_settings.affinity_cookie_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: backend_http_settings.connection_draining.drain_timeout_sec
  #   condition: value >= 1 && value <= 3600
  #   message:   must be between 1 and 3600
  # path: backend_http_settings.host_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: backend_http_settings.path
  #   source:    validation.StringStartsWithOneOf(...) - no translation rule yet, add one
  # path: backend_http_settings.request_timeout
  #   condition: value >= 1 && value <= 86400
  #   message:   must be between 1 and 86400
  # path: backend_http_settings.sni_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: backend_http_settings.trusted_root_certificate_names[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: backend.name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: backend.name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: backend.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: backend.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: backend.host_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: backend.probe_name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: backend.probe_name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: backend.timeout_in_seconds
  #   condition: value >= 1 && value <= 86400
  #   message:   must be between 1 and 86400
  # path: backend.trusted_root_certificate_names[*]
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: backend.trusted_root_certificate_names[*]
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: frontend_ip_configuration.private_ip_address_allocation
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: frontend_port.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: gateway_ip_configuration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: gateway_ip_configuration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: http_listener.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: http_listener.host_names[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: http_listener.custom_error_configuration.status_code
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: http_listener.firewall_policy_id
  #   source:    [from webapplicationfirewallpolicies.ValidateApplicationGatewayWebApplicationFirewallPolicyID] !ok
  # path: http_listener.firewall_policy_id
  #   source:    [from webapplicationfirewallpolicies.ValidateApplicationGatewayWebApplicationFirewallPolicyID] err != nil
  # path: listener.name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: listener.name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: listener.frontend_ip_configuration_name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: listener.frontend_ip_configuration_name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: listener.frontend_port_name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: listener.frontend_port_name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: listener.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: listener.host_names[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: listener.ssl_certificate_name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: listener.ssl_certificate_name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: listener.ssl_profile_name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: listener.ssl_profile_name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: private_link_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: private_link_configuration.ip_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: private_link_configuration.ip_configuration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: private_link_configuration.ip_configuration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: private_link_configuration.ip_configuration.private_ip_address_allocation
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: request_routing_rule.rule_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: request_routing_rule.redirect_configuration_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: request_routing_rule.rewrite_rule_set_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: request_routing_rule.priority
  #   condition: value >= 1 && value <= 20000
  #   message:   must be between 1 and 20000
  # path: routing_rule.name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: routing_rule.name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: routing_rule.backend_address_pool_name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: routing_rule.backend_address_pool_name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: routing_rule.backend_name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: routing_rule.backend_name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: routing_rule.listener_name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: routing_rule.listener_name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: routing_rule.priority
  #   condition: value >= 1 && value <= 20000
  #   message:   must be between 1 and 20000
  # path: redirect_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: redirect_configuration.redirect_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: redirect_configuration.target_listener_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: redirect_configuration.target_url
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: autoscale_configuration.min_capacity
  #   condition: value >= 0 && value <= 100
  #   message:   must be between 0 and 100
  # path: autoscale_configuration.max_capacity
  #   condition: value >= 2 && value <= 125
  #   message:   must be between 2 and 125
  # path: sku.name
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: sku.tier
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: authentication_certificate.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: authentication_certificate.data
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: trusted_root_certificate.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: trusted_root_certificate.data
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: trusted_root_certificate.key_vault_secret_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: trusted_root_certificate.key_vault_secret_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
  # path: ssl_policy.disabled_protocols[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ssl_policy.policy_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ssl_policy.cipher_suites[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ssl_policy.min_protocol_version
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: probe.interval
  #   condition: value >= 1 && value <= 86400
  #   message:   must be between 1 and 86400
  # path: probe.name
  #   source:    [from networkValidate.ApplicationGatewayName] !ok
  # path: probe.name
  #   source:    [from networkValidate.ApplicationGatewayName] !matched
  # path: probe.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: probe.timeout
  #   condition: value >= 1 && value <= 86400
  #   message:   must be between 1 and 86400
  # path: probe.unhealthy_threshold
  #   condition: value >= 1 && value <= 20
  #   message:   must be between 1 and 20
  # path: probe.host
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: probe.path
  #   source:    validation.StringStartsWithOneOf(...) - no translation rule yet, add one
  # path: probe.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: rewrite_rule_set.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: rewrite_rule_set.rewrite_rule.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: rewrite_rule_set.rewrite_rule.rule_sequence
  #   condition: value >= 1 && value <= 1000
  #   message:   must be between 1 and 1000
  # path: rewrite_rule_set.rewrite_rule.url.components
  #   condition: contains(["path_only", "query_string_only"], value)
  #   message:   must be one of: path_only, query_string_only
  # path: ssl_certificate.data
  #   source:    validation.StringIsBase64(...) - no translation rule yet, add one
  # path: ssl_certificate.key_vault_secret_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: ssl_certificate.key_vault_secret_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
  # path: ssl_profile.trusted_client_certificate_names[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: ssl_profile.verify_client_certificate_revocation
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ssl_profile.ssl_policy.disabled_protocols[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ssl_profile.ssl_policy.policy_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ssl_profile.ssl_policy.cipher_suites[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ssl_profile.ssl_policy.min_protocol_version
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: url_path_map.default_redirect_configuration_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: url_path_map.default_rewrite_rule_set_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: url_path_map.path_rule.redirect_configuration_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: url_path_map.path_rule.rewrite_rule_set_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: url_path_map.path_rule.firewall_policy_id
  #   source:    [from webapplicationfirewallpolicies.ValidateApplicationGatewayWebApplicationFirewallPolicyID] !ok
  # path: url_path_map.path_rule.firewall_policy_id
  #   source:    [from webapplicationfirewallpolicies.ValidateApplicationGatewayWebApplicationFirewallPolicyID] err != nil
  # path: waf_configuration.firewall_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: waf_configuration.rule_set_type
  #   source:    networkValidate.ValidateWebApplicationFirewallPolicyRuleSetType (unresolved: func ValidateWebApplicationFirewallPolicyRuleSetType not found in /home/dan/code/public/terraform-provider-azurerm/internal/services/network/validate)
  # path: waf_configuration.rule_set_version
  #   source:    networkValidate.ValidateWebApplicationFirewallPolicyRuleSetVersion (unresolved: func ValidateWebApplicationFirewallPolicyRuleSetVersion not found in /home/dan/code/public/terraform-provider-azurerm/internal/services/network/validate)
  # path: waf_configuration.file_upload_limit_mb
  #   condition: value >= 1 && value <= 750
  #   message:   must be between 1 and 750
  # path: waf_configuration.max_request_body_size_kb
  #   condition: value >= 1 && value <= 128
  #   message:   must be between 1 and 128
  # path: waf_configuration.disabled_rule_group.rule_group_name
  #   source:    networkValidate.ValidateWebApplicationFirewallPolicyRuleGroupName (unresolved: func ValidateWebApplicationFirewallPolicyRuleGroupName not found in /home/dan/code/public/terraform-provider-azurerm/internal/services/network/validate)
  # path: waf_configuration.disabled_rule_group.rules[*]
  #   condition: value >= 1
  #   message:   must be at least 1
  # path: waf_configuration.exclusion.match_variable
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: waf_configuration.exclusion.selector_match_operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: waf_configuration.exclusion.selector
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: firewall_policy_id
  #   source:    [from webapplicationfirewallpolicies.ValidateApplicationGatewayWebApplicationFirewallPolicyID] !ok
  # path: firewall_policy_id
  #   source:    [from webapplicationfirewallpolicies.ValidateApplicationGatewayWebApplicationFirewallPolicyID] err != nil
  # path: custom_error_configuration.status_code
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

