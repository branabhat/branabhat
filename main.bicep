@minLength(3)
@maxLength(24)
@description('provide a name for storage account. Use only lower case letters and numbers.The name must be unique across Azure.')
param storageName string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'examplevnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource exampleStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: 'australiaeast'
  sku: {
    name:  'Standard_LRS'
  }
  kind: 'StorageV2'
}
