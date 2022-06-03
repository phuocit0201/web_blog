from turtle import mode
from django.db import models

# Create your models here.
class category(models.Model):
    category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=50,null=False)
    create_date = models.DateTimeField(null=False,auto_now=True)
    category_slug = models.CharField(max_length=50,null=True)

    def __str__(self):
        return f"{self.category_name}"
