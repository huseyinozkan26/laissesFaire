# Generated by Django 4.2.7 on 2023-11-14 09:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lf_web', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='projects',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('header', models.CharField(max_length=144)),
                ('body', models.TextField(blank=True)),
                ('t_image', models.ImageField(upload_to='')),
                ('image_1', models.ImageField(blank=True, upload_to='')),
                ('image_2', models.ImageField(blank=True, upload_to='')),
                ('btn', models.CharField(blank=True, max_length=244)),
                ('href', models.CharField(blank=True, max_length=1144)),
            ],
        ),
    ]
