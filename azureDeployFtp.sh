#!/bin/bash
# Create an App Service app and deploy files with FTP using Azure CLI
# https://learn.microsoft.com/en-us/azure/app-service/scripts/cli-deploy-ftp

resourceGroup="freeResGroup1"
appServicePlan="ASP-freeResGroup1-95dc"
webapp="as-mladenija-euw-dev-be-webapp-001"


# Get FTP publishing profile and query for publish URL and credentials
creds=($(az webapp deployment list-publishing-profiles --name $webapp --resource-group $resourceGroup \
--query "[?contains(publishMethod, 'FTP')].[publishUrl,userName,userPWD]" --output tsv))

# Use cURL to perform FTP upload. You can use any FTP tool to do this instead.
# curl -T index.html -u ${creds[1]}:${creds[2]} ${creds[0]}/

# Copy the result of the following command into a browser to see the static HTML site.
site="http://$webapp.azurewebsites.net"
echo $site
curl "$site"
