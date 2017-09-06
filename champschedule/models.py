
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