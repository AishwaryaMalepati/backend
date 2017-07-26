from django.conf.urls import url, include
from rest_framework.urlpatterns import format_suffix_patterns
#from rest_framework_jwt.views import obtain_jwt_token
from . import views
from rest_framework.routers import DefaultRouter
from rest_framework import routers

# create a router and register our viewsets with it
router = routers.DefaultRouter()
router.register(r'employees',views.EmployeeViewSet)
router.register(r'groups',views.GroupViewSet)
router.register(r'events',views.EventEntityViewSet)

urlpatterns = [
    url(r'^$', views.home, name='home'),
    #url(r'^api/driver/$', views.drivers.as_view(), name='drivers'),
   # url(r'^api/eventlist/$', views.eventlist.as_view(), name='eventlist'),
  #  url(r'^api/event/(?P<id>[0-9]+)/$', views.event.as_view(), name='event'),
    url(r'^api/user/$', views.UserView.as_view({'get': 'list'}), name='user'),
    #url(r'^api-token-auth/', obtain_jwt_token),
    #url(r'^api/employee/', views.employee.as_view(), name='employee'),
   # url(r'^api/employee/(?P<id>[0-9]+)/$', views.employee.as_view(), name='employee'),
    url(r'^api/', include(router.urls)),
    ]

#urlpatterns = format_suffix_patterns(urlpatterns)