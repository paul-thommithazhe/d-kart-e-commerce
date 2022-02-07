
from django.db import models

# Create your models here.
class Banner(models.Model):
    banner_name = models.CharField(max_length=50,unique =True)
    banner_image1 = models.ImageField(upload_to='images/banner', blank=True)
    banner_image2 = models.ImageField(upload_to ='images/banner',blank=True)


    def __str__(self):
        return self.banner_name