import datetime

from django.contrib.auth.decorators import login_required
from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework import generics, viewsets
from rest_framework.decorators import detail_route, list_route

from .serializers import *
from .permissions import IsStaffOrTargetUser


# this login required decorator is to not allow to any
# view without authenticating
#@login_required(login_url="login/")
def home(request):
    return render(request,"home.html")


class UserView(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_permissions(self):
        # allow non-authenticated user to create via POST
        return [AllowAny()] if self.request.method == 'POST' else [IsStaffOrTargetUser()]


class EmployeeGroupViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.exclude(group__employee__isnull=True)
    serializer_class = EmployeeGroupSerializer


class EmployeeViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.exclude(group__employee__isnull=True)
    serializer_class = EmployeeSerializer


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer


class SubgroupViewSet(viewsets.ModelViewSet):
    queryset = Subgroup.objects.all()
    serializer_class = SubgroupSerializer


class EventViewSet(viewsets.ModelViewSet):
    queryset = EventDetail.objects.all()
    serializer_class = EventDetailSerializer


class LocationTrackViewSet(viewsets.ModelViewSet):
    queryset = EventDetail.objects.all()
    serializer_class = LocationTrackSerializer


class CreateScheduleViewSet(viewsets.ModelViewSet):
    queryset = EventDetail.objects.all()
    serializer_class = CreateScheduleSerializer

    def create(self, request, *args, **kwargs):
        self.user = request.user
        event_list = request.data['events']

        serializer = self.get_serializer(data=event_list, many=True)
        if serializer.is_valid():
            serializer.save()
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED,
                            headers=headers)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @list_route(methods=['delete'])
    def delete(self, request):
        """
        Allows multiple query parameters `pks` to delete multiple instances.
        :param: pks - comma separated numbers (eg. 1,2,3,) - required
        """

        pks = request.query_params.get('pks', None)
        if not pks:
            return Response({
                'success': False, 'message': 'No `pks` passed to delete.'
            }, status=status.HTTP_400_BAD_REQUEST)

        pk_list = pks.split(',')
        EventDetail.objects.filter(id__in=pk_list).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    @list_route(methods=['get'])
    def event_in_range(self, request):
        """
        Returns events in range between start and date dates for a given employee.
        Methods: GET
            :param: ip_start - date (YYYY-MM-DD) - required
            :param: ip_end - date (YYYY-MM-DD) - required
            :param: emp_id - number - required
        Response:
            :code: 200
            :return: events in range

            :code: 400
            :return: required fields not entered
        """

        ip_start = request.query_params.get('ip_start', None)
        ip_end = request.query_params.get('ip_end', None)
        emp_id = request.query_params.get('emp_id', None)

        if ip_start and ip_end and emp_id:
            events_qs = EventDetail.objects.filter(
                start__date__gte=ip_start, end__date__lte=ip_end, employee__id=emp_id
            )

            page = self.paginate_queryset(events_qs)
            if page is not None:
                serializer = self.get_serializer(page, many=True)
                return self.get_paginated_response(serializer.data)

            serializer = self.get_serializer(events_qs, many=True)
            return Response(serializer.data)
        else:
            return Response(
                {'success': False, 'message': 'Required Fields not entered.'},
                status=status.HTTP_400_BAD_REQUEST
            )

    @list_route(methods=['POST'])
    def copy(self, request):
        """
        Copies EventDetail objects from one employee to another
        Methods: POST
            :param: emp1 - number - required
            :param: emp2 - number - required
            :param: start - date (YYYY-MM-DD) - required
            :param: end - date (YYYY-MM-DD) - required
        Response:
            :code: 200
            :return: Events copied

            :code: 400
            :return: Employee 2 doesn't exist.
        """

        emp1_id = request.data.get('emp1', None)
        emp2_id = request.data.get('emp2', None)
        start_date = request.data.get('start', None)
        end_date = request.data.get('end', None)

        if emp1_id and emp2_id and start_date and end_date:
            try:
                emp2 = Employee.objects.get(id=emp2_id)
            except Employee.DoesNotExist:
                return Response({
                    'success': False,
                    'message': 'Employee 2 does not exist.'
                }, status=status.HTTP_400_BAD_REQUEST)

            events_qs = EventDetail.objects.filter(
                start__date__gte=start_date, end__date__lte=end_date, employee__id=emp1_id
            )
            copied_events = [
                EventDetail(
                    employee=emp2,
                    event=event.event,
                    start=event.start,
                    end=event.end,
                    location=event.location,
                    is_daily_detail=event.is_daily_detail
                ) for event in events_qs
            ]
            copied_events_qs = EventDetail.objects.bulk_create(copied_events)
            return Response({
                'success': True,
                'message': 'Events copied from employee id {} to {}'.format(emp1_id, emp2_id)
            })
        else:
            return Response({
                'success': False,
                'message': 'Required fields not entered.'
            }, status=status.HTTP_400_BAD_REQUEST)

    @list_route(methods=['POST'])
    def swap(self, request):
        """
        Swaps EventDetail objects of two employees
        Methods: POST
            :param: emp1 - number - required
            :param: emp2 - number - required
            :param: start - date (YYYY-MM-DD) - required
            :param: end - date (YYYY-MM-DD) - required
        Response:
            :code: 200
            :return: Events copied

            :code: 400
            :return: Employee 1 or 2 doesn't exist.
        """

        emp1_id = request.data.get('emp1', None)
        emp2_id = request.data.get('emp2', None)
        start_date = request.data.get('start', None)
        end_date = request.data.get('end', None)

        if emp1_id and emp2_id and start_date and end_date:
            try:
                Employee.objects.get(id=emp1_id)
            except Employee.DoesNotExist:
                return Response({
                    'success': False,
                    'message': 'Employee 1 does not exist.'
                }, status=status.HTTP_400_BAD_REQUEST)

            try:
                Employee.objects.get(id=emp2_id)
            except Employee.DoesNotExist:
                return Response({
                    'success': False,
                    'message': 'Employee 2 does not exist.'
                }, status=status.HTTP_400_BAD_REQUEST)

            emp1_events_qs = EventDetail.objects.filter(
                start__date__gte=start_date, end__date__lte=end_date, employee__id=emp1_id
            )
            emp1_event_ids = list(emp1_events_qs.values_list('id', flat=True))
            emp2_events_qs = EventDetail.objects.filter(
                start__date__gte=start_date, end__date__lte=end_date, employee__id=emp2_id
            ).exclude(id__in=emp1_event_ids)

            emp1_events_qs.update(employee=emp2_id)
            emp2_events_qs.update(employee=emp1_id)

            return Response({'success': True, 'message': 'Events swapped.'})
        else:
            return Response({
                'success': False,
                'message': 'Required fields not entered.'
            }, status=status.HTTP_400_BAD_REQUEST)


class EventLocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all()
    serializer_class = EventLocationSerializer


class PerdiemViewSet(viewsets.ModelViewSet):
    queryset = Perdiem.objects.all()
    serializer_class = PerdiemSerializer
