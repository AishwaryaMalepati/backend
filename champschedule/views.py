from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework import generics, viewsets
from champschedule.serializers import *
from champschedule.models import Driver, Event, CsEmployee, CsGroup
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

from .permissions import IsStaffOrTargetUser

# Create your views here.
# this login required decorator is to not allow to any
# view without authenticating
@login_required(login_url="login/")
def home(request):
    return render(request,"home.html")

'''class drivers(generics.ListCreateAPIView):
    queryset = Driver.objects.all()
    serializer_class = DriverSerializer

class eventlist(generics.ListCreateAPIView):
    queryset = Event.objects.all()
    serializer_class = EventListSerializer

class event(generics.RetrieveUpdateDestroyAPIView):
    queryset = Driver.objects.all()
    serializer_class =EventSerializer
    lookup_field = 'id'''


class UserView(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    model = User

   # def get_permissions(self):
        # allow non-authenticated user to create via POST
      #  return (AllowAny() if self.request.method == 'POST'
              #  else IsStaffOrTargetUser())

#views for the new cs serializers

class employee(generics.ListCreateAPIView):
    queryset = CsEmployee.objects.all()
    serializer_class = EmployeeSerializer
    lookup_field = 'id'

class EmployeeViewSet(viewsets.ModelViewSet):
    queryset = CsEmployee.objects.all()
    serializer_class = EmployeeSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(EmployeeViewSet, self).retrieve(request, *args, **kwargs)
    def list(self, request, *args, **kwargs):
        return super(EmployeeViewSet,self).list(request,*args,**kwargs)

class GroupViewSet(viewsets.ModelViewSet):
    queryset = CsGroup.objects.all()
    serializer_class = GroupSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(GroupViewSet, self).retrieve(request, *args, **kwargs)

    def list(self, request, *args, **kwargs):
        return super(GroupViewSet, self).list(request, *args, **kwargs)

class EventEntityViewSet(viewsets.ModelViewSet):
    queryset = CsEmployee.objects.all()
    serializer_class = EventEmployeeSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(EventEntityViewSet, self).retrieve(request, *args, **kwargs)

    def list(self, request, *args, **kwargs):
        return super(EventEntityViewSet, self).list(request, *args, **kwargs)
