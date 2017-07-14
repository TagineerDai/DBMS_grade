# DBMS_grade  
## Version Info  
+ Python 2.7.x  
    Hint: There is no MySQLdb support in Py3.
+ Django 1.10.5 or later
+ MySQL-python 1.2.3 or later    
+ MySQL 5.5 or later  
+ Bootstrap
+ jQuery
+ highcharts

## Installation Reference    
+ Python 2.7

+ Django(Py27)    
    https://docs.djangoproject.com/en/1.10/intro/install/  
    or `pip install django` with py27/pip installed before  

+ MySQL  
    `sudo apt-get mysql-server mysql-client libmysqlclient-dev`

+ MySQL&Python connector(two ways)
  - `pip install MySQL-python` with anaconda and py27/django installed before  
    ref: https://pypi.python.org/pypi/MySQL-python/1.2.5  
  - `pip install mysqlclient`  
    ref: http://www.jianshu.com/p/0d80366ca60c  

+ jQuery  
  `npm install jQuery`
+ highcharts  
    https://www.hcharts.cn/download

## Sample Code Repo
+ Quick Start - Stand alone django proj  
    https://www.djangoproject.com/start/  
+ A Back-end referece with MySQLdb  
    repo: https://github.com/yf999573/userproject  
    blogpost: http://blog.csdn.net/yf999573/article/details/53081196        
+ A Front-end design reference  
    repo: https://github.com/lvhuiyang/TIMS  
    demo: http://tims.lvhuiyang.cn/
+ The front-end theme
    doc: https://themes.getbootstrap.com/products/dashboard  
    doc:

## Steps to start the proj
+ Load the database
```
>>>mysql -u root -p
>>>(your password)
mysql>drop schema tims_db;
mysql>create database tims_db;
mysql>source tims_db;
```
+ Change the `/TIMS/settings.py`
with your own mysql setting.

+ Start the django service.  
```
>>>python manage.py makemigrations application
>>>python manage.py sqlmigrate application 0001
>>>python manage.py migrate
>>>python manage.py runserver
```

+ View the site at default `127.0.0.1:8000`
