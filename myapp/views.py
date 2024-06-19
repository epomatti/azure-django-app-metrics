from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from .serializers import UserSerializer, GroupSerializer, CitySerializer
from .models import City
from rest_framework.exceptions import APIException
import logging

logger = logging.getLogger("default")

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """

    queryset = User.objects.all().order_by("-date_joined")
    serializer_class = UserSerializer


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """

    queryset = Group.objects.all()
    serializer_class = GroupSerializer


class CityViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows persons to be viewed or edited.
    """

    def get_queryset(self):
        name = self.request.query_params.get('name')
        if name == "exception":
            raise APIException("There was a problem!")
        logger.info(f"Received parameter: {name}")
        logger.warning("This is a warning!")
        return City.objects.all()

    queryset = City.objects.all()
    serializer_class = CitySerializer
