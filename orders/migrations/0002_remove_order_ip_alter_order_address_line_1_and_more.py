# Generated by Django 4.0.1 on 2022-02-11 08:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='ip',
        ),
        migrations.AlterField(
            model_name='order',
            name='address_line_1',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='order',
            name='address_line_2',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='order',
            name='phone',
            field=models.CharField(max_length=10),
        ),
    ]
