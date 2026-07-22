resource "azurerm_resource_group" "rg" {
name = var.resource_group_name
location = var.location

tags = {
Environment = "Test"
ManagedBy = "Terraform"
}
}

resource "azurerm_container_registry" "acr" {
name = var.acr_name
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location

sku = "Premium"
admin_enabled = false
}

 # Import Ubuntu Imgae from Docker Hub
resource "null_resource" "ubuntu_image_import" {

  depends_on = [
    azurerm_container_registry.acr
  ]

  provisioner "local-exec" {
    command = <<EOF
az acr import \
  --name ${azurerm_container_registry.acr.name} \
  --source ${var.base_image} \
  --image ${var.target_image}
EOF
  }
}