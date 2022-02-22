import email
from django.shortcuts import render
from orders.models import *
from accounts.models import Account
from store.models import Banner, Product
# Create your views here.

def home(request):
    # products = Product.objects.all().filter(is_available= True)
    banner = Banner.objects.all()
    products = [i for i in set(j.product for j in OrderProduct.objects.filter(order__is_ordered = True))]
    if request.session.has_key('buy_now'):
        del request.session['buy_now']
    if request.session.has_key('email'):
        user=Account.objects.get(email=request.session['email'])
    context = {
        'products':products,
        'banners':banner,
    }
    return render(request,'home/home.html',context)