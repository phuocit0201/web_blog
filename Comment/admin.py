from xml.etree.ElementTree import Comment
from django.contrib import admin
from .models import Comment
from turtle import mode

class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('Comment_id','Comment_blog_id')
    
admin.site.register(Comment,DepartmentAdmin)
# Register your models here.
