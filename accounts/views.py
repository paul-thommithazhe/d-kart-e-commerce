from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate
from django.contrib import messages, auth
from .twilio import otp_send,otp_verify
from carts.models import Cart,CartItem
from django.http import HttpResponse
from .forms import RegistrationForm
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
    if request.method == 'POST':
        phone_number = request.POST['phone_number']
        user_mob = Account.objects.get(phone_number= phone_number)
        # print(user_mob.email)
        
        print("_____")
        print(user_mob)
        
        if user_mob:
            otp_send(phone_number)
            request.session['phone_number'] = phone_number
            print('redirecting to otp page')
            return redirect('otp')
            
        else:
            print(phone_number)
            messages.error(request,'Phone number not registered create an account')
            return redirect('login')
    return render(request,'accounts/mob_login.html')




def logout(request):
    del request.session['email']
    auth.logout(request)
   
    print('------------------------------------------------------------------------------')
    
    
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
                if not user_account.is_active:
                    user_account.is_active = True
                    user_account.save()
                    try:
                        del request.session['phone']
                        return redirect('/')
                    except:
                        return redirect('/')
                if user_account.is_active and not user_account.superuser:
                    request.session['email'] = user_account.email
                    print('------')
                    print(request.session['email'])
                    return redirect('/')
                else:
                    messages.error(request,'invalid user')
                    return redirect('mob_login')
            else:
                messages.error(request,'enter a valid otp')
                return redirect('otp_verify')
        except:
            pass      
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
    if request.user_is_authenticated:
        return render(request,'accounts/dashboard.html')
    return render('login')