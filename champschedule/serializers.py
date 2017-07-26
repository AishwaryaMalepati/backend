from rest_framework import serializers
from champschedule.models import *
from django.contrib.auth.models import User


class EventListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ('title', 'start', 'end')

#class EventSerializer(serializers.ModelSerializer):
   # events = EventListSerializer(many=True)
    #class Meta:
     #   model = Driver
      #  fields = ('id', 'first_name', 'last_name', 'driver_group', 'sub_group', 'events')
       # lookup_field = 'id'

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
class EmployeeSerializer(serializers.ModelSerializer):
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
      fields = ('id','first_name','last_name','eventdetails')



