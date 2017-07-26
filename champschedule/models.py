
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


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()
    driver_id = models.IntegerField(blank=True, null=True)
    class Meta:
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        db_table = 'django_session'


class WmsDriver(models.Model):
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
        db_table = 'wms_driver'

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
        ordering = ['start']

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
    all_day = models.IntegerField(blank=True, null=True)

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