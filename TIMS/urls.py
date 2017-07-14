from django.conf.urls import url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from application.views import Base, Index, Login, Logout, ChangePassword
from application.views import UserInfo, CourseView, GradeTableView, GradeGraphView

app_name = 'tims'
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', Index.as_view(), name="index"),
    url(r'^logout/$', Logout.as_view(), name="logout"),
    url(r'^change_password/$', ChangePassword.as_view(), name="change_password"),
    url(r'^base/$', Base.as_view(), name="base"),
    url(r'^login/$', Login.as_view(), name="login"),
    url(r'^user', UserInfo.as_view(), name="user_info"),
    url(r'^course', CourseView.as_view(), name="course_info"),
    url(r'^gradeInfo/tables', GradeTableView.as_view(), name="gradeinfo"),
    url(r'^grade/statistics', GradeGraphView.as_view(), name="gradegraph"),
]

urlpatterns += staticfiles_urlpatterns()
