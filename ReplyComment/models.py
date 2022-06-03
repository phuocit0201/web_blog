from django.db import models
from turtle import mode
from Comment.models import Comment

# Create your models here.
class ReplyComment(models.Model):
    ReplyComment_id = models.AutoField(primary_key=True)
    Comment_id = models.ForeignKey(Comment,on_delete= models.CASCADE,null=False)
    ReplyComment_content = models.TextField(null=False)
    ReplyComment_date = models.DateTimeField(null=False)

    def __str__(self):
        return f"{self.ReplyComment_content}"

