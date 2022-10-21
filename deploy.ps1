$TENANTID_AZURERBAC_AKS_BASELINE = $(az account show --query tenantId -o tsv)
$AADOBJECTID_GROUP_CLUSTERADMIN_AKS_BASELINE="761bf8de-c2d6-48bf-8634-17a7773e7251"
$CLUSTER_RESOURCE_GROUP="rgp-uks-ei-cluster-dev"
$HUB_RESOURCE_GROUP="rgp-uks-ei-hub-dev"
$SPOKE_RESOURCE_GROUP="rgp-uks-ei-spoke-dev"

$AADOBJECTID_GROUP_CLUSTERADMIN_AKS_BASELINE="45581ccc-b855-4100-afa9-25543c263d7f"
$AADOBJECTID_GROUP_A0008_READER_AKS_BASELINE=$AADOBJECTID_GROUP_CLUSTERADMIN_AKS_BASELINE

#### Certs
$APP_GATEWAY_LISTENER_CERTIFICATE_AKS_BASELINE="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"
$AKS_INGRESS_CONTROLLER_CERTIFICATE_BASE64_AKS_BASELINE="LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURkekNDQWwrZ0F3SUJBZ0lVVHNYOXFkT0lUREg4QkNLS2xUeENVd0lUclAwd0RRWUpLb1pJaHZjTkFRRUwKQlFBd1N6RXJNQ2tHQTFVRUF3d2lLaTVoYTNNdGFXNW5jbVZ6Y3k1bGFTMWtaWFl1WTNWeWJIbDNkWEpzZVM1dApaVEVjTUJvR0ExVUVDZ3dUUTI5dWRHOXpieUJCUzFNZ1NXNW5jbVZ6Y3pBZUZ3MHlNakV3TVRNeE1ESXdNekZhCkZ3MHlNekV3TVRNeE1ESXdNekZhTUVzeEt6QXBCZ05WQkFNTUlpb3VZV3R6TFdsdVozSmxjM011WldrdFpHVjIKTG1OMWNteDVkM1Z5YkhrdWJXVXhIREFhQmdOVkJBb01FME52Ym5SdmMyOGdRVXRUSUVsdVozSmxjM013Z2dFaQpNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUJEd0F3Z2dFS0FvSUJBUURZMWdUQWFBRjZ4Q1dLL2JyemlqVmpvYWZOCmNOK1NmKzZlelBoOE5lcHFkaDg2VitiZXZiVkw2Z3BzSVBRQyt1cVVwM0hqekpQNXEwdklPSUlXeEpOYVZJZkwKd25YUVlTZnpNREc2UUp5bU9kdjhVTitXTG1uSVZtTVJQQjZrNTA2ZHJuOWxoRzRNTVJjSnptb0tYV3JGSGdWVQpZVkVyR3dEZGhSbmhsV25ieE9DZjNQZWI5Z2w2T0pxa3RTT0sza21lNTB2WDVsMEMwbWRyTnQvdEFxZ3RqLzE0CmdTVlpBZFZRYkJHT0N4N2JTU25ITXVVL241UjFKRm1MOFlSbU1oZHlMbUViNTMyOHpWSlZmelQxT1R6WE10aWYKL3hCVWxsa2VFSzB5NDRGQmVSbHpiM0RHUHNiZnVyNWhpSjhTYXlTRUpDN2p1dWNrK3NNZnpVZklVK1d4QWdNQgpBQUdqVXpCUk1CMEdBMVVkRGdRV0JCU1hBNnB0L05XdXBXQUIvNTFoU25sNG9hMC9OakFmQmdOVkhTTUVHREFXCmdCU1hBNnB0L05XdXBXQUIvNTFoU25sNG9hMC9OakFQQmdOVkhSTUJBZjhFQlRBREFRSC9NQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFESVJGeFVYTld3VTZBRmFoWURtMjBrWjh1b3ZDTmViRkQxRGJNNFRPWnVmZ0V1Rzc0bwpQSi90TGQ0K2ljTk05Y2hLNWlib0F6SFRndVFXQy9JbGxIakk1SWdNM21xcmczekJkVDgxb0dHeVhERUJnU1ZiCmxZcHMzd0d5MklEMVRyTVpHSmdqYUxTMFNPREpxNHJoT0UvV2NRem9BR3FHQXZzblhaVXlJZ2dDZFByOHc5VVEKTFlyUER6K1ZuMDR1Z2MrWmxTWWtVL1R5WE5qNGQ2VURDNDBuUDlXNHBXWmoyUnJBK25OYW9renNvWVJ3anQzcApJWDBZenE2TEwweSszZFZDL3ZYcFB5WWo4anBNdnlma1NZaVM4bnQwb2kyd3M4TGU1eGpNVVN5cmE5d0ZscHJzCjZSTDM4clVxS3lBS0JiRnhSTDNwaXpFV3RQVFpxd2ZwOW4zMQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
$DOMAIN_NAME_AKS_BASELINE="ei-dev.curlywurly.me"
####

$PrimaryRegion="centralus"
$SecondaryRegion="eastus2"

az group create --location "$PrimaryRegion" --name $HUB_RESOURCE_GROUP --tags 'Publicly Accessible=No' 'Project=Email Interceptor' 'Expiration Date=Never' 'Owner=Cloud Team' 'Project=Email Interceptor' 'Delete=No'
az group create --location "$PrimaryRegion" --name $SPOKE_RESOURCE_GROUP --tags 'Publicly Accessible=No' 'Project=Email Interceptor' 'Expiration Date=Never' 'Owner=Cloud Team' 'Project=Email Interceptor' 'Delete=No'
az group create --location "$SecondaryRegion" --name $CLUSTER_RESOURCE_GROUP --tags 'Publicly Accessible=No' 'Project=Email Interceptor' 'Expiration Date=Never' 'Owner=Cloud Team' 'Project=Email Interceptor' 'Delete=No'

# $features = (az feature list -o table --query "[?name=='Microsoft.ContainerService/AKS-AzureDefender' || name=='Microsoft.ContainerService/EnableWorkloadIdentityPreview'].{Name:name,State:properties.state}")

# if ($features.Count -eq 4)
# {
#     Write-Host "az plugins already registered"
# }
# else 
# {

# ## For Firewall basic:

#     az feature register --namespace "Microsoft.Network" -n AzureFirewallBasic

#     Write-Host "Registering az plugins"
#     az feature register --namespace "Microsoft.ContainerService" -n "AKS-AzureDefender"
#     az feature register --namespace "Microsoft.ContainerService" -n "EnableWorkloadIdentityPreview"
# }

# $features = (az feature list -o table --query "[?name=='Microsoft.ContainerService/AKS-AzureDefender' || name=='Microsoft.Network/AzureFirewallBasic' || name=='Microsoft.ContainerService/EnableWorkloadIdentityPreview'].{Name:name,State:properties.state}")
# while ($features.Where({ $_.Contains('Registering') }, 'First').Count -gt 0)
# {
#     Write-Host "The feature is still registering"
# $features = (az feature list -o table --query "[?name=='Microsoft.ContainerService/AKS-AzureDefender' || name=='Microsoft.Network/AzureFirewallBasic' || name=='Microsoft.ContainerService/EnableWorkloadIdentityPreview'].{Name:name,State:properties.state}")
# }

# az provider register --namespace Microsoft.Network
# az provider register --namespace Microsoft.ContainerService


# if (Test-Path -Path "aks-baseline") {
#     Write-Host "Repo already downloaded"
# }
# else {
#     git clone https://github.com/mspnp/aks-baseline.git
# }


# cd aks-baseline

az deployment group create -g $HUB_RESOURCE_GROUP -f networking/hub-default.bicep -p location=$PrimaryRegion
$firewallSubnetIP = $(az deployment group show -g $HUB_RESOURCE_GROUP -n hub-default --query properties.outputs.firewallSubnetIP.value -o tsv)

$RESOURCEID_VNET_HUB=$(az deployment group show -g $HUB_RESOURCE_GROUP -n hub-default --query properties.outputs.hubVnetId.value -o tsv)
if ($null -eq $RESOURCEID_VNET_HUB)
{
    throw "Could not locate vnet hub";
    return;
}

Write-Host $RESOURCEID_VNET_HUB

az deployment group create -g $SPOKE_RESOURCE_GROUP -f networking/spoke-BU0001A0008.bicep -p location=$PrimaryRegion hubVnetResourceId="$RESOURCEID_VNET_HUB" firewallSubnetIP="$firewallSubnetIP"
az deployment group create -g $HUB_RESOURCE_GROUP -f networking/hub-regionA.bicep -p location=$PrimaryRegion

# Bootstrapping

az login -t $TENANTID_AZURERBAC_AKS_BASELINE --allow-no-subscriptions
$TENANTID_K8SRBAC_AKS_BASELINE=$(az account show --query tenantId -o tsv)
Write-Output TENANTID_K8SRBAC_AKS_BASELINE: $TENANTID_K8SRBAC_AKS_BASELINE


# Only need to run these once per tenant
# $AADOBJECTNAME_USER_CLUSTERADMIN="bu0001a000800-admin"
# $TENANTDOMAIN_K8SRBAC="glasswall.com" #$(az ad signed-in-user show --query 'userPrincipalName' -o tsv | cut -d '@' -f 2 | sed 's/\"//')
# $AADOBJECTID_USER_CLUSTERADMIN=$(az ad user create --display-name=${AADOBJECTNAME_USER_CLUSTERADMIN} --user-principal-name ${AADOBJECTNAME_USER_CLUSTERADMIN}@${TENANTDOMAIN_K8SRBAC} --force-change-password-next-sign-in --password ChangeMebu0001a0008AdminChangeMe --query id -o tsv)
# az ad group member add -g $AADOBJECTID_GROUP_CLUSTERADMIN_AKS_BASELINE --member-id $AADOBJECTID_USER_CLUSTERADMIN

$RESOURCEID_VNET_CLUSTERSPOKE_AKS_BASELINE=$(az deployment group show -g $SPOKE_RESOURCE_GROUP -n spoke-BU0001A0008 --query properties.outputs.clusterVnetResourceId.value -o tsv)
Write-Output RESOURCEID_VNET_CLUSTERSPOKE_AKS_BASELINE: $RESOURCEID_VNET_CLUSTERSPOKE_AKS_BASELINE

# Needs to be same location as spoke, but different geo redundancy as spoke
az deployment group create -g $CLUSTER_RESOURCE_GROUP -f acr-stamp.bicep -p targetVnetResourceId=${RESOURCEID_VNET_CLUSTERSPOKE_AKS_BASELINE} location=$PrimaryRegion geoRedundancyLocation=$SecondaryRegion


$ACR_NAME_AKS_BASELINE=$(az deployment group show -g $CLUSTER_RESOURCE_GROUP -n acr-stamp --query properties.outputs.containerRegistryName.value -o tsv)
Write-Output ACR_NAME_AKS_BASELINE: $ACR_NAME_AKS_BASELINE


az acr import --source docker.io/weaveworks/kured:1.10.1 -n $ACR_NAME_AKS_BASELINE

$GITOPS_REPOURL=$(git config --get remote.origin.url)
$GITOPS_CURRENT_BRANCH_NAME=$(git branch --show-current)

## Actual cluster

az deployment group create `
-g $CLUSTER_RESOURCE_GROUP `
-f cluster-stamp.bicep `
-p `
targetVnetResourceId=${RESOURCEID_VNET_CLUSTERSPOKE_AKS_BASELINE} `
clusterAdminAadGroupObjectId=${AADOBJECTID_GROUP_CLUSTERADMIN_AKS_BASELINE} `
a0008NamespaceReaderAadGroupObjectId=${AADOBJECTID_GROUP_A0008_READER_AKS_BASELINE} `
k8sControlPlaneAuthorizationTenantId=${TENANTID_K8SRBAC_AKS_BASELINE} `
appGatewayListenerCertificate=${APP_GATEWAY_LISTENER_CERTIFICATE_AKS_BASELINE} `
aksIngressControllerCertificate=${AKS_INGRESS_CONTROLLER_CERTIFICATE_BASE64_AKS_BASELINE} `
domainName=${DOMAIN_NAME_AKS_BASELINE} `
gitOpsBootstrappingRepoHttpsUrl=${GITOPS_REPOURL} `
gitOpsBootstrappingRepoBranch=${GITOPS_CURRENT_BRANCH_NAME} `
location=$PrimaryRegion

# az resource update --resource-group rgp-uks-ei-cluster-dev  `
#     --name aks-6yal6ayn545hq `
#     --namespace Microsoft.ContainerService `
#     --resource-type ManagedClusters  
    
## Validation

$CLUSTER_RESOURCE_GROUP="rgp-uks-ei-cluster-dev"
$AKS_CLUSTER_NAME=$(az aks list -g $CLUSTER_RESOURCE_GROUP --query '[0].name' -o tsv)
Write-Output AKS_CLUSTER_NAME: $AKS_CLUSTER_NAME


$AKS_ID=$(az aks show -g $CLUSTER_RESOURCE_GROUP -n $AKS_CLUSTER_NAME --query id -o tsv)
Write-Output $AKS_ID

# az role assignment create --role "Azure Kubernetes Service RBAC Admin" --assignee "45581ccc-b855-4100-afa9-25543c263d7f" --scope $AKS_ID

az aks get-credentials -g $CLUSTER_RESOURCE_GROUP -n $AKS_CLUSTER_NAME
kubectl get nodes


az aks install-cli
$targetDir="$env:USERPROFILE\.azure-kubelogin"
$oldPath = [System.Environment]::GetEnvironmentVariable("Path","User")
$oldPathArray=($oldPath) -split ";"
if(-Not($oldPathArray -Contains "$targetDir")) {
    write-host "Permanently adding $targetDir to User Path"
    $newPath = "$oldPath;$targetDir" -replace ";+", ";"
    [System.Environment]::SetEnvironmentVariable("Path",$newPath,"User")
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","User"),[System.Environment]::GetEnvironmentVariable("Path","Machine") -join ";"
}