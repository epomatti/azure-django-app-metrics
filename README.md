# azure-django-app-metrics
APM with Azure Application Insights with Django

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
```

```sh
python manage.py migrate
python manage.py runsever
```