from django import forms
from .models import Product


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['product_name', 'price', 'images', 'images_two',
                  'images_three', 'description', 'stock',  'brand']
   
    
        widgets = {
            'product_name':forms.TextInput(attrs={'class':'form-control'}),
            'price':forms.NumberInput(attrs={'class':'form-control'}),
            'images':forms.FileInput(attrs={'class':'form-control'}),
            'images_two':forms.FileInput(attrs={'class':'form-control'}),
            'images_three':forms.FileInput(attrs={'class':'form-control'}),
            'description':forms.Textarea(attrs={'class':'form-control'}),
            'stock':forms.NumberInput(attrs={'class':'form-control'}),
            'brand':forms.Select(attrs={'class':'form-control'}),
        }
   