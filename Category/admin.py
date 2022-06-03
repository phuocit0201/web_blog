from django.contrib import admin
from .models import category
# Register your models here.
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('category_name','category_slug','create_date')
    search_fields = ['category_name']
    list_filter = ('category_name','category_id')
admin.site.register(category,DepartmentAdmin)
