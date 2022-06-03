# Generated by Django 4.0.3 on 2022-05-29 08:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('User', '0002_users_user_img'),
        ('Blog', '0006_alter_blog_blog_slug'),
    ]

    operations = [
        migrations.AddField(
            model_name='blog',
            name='user_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='User.users'),
        ),
    ]
