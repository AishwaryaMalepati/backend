from django.conf.urls import url, include
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework_jwt.views import obtain_jwt_token
from . import views
from rest_framework.routers import DefaultRouter, Route
from rest_framework import routers

# create a router and register our viewsets with it
router = routers.DefaultRouter()
router.register(r'events',views.EventViewSet, 'Event')
router.register(r'employees', views.EmployeeGroupViewSet)
router.register(r'employeegroup', views.EmployeeViewSet)
router.register(r'groups', views.GroupViewSet)
router.register(r'subgroups', views.SubgroupViewSet)
router.register(r'employeelocations', views.LocationTrackViewSet, 'LocationTrack')
router.register(r'createschedule', views.CreateScheduleViewSet, 'CreateSchedule')
router.register(r'locations',views.EventLocationViewSet)
router.register(r'perdiem',views.PerdiemViewSet)

class BulkDeleteRouter(DefaultRouter):
    """
    a custom URL router for the Product API that correctly routes
    DELETE requests with multiple query parameters.
    """
    def __init__(self, *args, **kwargs):
        super(BulkDeleteRouter, self).__init__(*args, **kwargs)
        self.routes += [
            Route(
                url=r'^{prefix}{trailing_slash}$',
                mapping={'delete': 'destroy'},
                name='{basename}-delete',
                initkwargs={'suffix': 'Delete'}
            ),
        ]

bulk_delete_router = BulkDeleteRouter()
bulk_delete_router.register(r'bulkdelete', views.CreateScheduleViewSet, base_name='bulkdelete')

#router.register(r'employees',views.EmployeeViewSet)
urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^api/user/$', views.UserView.as_view({'get': 'list'}), name='user'),
    url(r'^api-token-auth/', obtain_jwt_token),
    url(r'^api/', include(router.urls)),
    url(r'^api/', include(bulk_delete_router.urls, namespace='api')),
    ]

#urlpatterns = format_suffix_patterns(urlpatterns)

