#!/bin/sh
python manage.py migrate
gunicorn --bind=0.0.0.0:8000 project.wsgi
# python manage.py runserver 0.0.0.0:8000 --noreload