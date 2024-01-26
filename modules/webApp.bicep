param location string = 'norwayeast'
param namePrefix string = 'vicnil'
param appPlanId string

resource webApplication 'Microsoft.Web/sites@2023-01-01' = {
  name: '${namePrefix}-site'
  location: location
  properties: {
    serverFarmId: appPlanId
    httpsOnly: true
  }
}

output siteUrl string = webApplication.properties.hostNames[0]
