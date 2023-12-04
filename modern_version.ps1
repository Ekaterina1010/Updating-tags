$new_tags = @{"Environment"="dev";`
        "Product"="infra";`
        "TechnicalContact"="office.it@wakam.com";`
        "BusinessContact"="florin.gutu@wakam.com";`
        "CreatedBy"="nadine.raiss@wakam.com";`
        "Notes"=""}

Set-AzContext -Subscription aad467ae-cb52-4e12-8b60-cb7211b05843
$resourcegroupes = Get-AzResourceGroup
Foreach($resourcegroupe in $resourcegroupes)
{
	Update-AzTag -ResourceId $resourcegroupe.ResourceId -Tag $new_tags -Operation Merge
}
