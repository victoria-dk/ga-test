@description('This is a description for namePrefix')
param namePrefix string
param location string = resourceGroup().location
param sku string = 'B1'

resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: '${namePrefix}-website'
  location: location
  kind: 'ubuntu'
  sku: {
    name: sku
  }
}
output planId string = appServicePlan.id
