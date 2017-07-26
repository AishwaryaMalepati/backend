from django.contrib import admin

# Register your models here.
from django.contrib import admin
from django.contrib.admin import AdminSite
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import ugettext_lazy
from .models import Driver, Event, CsEmployee

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


class DriverAdmin(admin.ModelAdmin):
    list_display = ('first_name','last_name','employment_status','driver_group','sub_group')

admin.site.register(Driver, DriverAdmin)

class EventAdmin(admin.ModelAdmin):
    list_display = ('driver_id','title','start','end')

class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('first_name','last_name','employment_status')
admin.site.register(CsEmployee, EmployeeAdmin)
