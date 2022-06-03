from django.db import models
from turtle import mode
from Blog.models import blog
from User.models import Users

# Create your models here.
class Comment(models.Model):
    Comment_id = models.AutoField(primary_key=True)
    Comment_blog_id = models.ForeignKey(blog,on_delete= models.CASCADE,null=False)
    Comment_content = models.TextField(null=False)
    Comment_date = models.DateTimeField(null=True)
    user_id = models.ForeignKey(Users,on_delete=models.CASCADE,null=True)
    def __str__(self):
        return f"{self.Comment_id}"

