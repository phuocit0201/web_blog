from distutils.command.upload import upload

from django.http import HttpResponse
from Category.models import category
from django.db import models
from froala_editor.fields import FroalaField
import User
from User.models import Users
# Create your models here.
class blog(models.Model):
    blog_id = models.AutoField(primary_key=True)
    blog_title = models.CharField(max_length=50,null=False)
    blog_content = FroalaField()
    blog_slug = models.CharField(max_length=50,null=True)
    blog_img = models.ImageField(upload_to = 'blog',null=False)
    blog_author = models.CharField(max_length=50,null=False)
    blog_create_date = models.DateTimeField(null=False,auto_now=True)
    category_id = models.ForeignKey(category,on_delete=models.CASCADE,null=True)
    user_id = models.ForeignKey(Users, on_delete=models.CASCADE,null=True)
    def __str__(self):
        return f"{self.blog_id}"
   
