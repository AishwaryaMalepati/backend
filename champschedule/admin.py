from django.contrib import admin

# Register your models here.
from django.contrib import admin
from django.contrib.admin import AdminSite
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import ugettext_lazy
from .models import *

class MyAdminSite(AdminSite):
    # Text to put at the end of each page's <title>.
    site_title = ugettext_lazy('Champschedule site admin')

    # Text to put in each page's <h1> (and above login form).
    site_header = ugettext_lazy('Champschedule Administration')

    # Text to put at the top of the admin index page.
    index_title = ugettext_lazy('Site administration')

#UserAdmin.list_display += ('driver_id',)  # don't forget the commas
#UserAdmin.list_filter += ('driver_id',)
#UserAdmin.fieldsets += ('driver_id',)


class EventAdmin(admin.ModelAdmin):
    list_display = ('driver_id','title','start','end')

class GroupAd(admin.ModelAdmin):
    list_display = ('group_name',)
admin.site.register(Group, GroupAd)

class SubgroupAd(admin.ModelAdmin):
    list_display = ('subgroup_name','group')
admin.site.register(Subgroup, SubgroupAd)

class EmployeeAd(admin.ModelAdmin):
    list_display = ('first_name','last_name','dob','group','subgroup')
admin.site.register(Employee, EmployeeAd)

class LocationAd(admin.ModelAdmin):
    list_display = ('location_name',)
admin.site.register(Location, LocationAd)

'''class EventAd(admin.ModelAdmin):
    list_display = ('title','start','end','location','employee')

admin.site.register(Eventdetail, EventAd)'''


