# Generated by Django 4.0.3 on 2022-05-22 02:49

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='blog',
            fields=[
                ('blog_id', models.AutoField(primary_key=True, serialize=False)),
                ('blog_title', models.CharField(max_length=50)),
                ('blog_content', models.TextField()),
                ('blog_img', models.ImageField(upload_to='')),
                ('blog_author', models.CharField(max_length=50)),
                ('blog_create_date', models.DateTimeField()),
            ],
        ),
    ]
