# Django Metrics <img src=".docs/django.jpg" width=25 /> <img src=".docs/appi.svg" width=22 />

Implementation of a Django REST application sending telemetry to Azure Application Insights.

Install the dependencies:

```sh
poetry install
poetry shell
```

Create the Azure Resources:

```sh
az group create -n 'rg-myapp' -l 'brazilsouth'
az monitor log-analytics workspace create -g 'rg-myapp' -n 'log-myapp' -l 'brazilsouth'
az monitor app-insights component create --app 'appi-myapp' -l 'brazilsouth' -g 'rg-myapp' --workspace 'log-myapp'
```

Get the Applicatoin Insights connection string:

```sh
az monitor app-insights component show --app 'appi-myapp' -g 'rg-myapp' --query 'connectionString' -o tsv
```

Set the `APPLICATIONINSIGHTS_CONNECTION_STRING` environment variable.

Apply the migrations and start the server to start sending telemetery.

```sh
python manage.py migrate
python manage.py runserver
```
