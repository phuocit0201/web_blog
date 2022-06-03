from pyexpat import model
from django.contrib import admin
from .models import Users
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('User_id','User_name','User_date')
    search_fields = ['User_id']
    list_filter = ('User_id','User_name')
admin.site.register(Users,DepartmentAdmin)