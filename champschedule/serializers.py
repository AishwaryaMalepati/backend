import datetime
from django.contrib.auth.models import User
from django.db.models import Q
from rest_framework import serializers
from champschedule.models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('password', 'first_name', 'last_name', 'email',)
        write_only_fields = ('password',)
        read_only_fields = ('is_staff', 'is_superuser', 'is_active', 'date_joined',)

    def restore_object(self, attrs, instance=None):
        # call set_password on user object. Without this
        # the password will be stored in plain text.
        user = super(UserSerializer, self).restore_object(attrs, instance)
        user.set_password(attrs['password'])
        return user

# adding serializers for the new cs models
'''class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = CsEmployee
        fields = ('id','first_name','last_name','dob')

class EmployeeGroupSerializer(serializers.ModelSerializer):
   group_name = serializers.CharField(source='group.group_name', read_only=True)
   subgroup_name = serializers.CharField(source='subgroup.subgroup_name', read_only=True)
   class Meta:
        model = CsEmployee
        fields = ('id','first_name','last_name','dob','group_name','subgroup_name')
        lookup_field = 'id'

class GroupSerializer(serializers.ModelSerializer):
    members = EmployeeSerializer(many=True)
    class Meta:
        model = CsGroup
        fields = ('group_name','members')

class SubgroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = CsSubgroup
        fields = ('subgroup_id','subgroup_name')

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = CsLocation
        fields = ('loc_id','loc_name')

class EventSerializer(serializers.ModelSerializer):
    class Meta:
       model = CsEvent
       fields = ('event_id','title','event_start','event_end','loc')

class EventEntitySerializer(serializers.ModelSerializer):
    class Meta:
        model= CsEntityEvents
        fields = ('event','employee')

class EventEmployeeSerializer(serializers.ModelSerializer):
    eventdetails = EventEntitySerializer(many=True)
    class Meta:
      model = CsEmployee
      fields = ('id','first_name','last_name','eventdetails')'''

#serializers for the new models
class EmployeeGroupSerializer(serializers.ModelSerializer):
    group = serializers.SlugRelatedField(slug_field='group_name', queryset=Group.objects.all() )
    subgroup = serializers.SlugRelatedField(slug_field ='subgroup_name', queryset=Subgroup.objects.all())
    class Meta:
        model = Employee
        fields = ('id','first_name','last_name','dob','group','subgroup')


class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ('id','first_name','last_name','dob','group','subgroup')


class GroupSerializer(serializers.ModelSerializer):
   # members = EmployeeSerializer(many=True)
    class Meta:
        model = Group
        fields = ('id','group_name')


class SubgroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id','subgroup_name','group')


class EventDetailSerializer(serializers.ModelSerializer):
    #employee= EmployeeSerializer(many=True)
    event = serializers.SlugRelatedField(slug_field='title', queryset=Event.objects.all() )
    class Meta:
          model = EventDetail
          fields = ('id','event', 'start', 'end')
          #, 'employee', 'location')
          #depth=1


class CreateScheduleSerializer(serializers.ModelSerializer):

    def __init__(self, *args, **kwargs):
        many = kwargs.pop('many', True)
        super(CreateScheduleSerializer, self).__init__(many=many, *args, **kwargs)

    def get_warning_message(self, obj):
        start = obj.start
        end = obj.end
        count_events_qs = EventDetail.objects.filter(Q(Q(
            Q(start__date__gte=start) & Q(start__date__lte=end)) | Q(Q(end__date__gte=start) & Q(end__date__lte=end) |
            Q(Q(start__date__lte=start) & Q(end__date__gte=end))
        )), employee=obj.employee).count()
        if count_events_qs > 1:
            warning_msg = 'overlaps'
        else:
            warning_msg = 'no overlap'

        return warning_msg

    warning_message = serializers.SerializerMethodField(read_only=True)

    location = serializers.SlugRelatedField(slug_field='location_name', queryset=Location.objects.all() )
    location_color = serializers.CharField(source='location.location_color', read_only=True)

    class Meta:
          model = EventDetail
          fields = ('id','employee','location','location_color','start','end','warning_message')
          lookup_field = 'id'


class LocationTrackSerializer(serializers.ModelSerializer):

    location = serializers.SlugRelatedField(slug_field='location_name', queryset=Location.objects.all() )
    location_color = serializers.CharField(source='location.location_color', read_only=True)

    class Meta:
          model = EventDetail
          fields = ('id','employee','location','location_color','start','end')


class EventLocationSerializer(serializers.ModelSerializer):
    class Meta:
        model= Location
        fields = ('id','location_name','location_color')


class PerdiemSerializer(serializers.ModelSerializer):
    class Meta:
        model=Perdiem
        fields='__all__'