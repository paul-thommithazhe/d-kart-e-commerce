# Generated by Django 4.0.1 on 2022-02-16 13:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0025_remove_product_size'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='offer_price',
            field=models.IntegerField(default=0),
        ),
    ]
