from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import WmsDriver

class DriverAdmin(admin.ModelAdmin):
    list_display = ('first_name','last_name','dob','license_number')

admin.site.register(WmsDriver, DriverAdmin)
