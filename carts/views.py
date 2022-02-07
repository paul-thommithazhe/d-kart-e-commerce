import re
from django.shortcuts import get_object_or_404, redirect, render
from django.core.exceptions import ObjectDoesNotExist
from carts.models import Cart, CartItem
from django.http import HttpResponse
from store.models import Product
from doctest import Example
from urllib import request
from django import http
from math import prod


##views here.

def _cart_id(request):
    cart = request.session.session_key
    if not cart:
        cart = request.session.create()
    return cart

def add_cart(request,product_id):
    product = Product.objects.get(id= product_id)
    if request.user.is_authenticated:
        try:
            cart_item = CartItem.objects.get(product = product, user = request.user)
            cart_item.quantity += 1
            cart_item.save()
        except CartItem.DoesNotExist:
            cart_item = CartItem.objects.create(
                product = product,
                quantity = 1,
                user = request.user,

            )
            cart_item.save()
    else:
        try:
            cart = Cart.objects.get(cart_id = _cart_id(request))
        except:
            Cart.DoesNotExist()
            cart = Cart.objects.create(
                cart_id = _cart_id(request)

            )
        cart.save()

        try:
            cart_item = CartItem.objects.get(product = product, cart = cart)
            cart_item.quantity += 1
            cart_item.save()
        except CartItem.DoesNotExist:
            cart_item = CartItem.objects.create(
                product = product,
                quantity = 1,
                cart = cart,

            )
            cart_item.save()
    # return HttpResponse(cart_item.product)
    # exit()
    return redirect('cart')

def remove_cart(request,product_id):
    product = get_object_or_404(Product,id = product_id)
    if request.user.is_authenticated:
        cart_item = CartItem.objects.get(product= product, user = request.user)
    else:
        cart = Cart.objects.get(cart_id = _cart_id(request))
        cart_item = CartItem.objects.get(product= product, cart= cart)

    
    if cart_item.quantity > 1 :
        cart_item.quantity -= 1
        cart_item.save()
    else:
        cart_item.delete()
    return redirect ('cart')

def remove_cart_item(request,product_id):
    product = get_object_or_404(Product, id = product_id)
    if request.user.is_authenticated:
        cart_item = CartItem.objects.get(product= product, user = request.user)
    else:
        cart = Cart.objects.get(cart_id = _cart_id(request))
        product = get_object_or_404(Product, id = product_id)
        cart_item = CartItem.objects.get(product = product, cart = cart)
    cart_item.delete()
    return redirect('cart')


def cart(request,total =0,quantity = 0,cart_items =None):
    grand_total = 0
    try:
        if request.user.is_authenticated:
    
            cart_items = CartItem.objects.filter(user = request.user,is_active =True)
        else:
            cart = Cart.objects.get(cart_id = _cart_id(request))
            cart_items = CartItem.objects.filter(cart = cart,is_active =True)
        for cart_item in cart_items:
            total += (cart_item.product.price * cart_item.quantity)
            quantity += cart_item.quantity
        
    except ObjectDoesNotExist:
        pass
    grand_total = total
    context = {
        'total': total,
        'quantity' : quantity,
        'cart_items': cart_items,
        'grand_total':grand_total,
    }
    return render(request,'store/cart.html' ,context)

def checkout(request,total =0,quantity = 0,cart_items =None):
    if request.user.is_authenticated:
        try:
             #getting the cart id by using the session id
            cart_items = CartItem.objects.filter(user = request.user,is_active =True)
            for cart_item in cart_items:
                total += (cart_item.product.price * cart_item.quantity)
                quantity += cart_item.quantity
            grand_total = total  
            context = {
            'total': total,
            'quantity' : quantity,
            'cart_items': cart_items,
            'grand_total':grand_total,

        }     
            return render(request,'store/checkout.html',context)
        except ObjectDoesNotExist:
            pass
    return redirect('login')