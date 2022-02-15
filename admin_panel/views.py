
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate
from django.contrib import messages, auth
from category.forms import CategoryForm
from unicodedata import category, name
from django.http import HttpResponse
from category.models import Category
from store.forms import  *
from accounts.models import Account
from store.models import Product
from django.db.models import Q
from urllib3 import Retry

##views


def admin_login(request):
    if request.method == "POST":
        email = request.POST['email']
        password = request.POST['password']
        user = authenticate(request, email=email, password=password)
        if user:
            if user.is_superuser:
                request.session['email'] = email
                context = {
                    'user': user,
                }
                return render(request, 'admin_panel/admin_home.html', context)

        else:
            messages.error(request, 'user not exist')
    return render(request, 'admin_panel/admin_login.html')


def admin_home(request):
    if request.session.has_key('email'):
        return render(request, 'admin_panel/admin_home.html')
    return redirect('admin_login')


def admin_users_list(request):
    if request.session.has_key('email'):
        users = Account.objects.all()
        context = {
            'users': users,
        }
        return render(request, 'admin_panel/admin_user_list.html', context)
    return redirect('admin_login')


def search(request):
    if request.session.has_key('email'):
        search = request.GET['search'].lower()
        
        print(search.lower())
        print('----------------------------------')
        users = Account.objects.filter(first_name__startswith = search)
        context = {
                'users':users,
            }
        return render(request,'admin_panel/admin_user_list.html',context)
            
            # return render(request,'admin_panel/admin_user_list.html', context)
    return redirect('admin_login')
 
       
    
def category_list(request):
    if request.session.has_key('email'):
        categories = Category.objects.all()
        context = {
            'categories': categories
        }
        return render(request, 'admin_panel/admin_category_list.html', context)
    return redirect('admin_login')


def admin_add_category(request):
    if request.session.has_key('email'):
        c_form = CategoryForm
        context = {
            'c_form':c_form,
        } 
        if request.method == "POST":
            c_form = CategoryForm(request.POST, request.FILES)
            if c_form.is_valid():
                category=c_form.save(commit=False)
                category.slug=category.category_name.lower().replace(" ","-")
                category.save()
                messages.success(request,'category added successfully')
                return redirect('admin_category_list')
        
        return render(request, 'admin_panel/admin_add_category.html',context)
    return redirect('admin_login')

def admin_update_category(request,id):
    if request.session.has_key('email'):
        category = Category.objects.get(id=id)   
        c_form = CategoryForm(request.POST or None,request.FILES or None,instance=category)
        if request.method == "POST":
             if c_form.is_valid():
                c_form.save()
                return redirect('admin_category_list')
        context = {'c_form': c_form ,'id':id }
        return render(request,'admin_panel/admin_update_category.html', context)

    return redirect('admin_login')
def admin_add_product(request):
    if request.session.has_key('email'):
        P_form = ProductForm
        V_form = VariationForm

        context = {
            'P_form': P_form,
            'V_form':V_form,
        }
        if request.method == "POST":
            P_form = ProductForm(request.POST, request.FILES)
            V_form = VariationForm(request.POST)
            if P_form.is_valid() and V_form.is_valid() :
                product=P_form.save(commit=False)
                variation = V_form.save(commit=False)
                product.slug=product.product_name.lower().replace(" ","-")
                product.offer_price = P_form.cleaned_data['price']
                product.save()
            
                variation.save()
                messages.success(request,'product added successfully')
                return redirect('admin_product_list')


        return render(request, 'admin_panel/admin_add_product.html', context)
    return redirect('admin_login')

def admin_update_product(request,id):
    if request.session.has_key('email'):
        print(id, '----------------------------')
        product = Product.objects.get(id=id)
        p_form = ProductForm(request.POST or None,request.FILES or None,instance=product)
        if request.method == "POST":
            if p_form.is_valid():
                p_form.save()
                return redirect('admin_product_list')
              
        context = {'P_form': p_form,'id':id}
        
        return render(request,'admin_panel/admin_update_product.html', context )

def cat_delete(request, id):
    
    if request.session.has_key('email'):
        category = Category.objects.get(id=id)
        category.delete()
        messages.success(request, 'category item deleted successfully')
        return redirect('admin_category_list')
    return redirect('admin_login')

def p_delete(request, id):
    if request.session.has_key('email'):
        product = Product.objects.get(id=id)
        product.delete()
        messages.success(request, 'product item deleted successfully')
        return redirect('admin_product_list')
    return redirect('admin_login')


def admin_product_list(request):
    if request.session.has_key('email'):
        products = Product.objects.all()
        context = {
            'products': products,
        }
        return render(request, 'admin_panel/admin_products_list.html', context)
    return redirect('admin_login')


def admin_logout(request):
    del request.session['email']
    auth.logout(request)
    messages.success(request, 'you are logged out.')
    return redirect('admin_login')


def block(request, id):
    if request.session.has_key('email'):
        users = Account.objects.get(id=id)
        users.is_active = False
        users.save()
        return redirect('admin_users_list')
    return redirect('admin_login')

def unblock(request, id):
    if request.session.has_key('email'):
        users = Account.objects.get(id=id)
        users.is_active = True
        users.save()
        return redirect('admin_users_list')
    return redirect('admin_login')

def test(request):
    form = ProductForm()
    context = {
        'p_form':form,
    }
    return render(request,'admin_panel/test.html',context)