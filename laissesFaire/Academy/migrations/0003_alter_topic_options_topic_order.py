# Generated by Django 4.2.7 on 2023-12-04 19:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Academy', '0002_alter_content_file'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='topic',
            options={'ordering': ['order']},
        ),
        migrations.AddField(
            model_name='topic',
            name='order',
            field=models.IntegerField(default=0),
        ),
    ]