from ast import dump
import email
import hashlib
from itertools import tee
import random
from pprint import pprint
from tkinter.tix import Tree
from unittest import result
from urllib import response
from urllib.request import Request
from xml.etree.ElementTree import Comment
from cv2 import add
from django.shortcuts import redirect, render
from django.http import HttpResponse
from matplotlib.font_manager import json_dump, json_load
from numpy import str_
import requests
from .models import blog as blog_model
from Comment.models import Comment as comment_model
from Category.models import category as category_model
from ReplyComment.models import ReplyComment as repCMT
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import JsonResponse
import datetime
from User.models import Users as user_model
from django.core.mail import send_mail
def Home(request):
    check = 'iduser' in request.session
    if check == True:
        checklogin = True
    else:
        checklogin = False
    blog_new = blog_model.objects.all().order_by("-blog_id")[:5]
    category = category_model.objects.filter()
    # contentSearch = request.GET.get('search')
    if request.GET.get('search'):
        contentSearch = request.GET.get('search')
        blog_list = blog_model.objects.filter(blog_title=contentSearch)
        if len(blog_list) >= 1:
            paginator = Paginator(blog_list, 1000)
    else:
         blog_list = blog_model.objects.all()
         paginator = Paginator(blog_list, 6)
    if len(blog_list) >= 1:
        pageNumber = request.GET.get('page')
        try:
            listBlog = paginator.page(pageNumber)
        except PageNotAnInteger:
            listBlog = paginator.page(1)
        except EmptyPage:
            listBlog = paginator.page(paginator.num_pages)
    else:
        listBlog = ""
    data = {
        "blogs":listBlog,
        "blognew":blog_new,
        "categorys":category,
        "checklogin":checklogin
    }
    return render(request,'home.html',data)

def Category(request, slug):
    check = 'iduser' in request.session
    if check == True:
        checklogin = True
    else:
        checklogin = False
    id_category = category_model.objects.filter(category_slug = slug).first()
    blog_list = blog_model.objects.filter(category_id_id = id_category.category_id)
    category = category_model.objects.filter()
    blog_new = blog_model.objects.all().order_by("-blog_id")[:5]
    paginator = Paginator(blog_list, 4)
    pageNumber = request.GET.get('page')
    try:
        blogs = paginator.page(pageNumber)
    except PageNotAnInteger:
        blogs = paginator.page(1)
    except EmptyPage:
        blogs = paginator.page(paginator.num_pages)
    data = {
        "blogs":blogs,
        "blognew":blog_new,
        "categorys":category,
        "checklogin":checklogin
    }
    return render(request,"category.html",data)
def BlogDetails(request, slug):
    check = 'iduser' in request.session
    if check == True:
        checklogin = True
    else:
        checklogin = False
    blog_new = blog_model.objects.all().order_by("-blog_id")[:5]
    blog = blog_model.objects.filter(blog_slug=slug).first()
    category = category_model.objects.filter()
    comment = comment_model.objects.filter(Comment_blog_id_id=blog.blog_id)
    sumcomment = comment_model.objects.filter(Comment_blog_id_id=blog.blog_id).count()
    users = user_model.objects.all()
    # sumcomment = 0
    # replyCMT = []
    # for i in comment:
        # sumcomment+=1
        # sumcomment+= repCMT.objects.filter(Comment_id_id=i.Comment_id).count()
        # replyCMT.append(repCMT.objects.filter(Comment_id_id=i.Comment_id))
    data = {
        "blog":blog,
        "category":category,
        "blognew":blog_new,
        "comment":comment,
        "checklogin":checklogin,
        "sumcomment":sumcomment,
        "users":users
    }
    return render(request,'blogdetail.html',data)
def ajax(request):
    check = 'iduser' in request.session
    if check == False:
        return redirect('login')
    iduser = request.session["iduser"]
    comment = request.GET.get("comment")
    slug = request.GET.get("slug")
    blog_id = blog_model.objects.filter(blog_slug = slug).first()
    hanoi_tz = datetime.timezone(datetime.timedelta(hours=7))
    dt = datetime.datetime.now(hanoi_tz)
    date = dt.now()
    query = comment_model.objects.create(Comment_content = comment,Comment_blog_id_id = blog_id.blog_id,Comment_date = date,user_id_id = iduser)
def login(request):
    check = 'iduser' in request.session
    if check == True:
        return redirect('trang-chu')
    if request.POST.get("username"):
        return HttpResponse(request.POST.get("username"))
    checklogin = False
    blog_new = blog_model.objects.all().order_by("-blog_id")[:5]
    category = category_model.objects.filter()
    data = {
        "checklogin":checklogin,
        "blognew":blog_new,
        "categorys":category,
    }
    return render(request,'login.html',data)

def logout(request):
    check = 'iduser' in request.session
    if check == False:
        return redirect('trang-chu')
    del request.session["iduser"]
    return redirect('trang-chu')
def register(request):
    check = 'iduser' in request.session
    if check == True:
        return redirect('trang-chu')
    checklogin = False
    blog_new = blog_model.objects.all().order_by("-blog_id")[:5]
    category = category_model.objects.filter()
    data = {
        "checklogin":checklogin,
        "blognew":blog_new,
        "categorys":category,
    }
    return render(request,'register.html',data)
def AjaxRegister(request):
    check = "auth" in request.session
    if check == True:
        codeserver = str(request.session["auth"])
        codeclient = request.POST.get("code")
        if codeserver == codeclient:
            username = request.POST.get("username")
            password = request.POST.get("password")
            fullname = request.POST.get("fullname")
            email = request.POST.get("email")
            phone = request.POST.get("phone")
            address = request.POST.get("address")
            hanoi_tz = datetime.timezone(datetime.timedelta(hours=7))
            dt = datetime.datetime.now(hanoi_tz)
            date = dt.now()
            result = user_model.objects.create(User_name = fullname,User_username = username,User_password=password,
            User_date = date,User_img="blog/user.png",User_address = address,User_email = email,User_phone = phone)
            del request.session["auth"]
            if result.User_id:
                mess = "3"
            else:
                mess: "4"
            return HttpResponse(mess)
        else:
            return HttpResponse(0)
    return redirect('register')

def AjaxCheckInfo(request):
    if request.POST.get("username"):
        username = request.POST.get("username")
        checkUser = user_model.objects.filter(User_username = username).count()
        if checkUser == 0:
            return HttpResponse("1")
        else:
            return HttpResponse("0")
    if request.POST.get("checkmail"):
        email = request.POST.get("email")
        checkmail = user_model.objects.filter(User_email = email).count()
        return HttpResponse(checkmail)
def AjaxLogin(request):
    username = request.POST.get("username")
    password = request.POST.get("password")
    result = user_model.objects.filter(User_username=username,User_password=password).first()
    if result:
        mess="1"
        request.session["iduser"] = result.User_id
        request.session.set_expiry(86400)
    else:
        mess = "0"
    return HttpResponse(mess)
def AddBlog(request):
    check = 'iduser' in request.session
    if check == False:
        return redirect('login')
    blog_new = blog_model.objects.all().order_by("-blog_id")[:5]
    category = category_model.objects.filter()
    iduser = request.session["iduser"]
    username = user_model.objects.filter(User_id = iduser).first()
    if check == False:
        return redirect('login')
    if request.POST.get("name"):
        name = request.POST.get("name")
        idcategory = request.POST.get("category")
        img = "blog/"+request.POST.get("img")
        slug = request.POST.get("slug")
        content = request.POST.get("content")
        result = blog_model.objects.create(blog_title = name,blog_content = content,blog_img = img,blog_slug = slug,category_id_id = idcategory,user_id_id = iduser,blog_author = username.User_username)

    data = {
        "blognew":blog_new,
        "categorys":category,
    }
    return render(request,'addblog.html',data)

def EditBlog(request,slug):
    check = 'iduser' in request.session
    if check == False:
        return redirect('login')
    iduser = request.session["iduser"]
    authUpdate = blog_model.objects.filter(user_id_id = iduser,blog_slug = slug).count()
    if authUpdate == 0:
        return redirect('error404')
    blog = blog_model.objects.filter(blog_slug = slug).first()
    categoryOfBlog = category_model.objects.filter(category_id = blog.category_id_id).first()
    categorys = category_model.objects.all()
    blog_new = blog_model.objects.all().order_by("-blog_id")[:5]
    data = {
        "blog":blog,
        "category":categoryOfBlog,
        "categorys":categorys,
        "blognew":blog_new,
    }
    if request.POST.get("editblog"):
        name = request.POST.get("name")
        idcategory = request.POST.get("category")
        img = request.POST.get("img")
        slugg = request.POST.get("slug")
        content = request.POST.get("content")
        cs = blog_model.objects.filter(blog_slug = slug).update(blog_title = name,blog_content = content,blog_img = img,category_id_id = idcategory)
    return render(request,'editblog.html',data)
def DeleteBlog(request):
    check = 'iduser' in request.session
    if check == False:
        return redirect('login')
    if request.GET.get("delete"):
        iduser = request.session["iduser"]
        idblog = request.GET.get("id")
        authdelete = blog_model.objects.filter(blog_id = idblog,user_id_id = iduser).count()
        if authdelete == 1:
            blog_model.objects.filter(blog_id = idblog).delete()
            return HttpResponse(1)
    return HttpResponse(0)
    
def MyBlog(request):
    check = 'iduser' in request.session
    if check == False:
        return redirect('login')
    iduser = request.session['iduser']
    
    bloglist = blog_model.objects.filter(user_id_id = iduser)
    if bloglist:
        blogs = bloglist
    else:
        blogs = ""
    data = {
        "blogs":blogs
    }
    return render(request,'myblog.html',data)

def error404(request):
    return render(request,'error404.html')

def Profile(request):
    check = 'iduser' in request.session
    if check == False:
        return redirect('login')
    iduser = request.session["iduser"]
    user = user_model.objects.filter(User_id = iduser).first()
    data = {
        "user":user
    }
    return render(request,'profile.html',data)

def UpdateProfile(request):
    check = 'iduser' in request.session
    if check == False:
        return redirect('login')
    mess = 0
    iduser = request.session["iduser"]
    if request.POST.get("changeinfo"):
        fullname = request.POST.get("fullname")
        email = request.POST.get("email")
        phone = request.POST.get("phone")
        address = request.POST.get("address")
        img = request.POST.get("img")
        rs = user_model.objects.filter(User_id = iduser).update(
            User_name = fullname,User_email = email,User_phone = phone,User_address = address,User_img = img)
        mess = 4
    if request.POST.get("changepass"):
        passwordold = request.POST.get("passwordold")
        passwordnew = request.POST.get("passwordnew")
        passwordnewcf = request.POST.get("passwordnewcf")
        checkpassold = user_model.objects.filter(User_id = iduser,User_password = passwordold).count()
        if checkpassold == 1:
            if passwordnew == passwordnewcf:
                rs = user_model.objects.filter(User_id = iduser).update(User_password = passwordnew)
                mess = 1
            else:
                mess = 2
        else:
            mess = 3
    return HttpResponse(mess)    
def AuthUser(request):
    check = 'iduser' in request.session
    if check == True:
        return redirect('trang-chu')
    if request.POST.get("auth"):
        request.session["auth"] = random.randint(111111, 999999)
        request.session.set_expiry(300)
        code = request.session["auth"]
        email = request.POST.get("email")
        data = """
            Mã xác thực tài khoản của bạn là: """+str(code)+"""
        """
        rs = send_mail('XÁC THỰC TÀI KHOẢN', data, "PLC", [email], fail_silently=False)

        return HttpResponse(1)

    return HttpResponse("Có lỗi xảy ra")

def ForgotPassword(request):
    # kiểm tra người dùng đã đăng nhập hay chưa
    check = 'iduser' in request.session
    if check == True:
        return redirect('trang-chu')
    # gửi mã pin về mail
    if request.POST.get("username"):
        username = request.POST.get("username")
        user = user_model.objects.filter(User_username = username).first()
        email = user.User_email
        request.session["forgotpass"] = random.randint(111111, 999999)
        request.session.set_expiry(300)
        code = request.session["forgotpass"]
        data = """
            Mã xác thực tài khoản của bạn là: """+str(code)+"""
        """
        rs = send_mail('QUÊN MẬT KHẨU', data, "PLC", [email], fail_silently=False)
        if rs:
            return HttpResponse(1)
        else:
            return HttpResponse(0)
    # xác thực mã pin
    if request.POST.get("code"):
        if "forgotpass" in request.session:
            codesever = str(request.session["forgotpass"])
            codeclient = request.POST.get("code")
            if codeclient == codesever:
                return HttpResponse(1)
            else:
                return HttpResponse(0)
        else:
                return HttpResponse(2)
    #Thay đổi mật khẩu mới cho người dùng
    if request.POST.get("user"):
        user = request.POST.get("user")
        passwordnew = request.POST.get("passwordnew")
        rs = user_model.objects.filter(User_username = user).update(User_password = passwordnew)
        del request.session["forgotpass"]
        if rs:
            return HttpResponse(1)
        else:
            return HttpResponse(0)
    checklogin = False
    blog_new = blog_model.objects.all().order_by("-blog_id")[:5]
    category = category_model.objects.filter()
    data = {
        "checklogin":checklogin,
        "blognew":blog_new,
        "categorys":category,
    }
    return render(request,'forgotpassword.html',data)

def BlogList(request,username):
    checklogin = False
    if "iduser" in request.session:
        checklogin = True
        iduser = request.session["iduser"]
        check = user_model.objects.filter(User_id = iduser,User_username = username).count()
        if check == 1:
            return redirect('myblog')
    bloglist = blog_model.objects.filter(blog_author = username)
    if bloglist:
        blogs = bloglist
    else:
        blogs = ""
    data = {
        "blogs":blogs,
        "checklogin":checklogin
    }
    return render(request,'bloglist.html',data)

# giới thiệu
def About(request):
    checklogin = False
    if "iduser" in request.session:
        checklogin = True
    data = {
        "checklogin":checklogin
    }
    return render(request,'about.html',data)
# Liên hệ
def Contact(request):
    checklogin = False
    if "iduser" in request.session:
        checklogin = True
    data = {
        "checklogin":checklogin
    }
    return render(request,'contact.html',data)


