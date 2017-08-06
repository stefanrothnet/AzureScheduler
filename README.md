# Azure Scheduler OMS Solution

![ScreenShot](https://raw.githubusercontent.com/stefanrothnet/AzureScheduler/master/images/OMSAzureScheduler.PNG)

This OMS solution delivers a dashboard for Azure Scheduler collection and jobs. It will show failed jobs, jobs / collection, count of job executions etc.

This is an experimental solution for demos and testing. 

The solution will deploy the following parts:

* Creates a resource group
* Creates Azure Automation account
* Creates a schedule to run the runbook to collect the data. It runs every one hour starting at deployment.
* Creates variables for OMS workspace and key
* Creates a variable for the current subscription id
* Creates a Azure Automation credential with username and password
* Updates in the background of the Azure Automation account the AzureRM.Profile and AzureRM.Scheduler modules
* Installs the OMSIngestionsAPI module
* Deploys a OMS workspace and installs the solution into the workspace

To deploy the solution use the button below and it will deploy it to your subscription.
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstefanrothnet%2FAzureScheduler%2Fmaster%2Fazuredeploy.json" target="_blank">  <img src="http://azuredeploy.net/deploybutton.png"/></a>


