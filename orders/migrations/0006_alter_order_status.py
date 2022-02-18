# Generated by Django 4.0.1 on 2022-02-17 10:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0005_addresstable'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('New', 'New'), ('Accepted', 'Accepted'), ('pending', 'pending'), ('Completed', 'Completed'), ('Cancelled', 'Cancelled')], default='New', max_length=10),
        ),
    ]
