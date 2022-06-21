# Azure Application Insights metrics with Django

Install all dependencies:

```sh
poetry install
poetry shell
```

Create the Azure Resources

```sh
az group create -n 'rg-myapp' -l 'brazilsouth'

az monitor log-analytics workspace create -g 'rg-myapp' -n 'log-myapp' -l 'brazilsouth'

az extension add --name application-insights
az monitor app-insights component create --app 'appi-myapp' -l 'brazilsouth' -g 'rg-myapp' --workspace 'log-myapp'

az monitor app-insights component show --app 'appi-myapp' -g 'rg-myapp' --query 'connectionString' -o tsv
```

Set the `APPLICATIONINSIGHTS_CONNECTION_STRING` environment variable.

```sh
python manage.py migrate
python manage.py runserver
```