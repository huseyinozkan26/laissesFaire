# Generated by Django 4.2.7 on 2023-11-17 18:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lf_web', '0005_alter_sponsors_image_alter_sponsors_year'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sponsors',
            name='queue',
            field=models.IntegerField(),
        ),
    ]
