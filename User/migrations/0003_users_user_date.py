# Generated by Django 4.0.3 on 2022-05-29 10:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User', '0002_users_user_img'),
    ]

    operations = [
        migrations.AddField(
            model_name='users',
            name='User_date',
            field=models.DateTimeField(null=True),
        ),
    ]
