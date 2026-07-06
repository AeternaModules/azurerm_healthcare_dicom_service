output "healthcare_dicom_services" {
  description = "All healthcare_dicom_service resources"
  value       = azurerm_healthcare_dicom_service.healthcare_dicom_services
}
output "healthcare_dicom_services_authentication" {
  description = "List of authentication values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.authentication]
}
output "healthcare_dicom_services_cors" {
  description = "List of cors values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.cors]
}
output "healthcare_dicom_services_data_partitions_enabled" {
  description = "List of data_partitions_enabled values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.data_partitions_enabled]
}
output "healthcare_dicom_services_encryption_key_url" {
  description = "List of encryption_key_url values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.encryption_key_url]
}
output "healthcare_dicom_services_identity" {
  description = "List of identity values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.identity]
}
output "healthcare_dicom_services_location" {
  description = "List of location values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.location]
}
output "healthcare_dicom_services_name" {
  description = "List of name values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.name]
}
output "healthcare_dicom_services_private_endpoint" {
  description = "List of private_endpoint values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.private_endpoint]
}
output "healthcare_dicom_services_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.public_network_access_enabled]
}
output "healthcare_dicom_services_service_url" {
  description = "List of service_url values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.service_url]
}
output "healthcare_dicom_services_storage" {
  description = "List of storage values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.storage]
}
output "healthcare_dicom_services_tags" {
  description = "List of tags values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.tags]
}
output "healthcare_dicom_services_workspace_id" {
  description = "List of workspace_id values across all healthcare_dicom_services"
  value       = [for k, v in azurerm_healthcare_dicom_service.healthcare_dicom_services : v.workspace_id]
}

