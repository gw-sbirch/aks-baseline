targetScope = 'resourceGroup'

/*** PARAMETERS ***/

@allowed([
  'australiaeast'
  'canadacentral'
  'centralus'
  'eastus'
  'eastus2'
  'westus2'
  'francecentral'
  'germanywestcentral'
  'northeurope'
  'southafricanorth'
  'southcentralus'
  'uksouth'
  'westeurope'
  'japaneast'
  'southeastasia'
])
@description('The hub\'s regional affinity. All resources tied to this hub will also be homed in this region. The network team maintains this approved regional list which is a subset of zones with Availability Zone support.')
param location string = 'eastus2'

@description('Optional. A /24 to contain the regional firewall, management, and gateway subnet. Defaults to 10.200.0.0/24')
@maxLength(18)
@minLength(10)
param hubVirtualNetworkAddressSpace string = '10.200.0.0/24'

@description('Optional. A /27 under the virtual network address space for our regional On-Prem Gateway. Defaults to 10.200.0.64/27')
@maxLength(18)
@minLength(10)
param hubVirtualNetworkGatewaySubnetAddressSpace string = '10.200.0.64/27'

@description('Optional. A /26 under the virtual network address space for regional Azure Bastion. Defaults to 10.200.0.128/26')
@maxLength(18)
@minLength(10)
param hubVirtualNetworkBastionSubnetAddressSpace string = '10.200.0.128/26'

/*** RESOURCES ***/

// This Log Analytics workspace stores logs from the regional hub network, its spokes, and bastion.
// Log analytics is a regional resource, as such there will be one workspace per hub (region)
resource laHub 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: 'la-hub-${location}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
    forceCmkForQuery: false
    features: {
      disableLocalAuth: true
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: -1
    }
  }
}

resource laHub_diagnosticsSettings 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'default'
  scope: laHub
  properties: {
    workspaceId: laHub.id
    logs: [
      {
        categoryGroup: 'audit'
        enabled: true
      }
    ]
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
      }
    ]
  }
}

// NSG around the Azure Bastion Subnet.
resource nsgBastionSubnet 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: 'nsg-${location}-bastion'
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowWebExperienceInbound'
        properties: {
          description: 'Allow our users in. Update this to be as restrictive as possible.'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: 'Internet'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowControlPlaneInbound'
        properties: {
          description: 'Service Requirement. Allow control plane access. Regional Tag not yet supported.'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: 'GatewayManager'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowHealthProbesInbound'
        properties: {
          description: 'Service Requirement. Allow Health Probes.'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: 'AzureLoadBalancer'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 120
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowBastionHostToHostInbound'
        properties: {
          description: 'Service Requirement. Allow Required Host to Host Communication.'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRanges: [
            '8080'
            '5701'
          ]
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 130
          direction: 'Inbound'
        }
      }
      {
        name: 'DenyAllInbound'
        properties: {
          description: 'No further inbound traffic allowed.'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Deny'
          priority: 1000
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowSshToVnetOutbound'
        properties: {
          description: 'Allow SSH out to the virtual network'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '22'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 100
          direction: 'Outbound'
        }
      }
      {
        name: 'AllowRdpToVnetOutbound'
        properties: {
          description: 'Allow RDP out to the virtual network'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '3389'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 110
          direction: 'Outbound'
        }
      }
      {
        name: 'AllowControlPlaneOutbound'
        properties: {
          description: 'Required for control plane outbound. Regional prefix not yet supported'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '443'
          destinationAddressPrefix: 'AzureCloud'
          access: 'Allow'
          priority: 120
          direction: 'Outbound'
        }
      }
      {
        name: 'AllowBastionHostToHostOutbound'
        properties: {
          description: 'Service Requirement. Allow Required Host to Host Communication.'
          protocol: '*'
          sourcePortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationPortRanges: [
            '8080'
            '5701'
          ]
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 130
          direction: 'Outbound'
        }
      }
      {
        name: 'AllowBastionCertificateValidationOutbound'
        properties: {
          description: 'Service Requirement. Allow Required Session and Certificate Validation.'
          protocol: '*'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '80'
          destinationAddressPrefix: 'Internet'
          access: 'Allow'
          priority: 140
          direction: 'Outbound'
        }
      }
      {
        name: 'DenyAllOutbound'
        properties: {
          description: 'No further outbound traffic allowed.'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Deny'
          priority: 1000
          direction: 'Outbound'
        }
      }
    ]
  }
}

resource nsgBastionSubnet_diagnosticSettings 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  scope: nsgBastionSubnet
  name: 'default'
  properties: {
    workspaceId: laHub.id
    logs: [
      {
        categoryGroup: 'allLogs'
        enabled: true
      }
    ]
  }
}

// The regional hub network
resource vnetHub 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'vnet-${location}-hub'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        hubVirtualNetworkAddressSpace
      ]
    }
    subnets: [
      {
        name: 'AzureFirewallSubnet'
        properties: {
          addressPrefix: '10.200.0.0/26'
        }
      }
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefix: hubVirtualNetworkGatewaySubnetAddressSpace
        }
      }
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: hubVirtualNetworkBastionSubnetAddressSpace
          networkSecurityGroup: {
            id: nsgBastionSubnet.id
          }
        }
      }
    ]
  }

  resource azureFirewallSubnet 'subnets' existing = {
    name: 'AzureFirewallSubnet'
  }
}

resource vnetHub_diagnosticSettings 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  scope: vnetHub
  name: 'default'
  properties: {
    workspaceId: laHub.id
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
      }
    ]
  }
}

// Allocate three IP addresses to the firewall
var numFirewallIpAddressesToAssign = 3
resource pipsAzureFirewall 'Microsoft.Network/publicIPAddresses@2021-05-01' = [for i in range(0, numFirewallIpAddressesToAssign): {
  name: 'pip-fw-${location}-${padLeft(i, 2, '0')}'
  location: location
  sku: {
    name: 'Standard'
  }
  zones: [
    '1'
    '2'
    '3'
  ]
  properties: {
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    publicIPAddressVersion: 'IPv4'
  }
}]

resource pipAzureFirewall_diagnosticSetting 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = [for i in range(0, numFirewallIpAddressesToAssign): {
  name: 'default'
  scope: pipsAzureFirewall[i]
  properties: {
    workspaceId: laHub.id
    logs: [
      {
        categoryGroup: 'audit'
        enabled: true
      }
    ]
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
      }
    ]
  }
}]

// This holds IP addresses of known nodepool subnets in spokes.
resource ipgNodepoolSubnet 'Microsoft.Network/ipGroups@2021-05-01' = {
  name: 'ipg-${location}-AksNodepools'
  location: location
  properties: {
    ipAddresses: ['${reference('/subscriptions/b091e1a3-5af3-482d-b245-5734af84f707/resourceGroups/rgp-uks-ei-spoke-dev/providers/Microsoft.Network/virtualNetworks/vnet-spoke-BU0001A0008-00/subnets/snet-clusternodes', '2020-05-01').addressPrefix}']
  }
}


/*** OUTPUTS ***/

output hubVnetId string = vnetHub.id
