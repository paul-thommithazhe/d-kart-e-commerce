from email.policy import default
from tabnanny import verbose
from django.db import models
from django.urls import reverse
from django.core.validators import MinValueValidator,MaxValueValidator
# Create your models here.
class Category(models.Model):
    category_name = models.CharField(max_length=50,unique= True)
    slug          = models.SlugField(max_length=255,unique= True)
    description   = models.TextField(max_length=255)
    category_offer = models.IntegerField(default = 0,validators=[MinValueValidator(0),MaxValueValidator(90)])
      
    class Meta:
        verbose_name        = 'category'
        verbose_name_plural = 'category'
    

    def get_url(self):
        return reverse('products_by_category',args=[self.slug])


    def __str__(self):
        return self.category_name 

class SubCategory(models.Model):
    brand_name = models.CharField(max_length=100)
    slug = models.SlugField(max_length=100,null=True,unique=True)
    create_date = models.DateTimeField(auto_now_add=True)

    def get_absolute_url(self):
        return reverse('products_by_brand',args=[self.slug])

    def __str__(self):
        return self.brand_name