from ast import Sub
from traceback import print_tb
from django.http import HttpResponse
from django.shortcuts import get_object_or_404, render
from store.models import Product
from category.models import Category, SubCategory
from carts.models import Cart, CartItem
from carts.views import _cart_id
# Create your views here.

def store(request,category_slug = None):
    categories = None
    products = None

    if category_slug != None:
        categories= get_object_or_404(Category, slug = category_slug)
        # print(categories.id)
        
        products = Product.objects.filter(category= categories,is_available = True)
        # print(products)
        product_count = products.count()
    else:
        products = Product.objects.all().filter(is_available = True)
        product_count = products.count()
    context = {
        'products':products,
        'product_count':product_count,
    }
    return render(request,'store/store.html',context)

def brand_store(request,brand_slug=None):
    brands = None
    products = None
    print('this is brand slug going to print')
    if brand_slug != None:
        print('this is brand slug going to print')
        print(brand_slug)
        # categories= get_object_or_404(Category, slug = category_slug)
        brands = get_object_or_404(SubCategory,slug = brand_slug)
        products = Product.objects.filter(brand = brands,is_available = True)
        print(products)
        print('--------products by brand')
        product_count = products.count()
    else:
        print('else condition going to print')
        products = Product.objects.all().filter(is_available = True)
        product_count = products.count()

    context = {
        'products':products,
        'product_count':product_count,
    }
    return render(request,'store/store.html',context)

def product_detail(request,category_slug=None,product_slug=None):
    try:
        print('single product')
        single_product = Product.objects.get(slug= product_slug)
       
        in_cart = CartItem.objects.filter(cart__cart_id = _cart_id(request),product = single_product).exists()
        print(single_product)
    except Exception as e:
        raise e
    context = {
        'single_product': single_product,
        'in_cart': in_cart,
    }
    return render(request,'store/product_detail.html',context)