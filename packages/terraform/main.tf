terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}

resource "azuread_application" "sowira_ai" {
  display_name = "sowira-ai"
}

resource "azuread_service_principal" "sowira_ai" {
  application_id = azuread_application.sowira_ai.application_id
}

resource "azuread_service_principal_password" "sowira_ai" {
  service_principal_id = azuread_service_principal.sowira_ai.id
}

resource "azurerm_role_assignment" "sowira_ai" {
  scope                = azurerm_resource_group.sowira_ai.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.sowira_ai.id
}

output "azure_credentials" {
  value = jsonencode({
    clientId            = azuread_application.sowira_ai.application_id
    clientSecret        = azuread_service_principal_password.sowira_ai.value
    subscriptionId      = data.azurerm_client_config.current.subscription_id
    tenantId            = data.azurerm_client_config.current.tenant_id
    activeDirectoryEndpointUrl = "https://login.microsoftonline.com"
    resourceManagerEndpointUrl = "https://management.azure.com/"
    activeDirectoryGraphResourceId = "https://graph.windows.net/"
    sqlManagementEndpointUrl = "https://management.core.windows.net:8443/"
    galleryEndpointUrl = "https://gallery.azure.com/"
    managementEndpointUrl = "https://management.core.windows.net/"
  })
  sensitive = true
}

data "azurerm_client_config" "current" {
}


resource "azurerm_resource_group" "sowira_ai" {
  name     = "sowira-ai"
  location = "centralus"
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
