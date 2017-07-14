# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User


# Entity
class CourseInfo(models.Model):
    class Meta:
        verbose_name = "CourseInfo"

    idCourseInfo = models.AutoField(primary_key=True, default="")
    cname = models.CharField(verbose_name="course_name", max_length=15, default="")
    lhour = models.IntegerField(verbose_name="learning_hour", default=0)
    credit = models.IntegerField(verbose_name="credit", default=0)
    semester = models.CharField(verbose_name="semester", max_length=15, default="")


class AdminInfo(models.Model):
    class Meta:
        verbose_name = "admin_info"
        permissions = (("admin_role", "Is an Admin"),)

    idAdminInfo = models.AutoField(primary_key=True, default="")
    user = models.OneToOneField(User, verbose_name="user", related_name="as_admin")
    username = models.CharField(verbose_name="user_name", max_length=15)

    def __str__(self):
        return self.username


class StudentInfo(models.Model):
    class Meta:
        verbose_name = "student_info"
        permissions = (("student_role", "Is a Student"),)

    idStudentInfo = models.AutoField(primary_key=True, default="")
    user = models.OneToOneField(User, verbose_name="user", related_name="as_student")
    sname = models.CharField(verbose_name="student_name", max_length=6)
    sex = models.CharField(verbose_name="sex", max_length=2)
    bdate = models.DateTimeField(verbose_name="birthdata")
    dept = models.CharField(verbose_name="department", max_length=8)
    classno = models.CharField(verbose_name="class number", max_length=15)

    def __str__(self):
        return self.sname


class TeacherInfo(models.Model):
    class Meta:
        verbose_name = "teacher_info"
        permissions = (("teacher_role", "Is a Teacher"),)

    idTeacherInfo = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, verbose_name="user", related_name="as_teacher")
    tname = models.CharField(verbose_name="teacher_name", max_length=6)
    sex = models.CharField(verbose_name="sex", max_length=2)
    dept = models.CharField(verbose_name="department", max_length=8)

    def __str__(self):
        return self.tname


# Relation
class TeacherCourse(models.Model):
    class Meta:
        verbose_name = "teacher_course"

    teacher = models.ForeignKey(TeacherInfo, verbose_name="teacher", on_delete=models.CASCADE)
    course = models.ForeignKey(CourseInfo, verbose_name="course", on_delete=models.CASCADE)


class StudentCourse(models.Model):
    class Meta:
        verbose_name = "student_course"

    student = models.ForeignKey(StudentInfo, on_delete=models.CASCADE, verbose_name="student")
    course = models.ForeignKey(CourseInfo, on_delete=models.CASCADE, verbose_name="course")
    grade = models.IntegerField(verbose_name="grade", default=0);
