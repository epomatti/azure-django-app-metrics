from django.urls import include, path
from rest_framework import routers, serializers, viewsets
from django.contrib.auth.models import User
from myapp import views


router = routers.DefaultRouter()
router.register(r"users", views.UserViewSet)
router.register(r"groups", views.GroupViewSet)
router.register(r"cities", views.CityViewSet)

urlpatterns = [
    path("", include(router.urls)),
]
