# -*- coding: utf-8 -*-
from django.contrib import admin

from application.models import AdminInfo, CourseInfo, TeacherInfo, StudentInfo, \
    TeacherCourse, StudentCourse

admin.site.register(AdminInfo)
admin.site.register(CourseInfo)
admin.site.register(TeacherInfo)
admin.site.register(StudentInfo)
admin.site.register(StudentCourse)
admin.site.register(TeacherCourse)
