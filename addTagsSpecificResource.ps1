$tags = @{"Environment"="Dev"; "CreatedBy"="Me"}
$resource = Get-AzResource -Name katiestorageaccount -ResourceGroup WKM-RG-FINOPS-ES-DEV
New-AzTag -ResourceId $resource.id -Tag $tags