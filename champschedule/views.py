from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework import generics, viewsets
from champschedule.serializers import *
from champschedule.models import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from rest_framework.decorators import detail_route, list_route
from .permissions import IsStaffOrTargetUser
import datetime

# Create your views here.
# this login required decorator is to not allow to any
# view without authenticating
#@login_required(login_url="login/")
def home(request):
    return render(request,"home.html")

class UserView(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    model = User

    def get_permissions(self):
       # allow non-authenticated user to create via POST
     return (AllowAny() if self.request.method == 'POST'
        else IsStaffOrTargetUser())

#views for the new serializers


class EmployeeGroupViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.exclude(group__employee__isnull=True)
    serializer_class = EmployeeGroupSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(EmployeeGroupViewSet, self).retrieve(request, *args, **kwargs)
    def list(self, request, *args, **kwargs):
        return super(EmployeeGroupViewSet,self).list(request,*args,**kwargs)

class EmployeeViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.exclude(group__employee__isnull=True)
    serializer_class = EmployeeSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(EmployeeViewSet, self).retrieve(request, *args, **kwargs)
    def list(self, request, *args, **kwargs):
        return super(EmployeeViewSet,self).list(request,*args,**kwargs)


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(GroupViewSet, self).retrieve(request, *args, **kwargs)
    def list(self, request, *args, **kwargs):
        return super(GroupViewSet,self).list(request,*args,**kwargs)

class SubgroupViewSet(viewsets.ModelViewSet):
    queryset = Subgroup.objects.all()
    serializer_class = SubgroupSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(SubgroupViewSet, self).retrieve(request, *args, **kwargs)
    def list(self, request, *args, **kwargs):
        return super(SubgroupViewSet,self).list(request,*args,**kwargs)

class EventViewSet(viewsets.ModelViewSet):
    queryset = Eventdetail.objects.all()
    serializer_class = EventDetailSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(EventViewSet, self).retrieve(request, *args, **kwargs)
    def list(self, request, *args, **kwargs):
        return super(EventViewSet,self).list(request,*args,**kwargs)

class LocationTrackViewSet(viewsets.ModelViewSet):
    queryset = Eventdetail.objects.all()
    serializer_class = LocationTrackSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(LocationTrackViewSet, self).retrieve(request, *args, **kwargs)
    def list(self, request, *args, **kwargs):
        return super(LocationTrackViewSet,self).list(request,*args,**kwargs)


class CreateScheduleViewSet(viewsets.ModelViewSet):
    queryset = Eventdetail.objects.all()
    serializer_class = CreateScheduleSerializer

    def create(self, request, *args, **kwargs):
        self.user = request.user
        listOfThings = request.data['events']

        serializer = self.get_serializer(data=listOfThings, many=True)
        if serializer.is_valid():
            serializer.save()
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED,
                            headers=headers)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, pk=None):
        """
        Overridden method allows either url parameter of single pk
        (to delete a single instance), or multiple query parameters `pks`
        to delete multiple instances.
        """
        if not pk:
            pks = request.query_params.get('pks', None)
            if not pks:
                return Response(status=status.HTTP_404_NOT_FOUND)
            if len(pks) != Eventdetail.objects.filter(pk__in=pks).count():
                return Response(status=status.HTTP_404_NOT_FOUND)
            Eventdetail.objects.filter(id__in=pks).delete()
        else:
            instance = self.get_object()
            if not instance:
                return Response(status=status.HTTP_404_NOT_FOUND)
            instance.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    @detail_route(methods=['post','get'])
    def event_in_range(self, request):
        ip_start = request.data.get('ipstart')
        ip_end = datetime.date(2017, 9, 8)
        emp_id = 27
        event_in_range = Eventdetail.objects.filter(start__date__gte=ip_start,end__date__lte=ip_end,employee__id=emp_id)

        page = self.paginate_queryset(event_in_range)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(event_in_range, many=True)
        return Response(serializer.data)


class EventLocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all()
    serializer_class = EventLocationSerializer

    def retrieve(self, request, *args, **kwargs):
        return super(EventLocationViewSet, self).retrieve(request, *args, **kwargs)
    def list(self, request, *args, **kwargs):
        return super(EventLocationViewSet,self).list(request,*args,**kwargs)

class PerdiemViewSet(viewsets.ModelViewSet):
    queryset = Perdiem.objects.all()
    serializer_class = PerdiemSerializer
    model= Perdiem
