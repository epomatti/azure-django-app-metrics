terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }
}

resource "random_string" "workload" {
  length  = 5
  special = false
  lower   = true
}

locals {
  affix    = random_string.workload.result
  workload = "contoso-${local.affix}"
}

resource "azurerm_resource_group" "default" {
  name     = "rg-${local.workload}"
  location = var.location
}

module "monitor" {
  source              = "./modules/monitor"
  workload            = local.workload
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name

  logs_internet_ingestion_enabled = var.logs_internet_ingestion_enabled
  logs_internet_query_enabled     = var.logs_internet_query_enabled

  appi_internet_ingestion_enabled = var.appi_internet_ingestion_enabled
  appi_internet_query_enabled     = var.appi_internet_query_enabled
}
