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
    data_partitions_enabled       = optional(bool)
    encryption_key_url            = optional(string)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    cors = optional(object({
      allow_credentials  = optional(bool)
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
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.cors == null || (v.cors.allowed_origins == null || (alltrue([for x in v.cors.allowed_origins : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.cors == null || (v.cors.allowed_headers == null || (alltrue([for x in v.cors.allowed_headers : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.cors == null || (v.cors.allowed_methods == null || (alltrue([for x in v.cors.allowed_methods : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.cors == null || (v.cors.max_age_in_seconds == null || (v.cors.max_age_in_seconds >= 0 && v.cors.max_age_in_seconds <= 99998))
      )
    ])
    error_message = "must be between 0 and 99998"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.storage == null || (length(v.storage.file_system_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

