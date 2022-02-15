import email
from django.shortcuts import render
from accounts.models import Account
from store.models import Product
# Create your views here.

def home(request):
    products = Product.objects.all().filter(is_available= True)
    if request.session.has_key('email'):
        user=Account.objects.get(email=request.session['email'])
    context = {
        'products':products,
    }
    return render(request,'home/home.html',context)