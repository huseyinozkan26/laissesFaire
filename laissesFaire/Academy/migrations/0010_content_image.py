# Generated by Django 4.2.7 on 2023-12-11 17:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Academy', '0009_watchedcontent_watched_percentage'),
    ]

    operations = [
        migrations.AddField(
            model_name='content',
            name='image',
            field=models.ImageField(blank=True, upload_to='static/assets/uploads/academy/contentImg'),
        ),
    ]
