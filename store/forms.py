from django import forms
from .models import Product,Variation


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['product_name', 'price', 'images', 'images_two',
                  'images_three', 'description', 'stock','category','brand']
   
    
        widgets = {
            'product_name':forms.TextInput(attrs={'class':'form-control'}),
            'price':forms.NumberInput(attrs={'class':'form-control'}),
            'images':forms.FileInput(attrs={'class':'form-control'}),
            'images_two':forms.FileInput(attrs={'class':'form-control'}),
            'images_three':forms.FileInput(attrs={'class':'form-control'}),
            'description':forms.Textarea(attrs={'class':'form-control'}),
            'stock':forms.NumberInput(attrs={'class':'form-control'}),
            'category':forms.Select(attrs={'class':'form-control'}),
            'brand':forms.Select(attrs={'class':'form-control'}),
    
        }
class VariationForm(forms.ModelForm):
    class Meta:
        model = Variation
        fields = ['product','variation_category', 'variation_value',]
        widgets = {
            'product':forms.Select(attrs={'class':'form-control'}),
            'variation_category':forms.Select(attrs={'class':'form-control'}),
            'variation_value':forms.TextInput(attrs={'class':'form-control'}),
    
        }

class ProductOfferForm(forms.ModelForm):

    class Meta:
        model = Product
        fields = ['product_name','offer']
        widgets = {
            'product_name':forms.TextInput(attrs={'class':'form-control'}),
            'offer':forms.TextInput(attrs= {'class':'form_control'}),
        }
