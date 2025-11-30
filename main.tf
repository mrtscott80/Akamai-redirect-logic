terraform {
  required_providers {
    akamai = {
      source = "akamai/akamai"
      version = "~> 3.0"
    }
  }
}

# 1. Define the Redirect Rule Logic
# This data source simulates how the rule looks in Akamai Property Manager
data "akamai_property_rules_builder" "my_redirect_rules" {
  rules_v2023_01_05 {
    name      = "default"
    is_secure = true
    
    # The Default Rule (Catch-all)
    children = [
      # OUR CUSTOM REDIRECT RULE
      {
        name = "Redirect Old Path"
        
        # Criteria: If the user visits /old-product
        criteria = [
          {
            name = "path"
            options = {
              match_operator = "MATCHES_ONE_OF"
              values         = ["/old-product", "/legacy-item"]
              match_case_sensitive = false
            }
          }
        ]
        
        # Behavior: Redirect to /new-product
        behaviors = [
          {
            name = "redirect"
            options = {
              mobile_default_choice = "DEFAULT"
              destination_protocol  = "HTTPS"
              destination_hostname  = "SAME_AS_REQUEST"
              destination_path      = "OTHER"
              destination_path_other = "/new-product"
              query_string          = "APPEND"
              response_code         = 301 # Permanent Redirect
            }
          }
        ]
      }
    ]
  }
}

# 2. Output the JSON
# This allows you to see the generated JSON structure without needing active Akamai credentials
output "akamai_rule_json" {
  value = data.akamai_property_rules_builder.my_redirect_rules.json
}
