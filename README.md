# Django Metrics <img src=".docs/django.jpg" width=25 /> <img src=".docs/appi.svg" width=22 />

Implementation of a Django REST API sending telemetry to Azure Application Insights.

<img src=".docs/metrics.png" width=500 />

Using Application Insights should follow [good practices][1]. Implement [Cloud_RoleName][2] tags for microservices.

Install the dependencies:

```sh
poetry install
poetry shell
```

Create the Azure Resources:

```
az deployment sub create \
  --location brazilsouth \
  --template-file azure/main.bicep \
  --parameters rgLocation=brazilsouth
```

Get the Application Insights connection string:

```sh
az monitor app-insights component show --app 'appi-myapp' -g 'rg-myapp' --query 'connectionString' -o tsv
```

Set the `APPLICATIONINSIGHTS_CONNECTION_STRING` environment variable:

```sh
cp sample.env .env
```

Apply the migrations and start the server to start sending telemetry.

```sh
python manage.py migrate
python manage.py runserver
```

[1]: https://learn.microsoft.com/en-us/azure/azure-monitor/app/separate-resources
[2]: https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-map?tabs=python#set-or-override-cloud-role-name
