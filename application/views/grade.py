# -*- coding: utf8 -*-
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.views import View
from django.contrib.messages import get_messages
import json
from application.views import CheckUserAuthenticatedMixin
from application.models import CourseInfo, TeacherInfo, AdminInfo, StudentInfo, StudentCourse, TeacherCourse


class GradeTableView(CheckUserAuthenticatedMixin, View):
    def get(self, request, *args, **kwargs):
        mode = request.GET.get('mode')
        stuId = request.GET.get('stuId')
        courseId = request.GET.get('courseId')
        role = request.session['role']
        Prompt = ''
        if mode == 'delete':
            try:
                stuCourse = StudentCourse.objects.get(student_id=stuId, course_id=courseId)
                stuCourse.grade = -1
                stuCourse.save()
                Prompt = "[Delete successfully] " + stuId
            except Exception, e:
                Prompt = "[Delete Failed] " + str(e)
        elif mode == 'modify':
            newGrade = request.GET.get('newGrade')
            if newGrade:
                try:
                    stuCourse = StudentCourse.objects.get(student_id=stuId, course_id=courseId)
                    stuCourse.grade = int(newGrade)
                    stuCourse.save()
                    Prompt = "[Modify successfully] " + stuId
                except Exception, e:
                    Prompt = "[Modify Failed] " + str(e)
            else:
                request.session["stuId"] = stuId
                request.session["courseId"] = courseId
                return render(request=request,
                              template_name="GradeInfo/tables.html",
                              context={
                                  "Prompt": Prompt,
                                  "Modify": True
                              })
        else:
            if role == 'admin':
                courses = CourseInfo.objects.all()
            else:
                if role == 'teacher':
                    teacher = request.user.as_teacher
                    courses = TeacherCourse.objects.filter(teacher=teacher)
                elif role == 'student':
                    student = request.user.as_student
                    courses = StudentCourse.objects.filter(student=student)
                tempCourse = []
                for eachCourse in courses:
                    tempCourse.append(eachCourse.course)
                courses = tempCourse
            return render(request=request,
                          template_name="GradeInfo/tables.html",
                          context={
                              "course": courses,
                          })
        return render(request=request,
                      template_name="GradeInfo/tables.html",
                      context={
                          "Prompt": Prompt
                      })

    def post(self, request, *args, **kwargs):
        role = request.session['role']
        tchCourses = {}
        stuCourses = {}
        courses = {}
        Prompt = ""
        if request.POST.has_key("submit"):
            course_id = request.POST['idCourseInfo']
            if course_id:
                if role == 'teacher':
                    teacher = request.user.as_teacher
                    tchCourses = TeacherCourse.objects.filter(course_id=course_id, teacher=teacher)
                    stuCourses = StudentCourse.objects.filter(course_id=course_id)

                elif role == 'admin':
                    tchCourses = TeacherCourse.objects.filter(course_id=course_id)
                    stuCourses = StudentCourse.objects.filter(course_id=course_id)
                else:
                    student = request.user.as_student
                    tchCourses = TeacherCourse.objects.filter(course_id=course_id)
                    stuCourses = StudentCourse.objects.filter(course_id=course_id, student=student)
        elif request.POST.has_key('modify'):
            newGrade = int(request.POST['newGrade'])
            stuId = int(request.session['stuId'])
            courseId = int(request.session['courseId'])
            path = request.path + ".html/?mode=modify&stuId=%d&courseId=%d&newGrade=%d" % (stuId, courseId, newGrade)
            request.session['stuId'] = ''
            request.session['courseId'] = ''
            return HttpResponseRedirect(path)

        if (tchCourses.__len__() == 0) or (stuCourses.__len__() == 0):
            if role == 'admin':
                courses = CourseInfo.objects.all()
            else:
                if role == 'teacher':
                    teacher = request.user.as_teacher
                    courses = TeacherCourse.objects.filter(teacher=teacher)
                elif role == 'student':
                    student = request.user.as_student
                    courses = StudentCourse.objects.filter(student=student)
                tempCourse = []
                for eachCourse in courses:
                    tempCourse.append(eachCourse.course)
                courses = tempCourse
        return render(request=request,
                      template_name="GradeInfo/tables.html",
                      context={
                          "tchCourses": tchCourses,
                          "stuCourses": stuCourses,
                          "Prompt": Prompt,
                          "role": role,
                          "course": courses,
                      })
        mode = request.GET.get('mode')
        stuId = request.GET.get('stuId')
        courseId = request.GET.get('courseId')
        role = request.session['role']
        Prompt = ''
        if mode == 'delete':
            try:
                stuCourse = StudentCourse.objects.get(student_id=stuId, course_id=courseId)
                stuCourse.grade = -1
                stuCourse.save()
                Prompt = "[Delete successfully] " + stuId
            except Exception, e:
                Prompt = "[Delete Failed] " + str(e)
        elif mode == 'modify':
            newGrade = request.GET.get('newGrade')
            if newGrade:
                try:
                    stuCourse = StudentCourse.objects.get(student_id=stuId, course_id=courseId)
                    stuCourse.grade = int(newGrade)
                    stuCourse.save()
                    Prompt = "[Modify successfully] " + stuId
                except Exception, e:
                    Prompt = "[Modify Failed] " + str(e)
            else:
                request.session["stuId"] = stuId
                request.session["courseId"] = courseId
                return render(request=request,
                              template_name=request.path,
                              context={
                                  "Prompt": Prompt,
                                  "Modify": True
                              })
        else:
            if role == 'admin':
                courses = CourseInfo.objects.all()
            else:
                if role == 'teacher':
                    teacher = request.user.as_teacher
                    courses = TeacherCourse.objects.filter(teacher=teacher)
                elif role == 'student':
                    student = request.user.as_student
                    courses = StudentCourse.objects.filter(student=student)
                tempCourse = []
                for eachCourse in courses:
                    tempCourse.append(eachCourse.course)
                courses = tempCourse
            return render(request=request,
                          template_name="GradeInfo/tables.html",
                          context={
                              "course": courses,
                          })
        return render(request=request,
                      template_name="GradeInfo/tables.html",
                      context={
                          "Prompt": Prompt
                      })


class GradeGraphView(CheckUserAuthenticatedMixin, View):
    def get(self, request, *args, **kwargs):
        role = request.session['role']
        courses = {}
        if role == "student":
            glist = []
            me = request.user.as_student
            sname = me.sname
            sid = me.idStudentInfo
            graderecs = StudentCourse.objects.filter(student_id = sid)
            for rec in graderecs:
                grec = []
                course = CourseInfo.objects.get(idCourseInfo = rec.course_id)
                grec.append(course.cname)
                grec.append(rec.grade)
                glist.append(grec)
            return render(request=request,
                      template_name="GradeInfo/statistics.html",
                      context = {
                      "sname" : json.dumps(sname),
                      "role" : role,
                      "glist" : json.dumps(glist),
                      "select" : False,
                      })
        elif role == "teacher":
            glist = []
            clist = []
            me = request.user.as_teacher
            tid = me.idTeacherInfo
            c_recs = TeacherCourse.objects.filter(teacher_id = tid)
            for c in c_recs:
                course = CourseInfo.objects.get(idCourseInfo = c.course_id)
                clist.append(course.cname)
            for i in range(9):
                left = 100 - (i+1)*10
                right = 100 - i*10
                label = '('+str(left)+','+str(right)+']'
                counts = []
                for c in c_recs:
                    courses = StudentCourse.objects.filter(course_id = c.course_id)
                    count = 0
                    for cc in courses:
                    	if cc.grade > left and cc.grade <= right:
                    		count = count + 1
                    counts.append(count)
                glist.append({"name": label, "data": counts})
            label = '[0,10]'
            counts = []
            for c in c_recs:
                courses = StudentCourse.objects.filter(course_id = c.course_id)
                count = 0
                for cc in courses:
                	if cc.grade >=0 and cc.grade <= 10:
                		count = count + 1
                counts.append(count)
            glist.append({"name": label, "data": counts})
            return render(request=request,
                      template_name="GradeInfo/statistics.html",
                      context = {
                      "tname" : json.dumps(me.tname),
                      "role" : role,
                      "clist" : json.dumps(clist),
                      "glist" : json.dumps(glist),
                      })
        else:
        	courses = CourseInfo.objects.all()
        return render(request=request,
                      template_name="GradeInfo/statistics.html",
                      context = {
                      "role" : role,
                      "courses" : courses,
                      "select" : False,
                      })

    def post(self, request, *args, **kwargs):
        role = request.session['role']
        if request.POST.has_key("submit"):
            course_id = request.POST['idCourseInfo']
            if course_id:
                if role == 'admin':
                    try: 
                        course = CourseInfo.objects.get(idCourseInfo = course_id)
                    except:
                        courses = CourseInfo.objects.all()
                        return render(request=request,
                            template_name="GradeInfo/statistics.html",
                            context = {
                            "role" : role,
                            "courses" : courses,
                            "select" : False,
                            })
                    cname = course.cname
                    courses = StudentCourse.objects.filter(course_id=course_id)
                    glist = []
                    for i in range(10):
                        grec = []
                        left = 100 - (i+1)*10
                        right = 100 - i*10
                        label = '('+str(left)+','+str(right)+']'
                        count = 0
                        for c in courses:
                            if c.grade>left and c.grade<right:
                                count = count + 1
                        grec.append(label)
                        grec.append(count)
                        glist.append({'name':label, 'y':count})
                    grec = []
                    grec.append('0')
                    count = courses.filter(grade=0).count()
                    grec.append(count)
                    glist.append({'name':'0', 'y':count})
                    return render(request=request,
                                  template_name="GradeInfo/statistics.html",
                                  context={
                                      "glist" : json.dumps(glist),
                                      "cname" : json.dumps(cname),
                                      "role": role,
                                      "select" : True,
                                  })
        courses = CourseInfo.objects.all()
        return render(request=request,
                      template_name="GradeInfo/statistics.html",
                      context = {
                      "role" : role,
                      "courses" : courses,
                      "select" : False,
                      })
