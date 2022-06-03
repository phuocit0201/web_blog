from django.contrib import admin
from .models import blog
# Register your models here.
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('blog_title','blog_create_date')
    search_fields = ['blog_title','blog_id']
    list_filter = ('blog_title','blog_id')
admin.site.register(blog,DepartmentAdmin)
