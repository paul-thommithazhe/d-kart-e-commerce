from django import forms
from .models import Order
from orders.models import *

class OrderForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ['first_name', 'last_name', 'phone', 'email', 'address_line_1',
                  'address_line_2', 'state', 'city']
class AddressTableForm(forms.ModelForm):
    class Meta:
        model = AddressTable
        fields = ['first_name', 'last_name', 'phone', 'email',
                  'address_line_1', 'address_line_2', 'state','city']
   
    
        widgets = {
            'first_name':forms.TextInput(attrs={'class':'form-control'}),
            'last_name':forms.TextInput(attrs={'class':'form-control'}),
            'phone':forms.TextInput(attrs={'class':'form-control'}),
            'email':forms.TextInput(attrs={'class':'form-control'}),
            'address_line_1':forms.TextInput(attrs={'class':'form-control'}),
            'address_line_2':forms.TextInput(attrs={'class':'form-control'}),
            'state':forms.TextInput(attrs={'class':'form-control'}),
            'city':forms.TextInput(attrs={'class':'form-control'}),
    
        }