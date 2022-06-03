from django.db import models
from turtle import mode

# Create your models here.
class Users(models.Model):
    User_id = models.AutoField(primary_key=True)
    User_username = models.CharField(max_length=50,null=False)
    User_password = models.CharField(max_length=100,null=False)
    User_name = models.CharField(max_length=50,null= False)
    User_img = models.TextField(null=True)
    User_email = models.CharField(max_length=100,null=True)
    User_phone = models.CharField(max_length=11,null=True)
    User_address = models.CharField(max_length=100,null=True)
    User_date = models.DateTimeField(null=True)
    def __str__(self):
        return f"{self.User_id}"

