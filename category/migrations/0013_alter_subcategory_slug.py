# Generated by Django 4.0.1 on 2022-02-13 12:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0012_alter_category_category_offer'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subcategory',
            name='slug',
            field=models.SlugField(max_length=100, null=True, unique=True),
        ),
    ]
