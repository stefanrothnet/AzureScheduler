$LogType = "AzureScheduler"
$TimeStampField=""
$RunTime = [System.DateTime]::UtcNow

$CustomerID = Get-AutomationVariable -Name "OMS Workspace ID"
$SharedKey =  Get-AutomationVariable -Name "OMS Workspace Key"
$Subscription = Get-AutomationVariable -Name "Subscription"
$Credential = Get-AutomationPSCredential -Name 'AzureSchedulerCredential'

Add-AzureRMAccount -Credential $Credential  -Subscriptionid $Subscription

$JobData = Get-AzureRmSchedulerJobCollection | Get-AzureRmSchedulerJob 

If($JobData)
{
    $JobCollection = @()
    ForEach ($Job in $JobData)
    {
       $Job | Add-Member -MemberType NoteProperty -Name 'RunTime' -Value $RunTime
       $Jobcollection += $Job
    } 

    $Body = ConvertTo-Json  $JobCollection 

    try {

        Send-OMSAPIIngestionFile -customerId $CustomerID -sharedKey $SharedKey -body $Body -logType $LogType -TimeStampField $TimeStampField
        $Body
        Write-Information "Successfully sent job data to OMS"
        }

    Catch

    {

        $ErrorMessage = $_.Exception.Message

	    Write-Error "Error submitting data: $ErrorMessage"

        Exit

    }
}
Else
{
    Write-Information "No Azure Scheduler data available."
}
