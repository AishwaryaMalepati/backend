"""scheduler URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home..
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.auth import views as auth_views
from scheduler.views import hello
from django.views.generic import TemplateView
from django.conf import settings
from django.contrib import staticfiles

from champschedule.forms import LoginForm
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('champschedule.urls')),
    url(r'^login/$', auth_views.login, name='login'),
    url(r'^logout/$', auth_views.logout, {'next_page': '/login'}),
    url(r'^hello/$', hello),
    url(r'^schedule/', include('schedule.urls')),
    url(r'^admin_tools/', include('admin_tools.urls')),
    url(r'^api/', include('rest_framework.urls')),

]

admin.site.site_header = 'Champschedule Administration'