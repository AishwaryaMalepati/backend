
# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models

'''
class Driver(models.Model):
    id = models.IntegerField(primary_key=True)
    first_name = models.CharField(max_length=100, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    dob = models.CharField(max_length=20, blank=True, null=True)
    license_number = models.CharField(max_length=100, blank=True, null=True)
    license_state = models.CharField(max_length=2, blank=True, null=True)
    license_expiration = models.DateField(blank=True, null=True)
    medical_certificate_expiration = models.DateField(blank=True, null=True)
    last_mvr = models.DateField(blank=True, null=True)
    employment_status = models.CharField(max_length=20, blank=True, null=True)
    license_image = models.CharField(max_length=100, blank=True, null=True)
    compressed_license_image = models.CharField(max_length=100, blank=True, null=True)
    driver_group = models.CharField(max_length=50, blank=True, null=True)
    sub_group = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        db_table = 'driver'


class Event(models.Model):
    #driver_id = models.IntegerField(blank=True, null=True)
    driver = models.ForeignKey(Driver, related_name = 'events', blank=True, null=True)
    title = models.CharField(max_length=50, blank=True, null=True)
    start = models.DateTimeField(blank=True, null=True)
    end = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'event'
        ordering = ['start']'''

class CsEmployee(models.Model):
    id = models.IntegerField(primary_key=True)
    first_name = models.CharField(max_length=100, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    dob = models.CharField(max_length=20, blank=True, null=True)
    license_number = models.CharField(max_length=100, blank=True, null=True)
    license_state = models.CharField(max_length=2, blank=True, null=True)
    license_expiration = models.DateField(blank=True, null=True)
    medical_certificate_expiration = models.DateField(blank=True, null=True)
    last_mvr = models.DateField(blank=True, null=True)
    employment_status = models.CharField(max_length=20, blank=True, null=True)
    group = models.ForeignKey('CsGroup', related_name='members', blank=True, null=True)
    subgroup = models.ForeignKey('CsSubgroup', models.DO_NOTHING, blank=True, null=True)
    entitytype = models.ForeignKey('CsEntitytype', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'cs_employee'


class CsEntityEvents(models.Model):
    id = models.AutoField(primary_key=True)
    event = models.ForeignKey('CsEvent', related_name='employeedetails', blank=True, null=True)
    employee = models.ForeignKey(CsEmployee, related_name='eventdetails', blank=True, null=True)
    equipment = models.ForeignKey('CsEquipment', models.DO_NOTHING, blank=True, null=True)
    hotel = models.ForeignKey('CsHotel', models.DO_NOTHING, blank=True, null=True)
    rentalcar = models.ForeignKey('CsRentalcar', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'cs_entity_events'


class CsEntitytype(models.Model):
    type_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        db_table = 'cs_entitytype'


class CsEquipment(models.Model):
    equipment_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30, blank=True, null=True)
    entitytype = models.ForeignKey(CsEntitytype, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'cs_equipment'


class CsEvent(models.Model):
    event_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    event_start = models.DateTimeField(blank=True, null=True)
    event_end = models.DateTimeField(blank=True, null=True)
    loc = models.ForeignKey('CsLocation', models.DO_NOTHING, blank=True, null=True)
    is_daily_detail = models.BooleanField

    class Meta:
        db_table = 'cs_event'


class CsGroup(models.Model):
    group_id = models.AutoField(primary_key=True)
    group_name = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        db_table = 'cs_group'


class CsHotel(models.Model):
    hotel_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30, blank=True, null=True)
    entitytype = models.ForeignKey(CsEntitytype, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'cs_hotel'


class CsLocation(models.Model):
    loc_id = models.AutoField(primary_key=True)
    loc_name = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        db_table = 'cs_location'


class CsRentalcar(models.Model):
    car_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=25, blank=True, null=True)
    entitytype = models.ForeignKey(CsEntitytype, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'cs_rentalcar'


class CsSubgroup(models.Model):
    subgroup_id = models.AutoField(primary_key=True)
    subgroup_name = models.CharField(max_length=20, blank=True, null=True)
    group = models.ForeignKey(CsGroup, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'cs_subgroup'

class Group(models.Model):
    group_name = models.CharField(max_length=30)
    def __str__(self):
        return self.group_name

class Subgroup(models.Model):
    subgroup_name = models.CharField(max_length=30)
    group = models.ForeignKey(Group, models.DO_NOTHING, blank=True, null=True)

    def __str__(self):
        return self.subgroup_name

class Location(models.Model):
    location_name = models.CharField(max_length=30)
    location_color = models.CharField(max_length=7, default="#3a87ad")

    def __str__(self):
        return self.location_name

class Employee(models.Model):
    first_name = models.CharField(max_length=30,blank=True, null=True)
    last_name = models.CharField(max_length=30,blank=True, null=True)
    dob = models.DateField(blank=True, null=True)
    license_number = models.CharField(max_length=30, blank=True, null=True)
    license_state = models.CharField(max_length=15,blank=True, null=True)
    license_expiration = models.DateField(blank=True, null=True)
    employment_status = models.CharField(max_length=20,blank=True, null=True)
    group = models.ForeignKey(Group, models.DO_NOTHING, blank=True, null=True)
    subgroup = models.ForeignKey(Subgroup, models.DO_NOTHING, blank=True, null=True)


    def __str__(self):
        return self.last_name

class Event(models.Model):
    title = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.title


class Eventdetail(models.Model):
   event = models.ForeignKey(Event, models.DO_NOTHING, blank=True, null=True)
   start = models.DateTimeField(blank=True, null=True)
   end = models.DateTimeField(blank=True, null=True)
   employee = models.ForeignKey(Employee, models.DO_NOTHING, blank=True, null=True)
   location = models.ForeignKey(Location, models.DO_NOTHING, blank=True, null=True)
   is_daily_detail = models.BooleanField

   def __str__(self):
       return self.event

class Track(models.Model):
    name = models.CharField(max_length=30,blank=True, null=True)
    code = models.CharField(max_length=10,blank=True, null=True)

class Series(models.Model):
     name = models.CharField(max_length=20,blank=True, null=True)
     code = models.CharField(max_length=10,blank=True, null=True)

class Race(models.Model):
    series = models.ForeignKey(Series, models.DO_NOTHING, blank=True, null=True)
    scheduled_date = models.DateField(blank=True, null=True)
    track = models.ForeignKey(Track, models.DO_NOTHING, blank=True, null=True)
    location = models.ForeignKey(Location, models.DO_NOTHING, blank=True, null=True)

class Perdiemrange(models.Model):
    pd_month = models.CharField(max_length=30)
    pd_start = models.DateField
    pd_end = models.DateField

class Perdiem(models.Model):
    employee_id = models.IntegerField(primary_key=True)
    first_name = models.CharField(max_length=30, blank=True, null=True)
    last_name = models.CharField(max_length=30, blank=True, null=True)
    group = models.ForeignKey(Group, on_delete=models.DO_NOTHING, blank=True, null=True)
    days_jantomar = models.IntegerField(blank=True, null=True)
    jantomar = models.IntegerField (blank=True, null=True)
    days_martoapr = models.IntegerField (blank=True, null=True)
    martoapr = models.IntegerField (blank=True, null=True)
    days_aprtomay = models.IntegerField (blank=True, null=True)
    aprtomay = models.IntegerField (blank=True, null=True)
    days_maytojun = models.IntegerField (blank=True, null=True)
    maytojun = models.IntegerField (blank=True, null=True)
    days_juntojul = models.IntegerField (blank=True, null=True)
    juntojul = models.IntegerField (blank=True, null=True)
    days_jultoaug = models.IntegerField (blank=True, null=True)
    jultoaug = models.IntegerField (blank=True, null=True)
    days_augtosep = models.IntegerField (blank=True, null=True)
    augtosep = models.IntegerField (blank=True, null=True)
    days_septooct = models.IntegerField (blank=True, null=True)
    septooct = models.IntegerField (blank=True, null=True)
    days_octtonov = models.IntegerField (blank=True, null=True)
    octtonov = models.IntegerField (blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'champschedule_perdiem'