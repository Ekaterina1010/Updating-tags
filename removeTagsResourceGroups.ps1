$tags = @{"tag1"="value1"; "tag2"="value2"}

$resourcegroupes = Get-AzResourceGroup
Foreach($resourcegroupe in $resourcegroupes)
{
	if ($resourcegroupe.ResourceGroupName -ne "WKM-RG-UPDATES-DEV") {
		Update-AzTag -ResourceId $resourcegroupe.ResourceId -Tag $tags -Operation Delete
	}
}
