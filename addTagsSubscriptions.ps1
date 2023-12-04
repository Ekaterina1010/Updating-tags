$ForbiddenSubs = 'ad39a871-c06c-4442-b792-d829dd94c6ff b3461e01-7a07-492e-8d20-3c3ca3cd7b8a 427793b9-e137-47ba-866e-79b6dd63f550'
$ListOfSubscriptions = Get-AzSubscription
foreach ($Subscription in $ListOfSubscriptions) {
  if ($ForbiddenSubs -notcontains $Subscription.Id) {
    $Subscription_name = $Subscription.Name
    $start = 7
    $end = $Subscription_name.LastIndexOf("-")
    $product_name = $Subscription_name.Substring($start+1,$end-$start-1).ToLower()
    if (($Subscription_name -match 'ANTEPROD')) {
      $new_tags = @{"Product" = "$product_name"; "Environment" = "dev"}
      New-AzTag -ResourceId "/subscriptions/$Subscription" -Tag $new_tags
    }
    else {
      $new_tags = @{"Product" = "$product_name"; "Environment" = "prd"}
      New-AzTag -ResourceId "/subscriptions/$Subscription" -Tag $new_tags
    }
  }
}