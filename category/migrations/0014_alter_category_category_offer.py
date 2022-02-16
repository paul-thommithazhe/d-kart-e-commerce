# Generated by Django 4.0.1 on 2022-02-16 08:55

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0013_alter_subcategory_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='category_offer',
            field=models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(90)]),
        ),
    ]