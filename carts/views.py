import re
from statistics import quantiles
from django.shortcuts import get_object_or_404, redirect, render
from django.core.exceptions import ObjectDoesNotExist
from carts.models import Cart, CartItem
from django.http import HttpResponse, JsonResponse
from orders.models import AddressTable
from store.models import Product, Variation
from doctest import Example
from urllib import request
from django import http
from math import prod
from django.db.models import Q

##views here.

def _cart_id(request):
    cart = request.session.session_key
    if not cart:
        cart = request.session.create()
    return cart

def add_cart(request,product_id):
    current_user = request.user
    product = Product.objects.get(id=product_id) #get the product

    # If the user is authenticated
    if current_user.is_authenticated:
        product_variation = []
        if request.method == 'POST':
            for item in request.POST:
                key = item
                value = request.POST[key]

                try:
                    variation = Variation.objects.get(product=product, variation_category__iexact=key, variation_value__iexact=value)
                    product_variation.append(variation)
                except:
                    pass

        if int(request.POST['buy_now_btn'])==0:


            is_cart_item_exists = CartItem.objects.filter(product=product, user=current_user).exists()
            print(product_variation)
            if is_cart_item_exists:
                cart_item = CartItem.objects.filter(product=product, user=current_user)
                ex_var_list = []
                id = []
                for item in cart_item:
                    existing_variation = item.variations.all()[::-1]
                    ex_var_list.append(list(existing_variation))
                    id.append(item.id)
                print(ex_var_list)
                if product_variation in ex_var_list:
                    # increase the cart item quantity
                    index = ex_var_list.index(product_variation)
                    item_id = id[index]
                    item = CartItem.objects.get(product=product, id=item_id)
                    item.quantity += 1
                    item.save()

                else:
                    item = CartItem.objects.create(product=product, quantity=1, user=current_user)
                    if len(product_variation) > 0:
                        item.variations.clear()
                        item.variations.add(*product_variation)
                    item.save()
            else:
                cart_item = CartItem.objects.create(
                    product = product,
                    quantity = 1,
                    user = current_user,
                )
                if len(product_variation) > 0:
                    cart_item.variations.clear()
                    cart_item.variations.add(*product_variation)
                cart_item.save()
            return redirect('cart')
        else:
            a=''
            for i in product_variation:
                a+=str(i.id)+'-'
            request.session['buy_now']=a
            print(request.session['buy_now'])
            print('=============================================hhhhhhhhhhhhhhhhhhh')
            return redirect('checkout')
    # If the user is not authenticated
    else:
        product_variation = []
        if request.method == 'POST':
            for item in request.POST:
                key = item
                value = request.POST[key]

                try:
                    variation = Variation.objects.get(product=product, variation_category__iexact=key, variation_value__iexact=value)
                    product_variation.append(variation)
                except:
                    pass


        try:
            cart = Cart.objects.get(cart_id=_cart_id(request)) # get the cart using the cart_id present in the session
        except Cart.DoesNotExist:
            cart = Cart.objects.create(
                cart_id = _cart_id(request)
            )
        cart.save()
        print(product_variation)
        is_cart_item_exists = CartItem.objects.filter(Q(product=product) & Q(cart=cart)).exists()
        if is_cart_item_exists:
            print('ffd-------------------------------------------------------------')
            cart_item = CartItem.objects.filter(Q(product=product) & Q(cart=cart))
            ex_var_list = []
            id = []
            for item in cart_item:
                existing_variation = item.variations.all()[::-1]
                ex_var_list.append(list(existing_variation))
                id.append(item.id)

            print(ex_var_list)
            if product_variation in ex_var_list :
                index = ex_var_list.index(product_variation)
                item_id = id[index]
                item = CartItem.objects.get(product = product,id=item_id)
                item.quantity += 1
                item.save()
            else:
                item = CartItem.objects.create(product =product, quantity = 1,cart=cart)
                if len(product_variation) > 0:
                    item.variations.clear()
                    item.variations.add(*product_variation)
                item.save() 
            


        
        else:
            cart_item = CartItem.objects.create(
                product = product,
                quantity = 1,
                cart = cart,
            )
            if len(product_variation) > 0:
                cart_item.variations.clear()
                cart_item.variations.add(*product_variation)
            cart_item.save()
            return redirect('cart')
        
    


def add_btn_cart(request):
    mid=int(request.GET['mid'])
    total = float(request.GET['total'])
    cartitem = CartItem.objects.get(id=mid) #get the product
    if cartitem.product.stock > cartitem.quantity:
        cartitem.quantity += 1
        cartitem.save()
        sub_total = cartitem.sub_total()
        grand_total = total + cartitem.product.offer_price
        context ={
            'qty':cartitem.quantity,
            'sub':sub_total,
            'gt':grand_total,
            'f':0
        }
        return JsonResponse(context)
    else:
        return JsonResponse({'f':1})
        


def remove_cart(request):
    id=int(request.GET['mid'])
    total = float(request.GET['total'])
    cart_item = CartItem.objects.get(id = id)
    cart_item.quantity -= 1
    cart_item.save()
    sub_total = cart_item.sub_total()
    grand_total = total - cart_item.product.offer_price
    cart_item.save()
    context ={
            'qty':cart_item.quantity,
            'sub':sub_total,
            'gt':grand_total,
        }
    return JsonResponse(context)

def remove_cart_item(request,product_id,cart_item_id):
    product = get_object_or_404(Product, id = product_id)
    if request.user.is_authenticated:
        cart_item = CartItem.objects.get(product= product, user = request.user,id = cart_item_id)
    else:
        cart = Cart.objects.get(cart_id = _cart_id(request))
        product = get_object_or_404(Product, id = product_id)
        cart_item = CartItem.objects.get(product = product, cart = cart ,id = cart_item_id)
    cart_item.delete()
    return redirect('cart')


def cart(request,total =0,quantity = 0,cart_items =None):
    if request.session.has_key('buy_now'):
        del request.session['buy_now']
    grand_total = 0
    try:
        if request.user.is_authenticated:
    
            cart_items = CartItem.objects.filter(user = request.user,is_active =True)
        else:
            cart = Cart.objects.get(cart_id = _cart_id(request))
            cart_items = CartItem.objects.filter(cart = cart,is_active =True)
        for cart_item in cart_items:
            total += (cart_item.product.offer_price * cart_item.quantity)
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
        if request.session.has_key('email'):
            
            add_table =  AddressTable.objects.filter(user = request.user)
            if request.session.has_key('buy_now'):
                variation = request.session['buy_now']
                var_id=variation.split('-')
                print(var_id)
                varient=Variation.objects.get(id=int(var_id[0]))
                pro=Product.objects.get(id=varient.product.id)
                total=pro.offer_price
                grand_total=pro.offer_price
                quantity=1
                cart_items=None
            else:
                    cart_items = CartItem.objects.filter(user = request.user,is_active =True)
                    for cart_item in cart_items:
                        total += (cart_item.product.offer_price * cart_item.quantity)
                        quantity += cart_item.quantity
                    grand_total = total 
                    pro=None
                    
            context = {
            'total': total,
            'quantity' : quantity,
            'cart_items': cart_items,
            'grand_total':grand_total,
            'add_table':add_table,
            'pro':pro

        }     
            return render(request,'store/checkout.html',context)
                
    return redirect('login')