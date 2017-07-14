# -*- coding: utf8 -*-
from django.contrib.messages import get_messages
from django.urls import reverse
from django.views import View
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

from application.const import ROLE_INFO
from application.models import CourseInfo, TeacherInfo, AdminInfo, StudentInfo, StudentCourse, TeacherCourse
from django.contrib.auth.models import User


class CheckUserAuthenticatedMixin(object):
    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            messages.add_message(request, messages.INFO, '请先登录')
            return redirect(to=reverse("login"))
        else:
            return super(CheckUserAuthenticatedMixin, self).dispatch(request, *args, **kwargs)


class UserInfo(CheckUserAuthenticatedMixin, View):
    def get(self, request, *args, **kwargs):
        mode = request.GET.get('mode')
        prompt = ''
        if mode == 'modify':
            stuId = request.GET.get('stuId')
            teacherId = request.GET.get('teacherId')
            if stuId:
                request.session['stuId'] = stuId
                return render(request=request,
                              template_name="user_info.html",
                              context={
                                  "role": 'admin',
                                  'inModify': True,
                                  'AddStudent': True,
                                  'userId': stuId,
                                  'Prompt': "in modify stu"
                              })
            elif teacherId:
                request.session['teacherId'] = teacherId
                return render(request=request,
                              template_name="user_info.html",
                              context={
                                  "role": 'admin',
                                  'inModify': True,
                                  'AddTeacher': True,
                                  'userId': teacherId,
                                  'Prompt': "in modify tch"
                              })
        elif mode == 'delete':
            userId = request.GET.get('userId')
            try:
                User.objects.get(username=userId).delete()
                prompt = '[Delete Successfully] ' + userId
            except Exception, e:
                prompt = '[Delete Failed] ' + str(e)

        role = request.session['role']
        if role == "student":
            me = request.user.as_student
        elif role == "teacher":
            me = request.user.as_teacher
        elif role == "admin":
            me = request.user.as_admin

        students = StudentInfo.objects.all()
        teachers = TeacherInfo.objects.all()

        return render(request=request,
                      template_name="user_info.html",
                      context={"role": role,
                               "me": me,
                               'students': students,
                               'teachers': teachers,
                               'messages': get_messages(request),
                               'Prompt': prompt
                               })

    def post(self, request, *args, **kwargs):
        if request.POST.has_key("submit"):
            userId = request.POST["userId"]
            me = request.user.as_admin
            if userId:
                try:
                    teacher = TeacherInfo.objects.get(idTeacherInfo=userId)
                    return render(request=request,
                                  template_name="user_info.html",
                                  context={"role": "admin",
                                           "me": me,
                                           'teacher': teacher,
                                           })
                except Exception, e:
                    try:
                        student = StudentInfo.objects.get(idStudentInfo=userId)
                        return render(request=request,
                                      template_name="user_info.html",
                                      context={"role": "admin",
                                               "me": me,
                                               'student': student,
                                               })
                    except Exception, e:
                        prompt = '[Find Error] ' + str(e)
                        return render(request=request,
                                      template_name="user_info.html",
                                      context={"role": "admin",
                                               "me": me,
                                               "Prompt": prompt
                                               })
            else:
                students = StudentInfo.objects.all()
                teachers = TeacherInfo.objects.all()

                return render(request=request,
                              template_name="user_info.html",
                              context={"role": 'admin',
                                       "me": me,
                                       'students': students,
                                       'teachers': teachers,
                                       'messages': get_messages(request)
                                       })
        elif request.POST.has_key("AddStudent"):
            request.session['stuId'] = ''
            return render(request=request,
                          template_name="user_info.html",
                          context={"role": "admin",
                                   "AddStudent": True,
                                   })
        elif request.POST.has_key("AddTeacher"):
            request.session['teacherId'] = ''
            return render(request=request,
                          template_name="user_info.html",
                          context={"role": "admin",
                                   "AddTeacher": True,
                                   })
        elif request.POST.has_key("stuConfirm"):

            password = request.POST['passwd']
            sname = request.POST['sname']
            sex = request.POST['sex']
            bdate = request.POST['bdate']
            dept = request.POST['dept']
            classno = request.POST['classno']
            prompt = ''
            if not request.session['stuId'] :
                idStudentInfo = request.POST['idStudentInfo']
                if sname and sex and password \
                        and bdate and dept and classno:
                    try:
                        user = User.objects.create_user(idStudentInfo, '', password)
                        StudentInfo.objects.create(
                            idStudentInfo=idStudentInfo,
                            user=user,
                            sname=sname,
                            sex=sex,
                            bdate=bdate,
                            dept=dept,
                            classno=classno,
                        )
                        prompt = '[Create Student Successfully] ' + idStudentInfo
                    except Exception, e:
                        prompt = '[Create Student Failed] ' + str(e)
                else:
                    prompt = '[Create Student Failed] Incalid Info'
            else:
                idStudentInfo = request.session['stuId']
                request.session['stuId'] = ''
                if sname and sex and password \
                        and bdate and dept and classno:
                    try:
                        student = StudentInfo.objects.get(
                            idStudentInfo=idStudentInfo,
                        )
                        user = student.user
                        user.password = password
                        user.save()
                        student.sname = sname
                        student.sex = sex
                        student.bdate = bdate
                        student.dept = dept
                        student.classno = classno
                        student.save()
                        prompt = '[Modify Student Successfully] ' + idStudentInfo
                    except Exception, e:
                        prompt = '[Modify Student Failed] ' + str(e)
            return render(request=request,
                          template_name="user_info.html",
                          context={"role": "admin",
                                   "Prompt": prompt,
                                   "me": request.user.as_admin
                                   })
        elif request.POST.has_key("tchConfirm"):

            password = request.POST['passwd']
            tname = request.POST['tname']
            sex = request.POST['sex']
            dept = request.POST['dept']
            prompt = ''
            if not request.session['teacherId']:
                idTeacherInfo = request.POST['idTeacherInfo']
                if idTeacherInfo and tname and sex \
                        and password and dept:
                    try:
                        user = User.objects.create_user(idTeacherInfo, '', password)
                        TeacherInfo.objects.create(
                            idTeacherInfo=idTeacherInfo,
                            user=user,
                            tname=tname,
                            sex=sex,
                            dept=dept,
                        )
                        prompt = '[Create Teacher Successfully] ' + idTeacherInfo
                    except Exception, e:
                        prompt = '[Create Teacher Failed] ' + str(e)
                else:
                    prompt = '[Create Teacher Failed] Invalid Info'
            else:
                idTeacherInfo = request.session['teacherId']
                request.session['teacherId'] = ''
                if tname and sex and password and dept:
                    try:
                        teacher = TeacherInfo.objects.get(
                            idTeacherInfo=idTeacherInfo
                        )
                        user=teacher.user
                        user.password = password
                        user.save()
                        teacher.tname=tname,
                        teacher.sex=sex,
                        teacher.dept=dept,
                        teacher.save()
                        prompt = '[Modify Teacher Successfully] ' + idTeacherInfo
                    except Exception, e:
                        prompt = '[Modify Teacher Failed] ' + str(e)
            return render(request=request,
                          template_name="user_info.html",
                          context={"role": "admin",
                                   "Prompt": prompt,
                                   "me": request.user.as_admin
                                   })

        mode = request.GET.get('mode')
        prompt = ''
        if mode == 'modify':
            stuId = request.GET.get('stuId')
            teacherId = request.GET.get('teacherId')
            if stuId:
                request.session['stuId'] = stuId
                return render(request=request,
                              template_name="user_info.html",
                              context={
                                  "role": 'admin',
                                  'inModify': True,
                                  'AddStudent': True,
                                  'userId': stuId,
                                  'Prompt': "in modify stu"
                              })
            elif teacherId:
                request.session['teacherId'] = teacherId
                return render(request=request,
                              template_name="user_info.html",
                              context={
                                  "role": 'admin',
                                  'inModify': True,
                                  'AddTeacher': True,
                                  'userId': teacherId,
                                  'Prompt': "in modify tch"
                              })
        elif mode == 'delete':
            userId = request.GET.get('userId')
            try:
                User.objects.get(username=userId).delete()
                prompt = '[Delete Successfully] ' + userId
            except Exception, e:
                prompt = '[Delete Failed] ' + str(e)

        role = request.session['role']
        if role == "student":
            me = request.user.as_student
        elif role == "teacher":
            me = request.user.as_teacher
        elif role == "admin":
            me = request.user.as_admin

        students = StudentInfo.objects.all()
        teachers = TeacherInfo.objects.all()

        return render(request=request,
                      template_name="user_info.html",
                      context={"role": role,
                               "me": me,
                               'students': students,
                               'teachers': teachers,
                               'messages': get_messages(request),
                               'Prompt': prompt
                               })


class Base(View):
    def get(self, request, *args, **kwargs):
        return render(request=request, template_name="base.html")


class Index(View):
    def get(self, request, *args, **kwargs):
        return render(request=request, template_name="index.html", context={"messages": get_messages(request)})


class Login(View):
    def get(self, request, *args, **kwargs):
        return render(request=request, template_name="login.html", context={"messages": get_messages(request)})

    def post(self, request, *args, **kwargs):
        user = authenticate(username=request.POST['username'], password=request.POST['password'])
        role = request.POST['role']
        auth = True
        if user:
            try:
                if role == 'student':
                    rr = user.as_student
                elif role == 'teacher':
                    rr = user.as_teacher
                elif role == 'admin':
                    rr = user.as_admin
                else:
                    auth = False
            except:
                auth = False
        else:
            auth = False
        if auth:
            login(request, user)
            request.session['role'] = role
            return redirect(to=reverse("index"))
        else:
            messages.add_message(request, messages.INFO, '登录失败, 请检查用户名密码')
            return redirect(to=reverse("login"))


class Logout(CheckUserAuthenticatedMixin, View):
    def get(self, request, *args, **kwargs):
        logout(request)
        messages.add_message(request, messages.INFO, '成功退出系统， 您当前已退出。')
        return redirect(to="login")



class ChangePassword(CheckUserAuthenticatedMixin, View):
    def get(self, request, *args, **kwargs):
        return render(request=request,
                      template_name="change_password.html",
                      context={"messages": get_messages(request)})

    def post(self, request, *args, **kwargs):
        old_password = request.POST['old_password']
        new_password = request.POST['new_password']
        confirm_password = request.POST['confirm_password']
        if confirm_password != new_password or len(new_password) < 8:
            messages.add_message(request, messages.INFO, '修改失败, 两次密码输入不一致或者新密码长度不规范')
            return redirect(to="change_password")
        if not request.user.check_password(old_password):
            messages.add_message(request, messages.INFO, '修改失败, 原密码不正确')
            return redirect(to="change_password")
        try:
            request.user.set_password(new_password)
            request.user.save()
        except Exception:
            messages.add_message(request, messages.INFO, '修改失败')
            return redirect(to="change_password")
        else:
            messages.add_message(request, messages.INFO, '修改成功')
            return redirect(to="login")
