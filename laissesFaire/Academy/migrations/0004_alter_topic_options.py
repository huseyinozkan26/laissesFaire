# Generated by Django 4.2.7 on 2023-12-04 19:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Academy', '0003_alter_topic_options_topic_order'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='topic',
            options={'ordering': ['course', 'order']},
        ),
    ]