data "azuread_client_config" "current" {}

resource "azuread_application" "python" {
  display_name = "python-${var.workload}"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "python" {
  client_id = azuread_application.python.client_id
  owners    = [data.azuread_client_config.current.object_id]
}

resource "azurerm_role_assignment" "appi" {
  scope                = var.storage_account_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.mlw.principal_id
}
