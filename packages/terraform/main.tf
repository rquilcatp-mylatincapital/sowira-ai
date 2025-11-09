terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "sowira_ai" {
  name     = "sowira-ai"
  location = "East US"
}

resource "azurerm_service_plan" "sowira_ai" {
  name                = "sowira-ai-service-plan"
  resource_group_name = azurerm_resource_group.sowira_ai.name
  location            = azurerm_resource_group.sowira_ai.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "portal_company" {
  name                = "sowira-ai-portal-company"
  resource_group_name = azurerm_resource_group.sowira_ai.name
  location            = azurerm_service_plan.sowira_ai.location
  service_plan_id     = azurerm_service_plan.sowira_ai.id

  site_config {
    always_on = false
  }
}

resource "azurerm_linux_web_app" "portal_talent" {
  name                = "sowira-ai-portal-talent"
  resource_group_name = azurerm_resource_group.sowira_ai.name
  location            = azurerm_service_plan.sowira_ai.location
  service_plan_id     = azurerm_service_plan.sowira_ai.id

  site_config {
    always_on = false
  }
}

resource "azurerm_linux_web_app" "portal_api" {
  name                = "sowira-ai-portal-api"
  resource_group_name = azurerm_resource_group.sowira_ai.name
  location            = azurerm_service_plan.sowira_ai.location
  service_plan_id     = azurerm_service_plan.sowira_ai.id

  site_config {
    always_on = false
  }
}
