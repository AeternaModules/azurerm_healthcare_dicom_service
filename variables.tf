variable "healthcare_dicom_services" {
  description = <<EOT
Map of healthcare_dicom_services, attributes below
Required:
    - location
    - name
    - workspace_id
Optional:
    - data_partitions_enabled
    - encryption_key_url
    - public_network_access_enabled
    - tags
    - cors (block):
        - allow_credentials (optional)
        - allowed_headers (optional)
        - allowed_methods (optional)
        - allowed_origins (optional)
        - max_age_in_seconds (optional)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - storage (block):
        - file_system_name (required)
        - storage_account_id (required)
EOT

  type = map(object({
    location                      = string
    name                          = string
    workspace_id                  = string
    data_partitions_enabled       = optional(bool) # Default: false
    encryption_key_url            = optional(string)
    public_network_access_enabled = optional(bool) # Default: true
    tags                          = optional(map(string))
    cors = optional(object({
      allow_credentials  = optional(bool) # Default: false
      allowed_headers    = optional(list(string))
      allowed_methods    = optional(list(string))
      allowed_origins    = optional(list(string))
      max_age_in_seconds = optional(number)
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    storage = optional(object({
      file_system_name   = string
      storage_account_id = string
    }))
  }))
}

