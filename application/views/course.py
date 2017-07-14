# -*- coding: utf8 -*-
from django.shortcuts import render, redirect
from django.views import View
from application.views import CheckUserAuthenticatedMixin
from application.models import CourseInfo, TeacherInfo, AdminInfo, StudentInfo, StudentCourse, TeacherCourse


class CourseView(CheckUserAuthenticatedMixin, View):
    def get(self, request, *args, **kwargs):
        courseId = request.GET.get('courseId')
        mode = request.GET.get('mode')
        prompt = ''
        if mode == 'Modify':
            request.session['courseId'] = courseId
            return render(request=request,
                          template_name="course.html",
                          context={
                              "inModify": True,
                              "inAdd": True,
                              "courseId": courseId,
                          })
        elif mode == 'Add':
            return render(request=request,
                          template_name="course.html",
                          context={
                              "inAdd": True
                          })
        elif courseId > 0:
            try:
                CourseInfo.objects.get(idCourseInfo=courseId).delete()
                prompt = "[Delete successfully] " + str(courseId)
            except Exception, e:
                prompt = "[Delete failed] " + str(courseId)
        me = request.user
        role = request.session['role']
        courses = None
        if role == 'admin':
            courses = CourseInfo.objects.all()
        else:
            if role == 'teacher':
                teacher = me.as_teacher
                courses = TeacherCourse.objects.filter(teacher=teacher)
            elif role == 'student':
                student = me.as_student
                courses = StudentCourse.objects.filter(student=student)
            tempCourse = []
            for eachCourse in courses:
                tempCourse.append(eachCourse.course)
            courses = tempCourse

        return render(request=request,
                      template_name="course.html",
                      context={
                          "role": role,
                          "course": courses,
                          "Prompt": prompt,
                      })

    def post(self, request, *args, **kwargs):
        role = request.session['role']
        if request.POST.has_key("afirmInfo"):
            courseId = request.POST["courseId"]
            cname = request.POST['cname']
            lhour = request.POST['lhour']
            credit = request.POST['credit']
            semester = request.POST['semester']
            teacherId = request.POST['teacherId']
            if courseId and cname and lhour \
                    and credit and (semester in [u'春', u'秋']):
                try:
                    teacher = TeacherInfo.objects.get(idTeacherInfo=teacherId)
                    course = CourseInfo.objects.create(
                        idCourseInfo=courseId,
                        cname=cname,
                        lhour=lhour,
                        credit=credit,
                        semester=semester,
                    )
                    TeacherCourse.objects.create(teacher=teacher, course=course)

                    prompt = "[Create Successful] " + courseId
                except Exception,e:
                    prompt = "[Create Failed] " + str(e)
            else:
                prompt = "[Invalid Infomation]"
            courses = CourseInfo.objects.all()
            return render(request=request,
                          template_name="course.html",
                          context={
                              "role": role,
                              "course": courses,
                              "Prompt": prompt,
                          })
        elif request.POST.has_key("mfirmInfo"):
            courseId = request.session['courseId']
            request.session['courseId'] = ''
            cname = request.POST['cname']
            lhour = request.POST['lhour']
            credit = request.POST['credit']
            semester = request.POST['semester']
            if cname and lhour and credit \
                and (semester in [u'春', u'秋']):
                try:
                    course = CourseInfo.objects.get(
                        idCourseInfo=courseId,
                    )

                    course.cname=cname
                    course.lhour = lhour
                    course.credit = credit
                    course.semester = semester
                    course.save()
                    prompt = "[Modify Successful] " + courseId
                except Exception,e:
                    prompt = "[Modify Failed] " + str(e)
            else:
                prompt = "[Invalid Infomation]"
            courses = CourseInfo.objects.all()
            return render(request=request,
                          template_name="course.html",
                          context={
                              "role": role,
                              "course": courses,
                              "Prompt": prompt,
                          })
        courseId = request.GET.get('courseId')
        mode = request.GET.get('mode')
        prompt = ''
        if mode == 'Modify':
            request.session['courseId'] = courseId
            return render(request=request,
                          template_name="course.html",
                          context={
                              "inModify": True,
                              "inAdd": True,
                              "courseId": courseId,
                          })
        elif mode == 'Add':
            return render(request=request,
                          template_name="course.html",
                          context={
                              "inAdd": True
                          })
        elif courseId > 0:
            try:
                CourseInfo.objects.get(idCourseInfo=courseId).delete()
                prompt = "[Delete successfully] " + str(courseId)
            except Exception, e:
                prompt = "[Delete failed] " + str(courseId)
        me = request.user
        role = request.session['role']
        courses = None
        if role == 'admin':
            courses = CourseInfo.objects.all()
        else:
            if role == 'teacher':
                teacher = me.as_teacher
                courses = TeacherCourse.objects.filter(teacher=teacher)
            elif role == 'student':
                student = me.as_student
                courses = StudentCourse.objects.filter(student=student)
            tempCourse = []
            for eachCourse in courses:
                tempCourse.append(eachCourse.course)
            courses = tempCourse

        return render(request=request,
                      template_name="course.html",
                      context={
                          "role": role,
                          "course": courses,
                          "Prompt": prompt,
                      })
