

from ast import Sub
from random import choice, choices
from tokenize import blank_re
from unicodedata import category
from wsgiref.simple_server import demo_app
from django.forms import CharField
from django.urls import reverse
from django.db import models
from accounts.models import Account
# Create your models here.
from category.models import Category, SubCategory
from django.db.models import CharField, Model
from django_mysql.models import ListCharField
from django.core.validators import MinValueValidator,MaxValueValidator

class Product(models.Model):
    brand = models.ForeignKey(SubCategory, on_delete=models.CASCADE,null=True)
    product_name = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(max_length=255, unique=True)
    description = models.TextField(max_length=500, blank=True)
    price = models.IntegerField()
    offer_price = models.IntegerField(default=0)
    offer = models.IntegerField(default=0,validators=[MinValueValidator(0),MaxValueValidator(90)])
    images = models.ImageField(upload_to='images/products', blank=True)
    images_two = models.ImageField(upload_to='images/products', blank=True)
    images_three = models.ImageField(upload_to='images/products', blank=True)
    stock = models.PositiveIntegerField()
    is_available = models.BooleanField(default=True)
    category = models.ForeignKey(Category,on_delete=models.CASCADE,null=True)
    created_date = models.DateTimeField(auto_now_add=True)
    modified_date = models.DateTimeField(auto_now_add=True)
    # size  = ListCharField(base_field=CharField(max_length=10),size = 4,max_length =(4 * 11),null = True)
    def get_url(self):
        return reverse('product_detail', args=[self.category.slug, self.slug])

    def __str__(self):
        return self.product_name

class VariationManager(models.Manager):
    def colors(self):
        return super(VariationManager,self).filter(variation_category = 'color', is_active = True)
    
    def sizes(self):
        return super(VariationManager,self).filter(variation_category = 'size', is_active = True)
    
variation_category_choice = (
    ('color', 'color'), 
    ('size', 'size'),
)


class Variation(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    variation_category = models.CharField(max_length=100, choices = variation_category_choice)
    variation_value = models.CharField(max_length=100)
    is_active = models.BooleanField(default=True)
    created_date = models.DateTimeField(auto_now=True)

    objects = VariationManager()
    
    class Meta:
        verbose_name        = 'Variation'
        verbose_name_plural = 'Variation'

        verbose_name_plural = 'Variations'
    def __str__(self):
        return self.variation_value

class Banner(models.Model):
    banner_title = models.CharField(max_length=50,blank=True)
    banner_img1 = models.ImageField(upload_to='images/banner',blank = True)
    banner_img2 = models.ImageField(upload_to='images/banner',blank = True)


    def __str__(self):
        return self.banner_title
class Wishlist(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    user = models.ForeignKey(Account, on_delete=models.CASCADE, null=True)


