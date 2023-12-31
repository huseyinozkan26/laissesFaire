# Generated by Django 4.2.7 on 2023-12-28 17:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lf_web', '0016_image_news_alter_image_image_alter_news_images'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='image',
            name='news',
        ),
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ImageField(upload_to='static/assets/upload/news'),
        ),
        migrations.AlterField(
            model_name='news',
            name='head_image',
            field=models.ImageField(upload_to='static/assets/upload/news'),
        ),
        migrations.AlterField(
            model_name='news',
            name='images',
            field=models.ManyToManyField(blank=True, to='lf_web.image'),
        ),
    ]
