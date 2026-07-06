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
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.cors == null || (v.cors.allowed_origins == null || (length(v.cors.allowed_origins) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.cors == null || (v.cors.allowed_headers == null || (length(v.cors.allowed_headers) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_dicom_services : (
        v.cors == null || (v.cors.allowed_methods == null || (length(v.cors.allowed_methods) > 0))
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
  # --- Unconfirmed validation candidates, derived from azurerm_healthcare_dicom_service's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.DicomServiceName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: workspace_id
  #   source:    [from workspaces.ValidateWorkspaceID] !ok
  # path: workspace_id
  #   source:    [from workspaces.ValidateWorkspaceID] err != nil
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: encryption_key_url
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: storage.storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] !ok
  # path: storage.storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] err != nil
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

