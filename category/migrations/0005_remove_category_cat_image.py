# Generated by Django 4.0.1 on 2022-02-07 18:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0004_alter_category_slug'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='category',
            name='cat_image',
        ),
    ]
