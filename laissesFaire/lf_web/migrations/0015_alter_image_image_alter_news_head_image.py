# Generated by Django 4.2.7 on 2023-12-20 19:20

from django.db import migrations, models
import lf_web.models


class Migration(migrations.Migration):

    dependencies = [
        ('lf_web', '0014_alter_team_member_role_alter_team_member_user_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ImageField(upload_to=lf_web.models.news_upload_to),
        ),
        migrations.AlterField(
            model_name='news',
            name='head_image',
            field=models.ImageField(upload_to=lf_web.models.news_upload_to),
        ),
    ]
