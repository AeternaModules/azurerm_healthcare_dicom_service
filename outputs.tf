output "healthcare_dicom_services_authentication" {
  description = "Map of authentication values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.authentication }
}
output "healthcare_dicom_services_cors" {
  description = "Map of cors values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.cors }
}
output "healthcare_dicom_services_data_partitions_enabled" {
  description = "Map of data_partitions_enabled values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.data_partitions_enabled }
}
output "healthcare_dicom_services_encryption_key_url" {
  description = "Map of encryption_key_url values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.encryption_key_url }
}
output "healthcare_dicom_services_identity" {
  description = "Map of identity values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.identity }
}
output "healthcare_dicom_services_location" {
  description = "Map of location values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.location }
}
output "healthcare_dicom_services_name" {
  description = "Map of name values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.name }
}
output "healthcare_dicom_services_private_endpoint" {
  description = "Map of private_endpoint values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.private_endpoint }
}
output "healthcare_dicom_services_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.public_network_access_enabled }
}
output "healthcare_dicom_services_service_url" {
  description = "Map of service_url values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.service_url }
}
output "healthcare_dicom_services_storage" {
  description = "Map of storage values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.storage }
}
output "healthcare_dicom_services_tags" {
  description = "Map of tags values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.tags }
}
output "healthcare_dicom_services_workspace_id" {
  description = "Map of workspace_id values across all healthcare_dicom_services, keyed the same as var.healthcare_dicom_services"
  value       = { for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : k => v.workspace_id }
}

