# Generated by Django 4.0.1 on 2022-02-09 07:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0007_subcategory_category'),
        ('store', '0013_delete_variation'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='category',
        ),
        migrations.AddField(
            model_name='product',
            name='brand',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='category.subcategory'),
        ),
    ]
