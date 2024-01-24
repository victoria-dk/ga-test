@minLength(5)
@maxLength(24)
@description('StorageName must have min 5 chars and a max 24 chars')
param storageName string
param location string = 'norwayeast'

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
}
