## Implementation of Azure Logic App where Azure Function will listen to Blob trigger and publish blob details into Topics, inside Logic App it will read message content from Topic and send customize email with attachment ##

1. Create a container (landing-zn) within azure storage account
2. Create a blob trigger function & deploy it within a function app. In that, add service bus environment variables in the azure blob trigger function
3. Create a Topic and Subscription within the Azure Service Bus
4. Create a Azure Logic App named as topic_to_email and design the workflow.
5. Upload a blob in the storage container and check the results. 