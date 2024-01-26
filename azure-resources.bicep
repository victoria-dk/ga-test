param location string = 'norwayeast'
param storageName string = 'vicniltestapp'

param namePrefix string = 'vicnil'

targetScope = 'resourceGroup'

//how to consume modules

module storage 'modules/storage.bicep' = {
  name: storageName
  params: {
    storageName: storageName
    location: location
  }
}

module appPlanDeploy 'modules/servicePlan.bicep' = {
  name: '${namePrefix}-appPlanDeploy'
  params: {
    namePrefix: namePrefix
    location: location
  }
}

module deployWebsite 'modules/webApp.bicep' = {
  name: '${namePrefix}-deploy-website'
  params: {
    location: location
    appPlanId: appPlanDeploy.outputs.planId
  }
}
output siteUrl string = deployWebsite.outputs.siteUrl

/* param location string = 'norwayeast'
param storageName string = 'bicevnpstorage'

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
} */
