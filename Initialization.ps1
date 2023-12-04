Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Connect-AzAccount
Set-AzContext -Subscription b3461e01-7a07-492e-8d20-3c3ca3cd7b8a
New-AzResourceGroup -Name WKM-RG-INFRA-BACKUP-PRD -Location westeurope -Tag @{"Environment"="dev";"Product"="infra"}
New-AzStorageAccount -ResourceGroupName WKM-RG-INFRA-BACKUP-PRD -Name prd -Location westeurope -SkuName Standard_GRS