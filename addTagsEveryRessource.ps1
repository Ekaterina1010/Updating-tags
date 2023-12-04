Write-Host = "Hello !"
$answer = Read-Host -Prompt "If you want change each resource's tags please enter 'yes', else please enter 'no'"
$tags = @{"Environment"="Dev"; "CreatedBy"="Me"}

$resourcegroupes = Get-AzResourceGroup

if ($answer -eq 'yes') {
	Foreach($resourcegroupe in $resourcegroupes) {
		$resources = Get-AzResource -ResourceGroup $resourcegroupe.ResourceGroupName 

		Foreach($resource in $resources) {
			New-AzTag -ResourceId $resource.ResourceId -Tag $tags
		}
	}
}