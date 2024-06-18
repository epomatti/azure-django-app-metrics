output "log_workspace_id" {
  value = azurerm_log_analytics_workspace.default.id
}

output "appi_connection_string" {
  value     = azurerm_application_insights.default.connection_string
  sensitive = true
}
