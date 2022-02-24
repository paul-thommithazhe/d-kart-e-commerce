from ast import Add
from email import message
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib.auth import authenticate
from django.contrib import messages, auth
from orders.forms import AddressTableForm
# from orders.forms import AddressTableForm

from orders.models import *
from .twilio import otp_send,otp_verify
from carts.models import Cart,CartItem
from django.http import HttpResponse
from .forms import RegistrationForm, UserForm
from carts.views import _cart_id
from .models import Account
from decouple import config
import os
import re


# Create your views here.


def register(request):
    count = 0
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        print('form',form)
        if form.is_valid():
            first_name = form.cleaned_data['first_name'].lower()
            
            last_name = form.cleaned_data['last_name'].lower()
            phone_number = form.cleaned_data['phone_number']
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            username = email.split("@")[0]
            # if not Account.objects.filter(email=email).exists():
            #     print('email already exists :' ,email)
            #     messages.error(request,'account already exists')
            #     return redirect('register')
            # else:
            user = Account.objects.create_user(
                first_name=first_name, last_name=last_name, email=email, username=username, password=password)
            user.phone_number = phone_number
            
            user.save()
            try:
                otp_send(phone_number)
                request.session['phone_number'] = phone_number
                print('redirecting to otp page')
                return redirect('otp')
            except:
                pass  
        else:
            messages.error(request,'enter valid details')
            return redirect('register') 
                
    reg_form = RegistrationForm()
    context = {
        'reg_form': reg_form
    }
    
    return render(request, 'accounts/register.html', context)

def login(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        
        regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
        if(re.fullmatch(regex,email)):
            print("Valid Email--------------------------------")
        else:
            messages.error(request,'enter a valid email')
            return redirect('login')
        if len(password)>4:
            user = authenticate(request, email=email, password=password)
            if user:
                # b = Account.objects.get(email = email)
                if user.is_active:
                    try:
                        cart = Cart.objects.get(cart_id = _cart_id(request))
                        is_cart_item_exists = CartItem.objects.filter(cart = cart).exists()
                        if is_cart_item_exists:
                            cart_item = CartItem.objects.filter(cart=cart)
                            print('user activateed _________________')
                            print(cart_item)
                            for item in cart_item:
                                try:
                                    cart_item = CartItem.objects.get(product = item.product, user = user)
                                    cart_item.quantity += 1
                                    cart_item.save()
                                    item.delete()
                                except:
                                    item.user = user
                                    item.cart = None
                                    item.save()

                    except:
                        pass
                    request.session['email'] = email
                    auth.login(request, user)
                    return redirect('/')
                    
                else:
                    messages.error(request, 'invalid credentials')
                    return redirect('login')
            if user is None:
                messages.error(request,'user not exist, create one')        
        else:
            messages.error(request, 'enter a valid password')
            return redirect('login')
                
    return render(request, 'accounts/login.html')

def mob_login(request):
    try:
        if request.method == 'POST':
            phone_number = request.POST['phone_number']
            user_mob = Account.objects.get(phone_number= phone_number)
            # print(user_mob.email)
            print("_____")
            print(user_mob)
            
            if user_mob:
                print('L-------------------------------------------')
                otp_send(phone_number)
                request.session['phone_number'] = phone_number
                print('redirecting to otp page')
                return redirect('otp')
                
            else:
                print(phone_number)
                messages.error(request,'Phone number not registered create an account')
                return redirect('login')
        return render(request,'accounts/mob_login.html')

    except:
        messages.error(request,'enter a valid number') 
        return redirect('mob_login')


def logout(request):
    if request.session.has_key('email'):
        del request.session['email']
    auth.logout(request)
    messages.success(request, 'you are logged out.')
    return redirect('login')


def otp(request):
    if request.method == 'POST':
        otp_ver = request.POST['otp']
        phone = request.session['phone_number']
        try:
            if otp_verify(otp_ver, phone) == 'approved':
                user_account = Account.objects.get(phone_number=phone)
                print(user_account)
                if user_account.is_active:
                    request.session['email'] = user_account.email
                    print('------')
                    
                    print('helooooooooooo')
                    auth.login(request,user_account)
                    return redirect('/')
                elif not user_account.is_active:
                    user_account.is_active = True
                    user_account.save()
                    request.session['email'] = user_account.email
                    auth.login(request, user_account)
                    try:
                        del request.session['phone_number']
                        messages.success(request,'you are logged in')
                        return redirect('/')
                    except:
                        return redirect('/')
                
                else:
                    messages.error(request,'invalid user')
                    return redirect('mob_login')
            else:
                messages.error(request,'enter a valid otp')
                return redirect('otp')
        except:
            messages.error(request,'ente a valid OTP')
            return redirect('otp') 
                 
    else:
        return render(request, 'accounts/otp.html')


import time
  
# define the countdown func.
# def countdown(t):
#     while t:
#         mins, secs = divmod(t, 60)
#         timer = '{:02d}:{:02d}'.format(mins, secs)
#         print(timer, end="\r")
#         time.sleep(1)
#         t -= 1

#     print('hello thushad!!')
#     return redirect ('otp')
  
  
# # input time in seconds
# t = input("Enter the time in seconds: ")
  
# # function call
# countdown(t=10)



def dashboard(request):

    if 'email' in request.session :
        order = Order.objects.order_by('-created_at').filter(user_id= request.user.id, is_ordered = True)
        orders_count = order.count()
        
        context = {
            'orders_count':orders_count,
        }
        return render(request,'accounts/dashboard.html',context)
    return render(request,'accounts/login.html')

def my_orders(request):
    if request.user.is_authenticated:
        order = Order.objects.filter(user_id = request.user.id, is_ordered = True).order_by('-created_at')
        context = {
            'orders':order,
        }
        return render(request,'accounts/my_orders.html',context)
    return render(request,'accounts/login.html')

def edit_profile(request):
    
    if request.user.is_authenticated:
        user_form = UserForm(request.POST or None,request.FILES or None , instance = request.user,)
        if request.method == "POST":
            if user_form.is_valid():
                user_form.save()
                messages.success(request,'you profile has been updated')
                return redirect('edit_profile')
            
            else:
                print(user_form.errors)
        context = {
            'user_form':user_form,
        }
        
        return render(request,'accounts/edit_profile.html',context)
    return redirect('login')

def edit_address(request):
    user = request.user
    user_address = AddressTable.objects.filter(user = request.user)
    full_name = user.first_name + ''+ user.last_name
    context = {
        'user_address':user_address,
        'full_name':full_name,
    }
    return render(request,'accounts/edit_address.html',context)


def change_password(request):

    # if 'email' in request.session:
    #     if request.method == 'POST':
    #         curr = request.POST['current_password']
    #         new = request.POST['new_password']
    #         u = Account.objects.get(email=request.session['email'])
    #         if authenticate(email=u, password=curr):
    #             print('authenticate')
    #             u.set_password(new)
    #             u.save()
    #             print(request.session['email'])
    #             return redirect('dashboard')

    # print(request.session['email'])

    # return render(request, 'accounts/change_password.html')



    if request.user.is_authenticated:
        if request.method == "POST":
            current_password = request.POST['current_password']
            new_password = request.POST['new_password']
            confirm_password = request.POST['confirm_password']

            user = Account.objects.get(email__exact = request.user.email)
            if new_password == confirm_password:
                print('new password field ')

                success = user.check_password(current_password)
                if success:
                    print('success page')
                    print(request.session['email'])
                    user.set_password(new_password)
                    user.save()
                    messages.success(request,'password changed')
                    print(request.user)
                    # print(request.session['email'])
                    request.session['email'] = user.email
                    print(request.user)

                    user_b = authenticate(email = user.email, password = new_password)
                    print(user_b,'==========================')

                    auth.login(request, user=user_b)

                    return redirect('/accounts/dashboard/')
                else:
                    messages.error(request,'enter a valid password')
                    return redirect('change_password')
            else:
                messages.error(request,'password does not match')
                return redirect('change_password')

        return render(request,'accounts/change_password.html')
    return redirect('login')

def order_detail(request,order_id):
    order_detail = OrderProduct.objects.filter(order__order_number = order_id)
    order = Order.objects.get(order_number = order_id)
    context = { 
        'order_detail':order_detail,
        'order':order,
    }
    return render(request,'accounts/order_detail.html',context)

def resend(request):
    try:
        otp_send(request.session['phone_number'])
        print('//////////////////////////////')
    except:
        messages.error(request,'invalid otp')
        
    return render(request,'accounts/otp.html')

def user_address_edit(request,id):
    address = AddressTable.objects.get(id=id)
    addr_form = AddressTableForm(request.POST or None,request.FILES or None,instance=address)
    if request.method == "POST":
        if addr_form.is_valid():
            addr_form.save()
            messages.success(request,'address updated successfully')
            return redirect('checkout')
    context = {'addr_form': addr_form,'id':id}
        
    return render(request,'accounts/user_edit_address.html', context)

def user_address_delete(request,id):
  
   
        addr = AddressTable.objects.get(id = id)
        addr.delete()
        messages.success(request,'address deleted !')
        return redirect('checkout')
    
