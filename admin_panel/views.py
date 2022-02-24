
from contextlib import redirect_stderr
from datetime import datetime
from this import d
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate
from django.contrib import messages, auth
from category.forms import CategoryForm, CategoryOfferForm, SubCategoryForm
from unicodedata import category, name
from django.http import HttpResponse
from category.models import Category, SubCategory
from orders.forms import CouponForm
from store.forms import  *
from accounts.models import Account
from store.models import *
from django.db.models import Q
from orders.models import *
from django.db.models import Sum
from datetime import datetime
import xlwt

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
                return redirect('admin_home')
            else:
                messages.error(request,'Invalid Credentials')
                return redirect('admin_login')
        else:
            messages.error(request, 'user not exist')
    return render(request, 'admin_panel/admin_login.html')


def admin_home(request):
    if request.session.has_key('email'):
        order = Order.objects.order_by('-created_at').filter(user_id= request.user.id, is_ordered = True)
        order_deliverd = OrderProduct.objects.filter(delivery_status = 'delivered').count()
        order_cancelled = OrderProduct.objects.filter(delivery_status = 'admin cancelled').count()
        order_pending = OrderProduct.objects.filter(delivery_status = 'Pending').count()
        order_shipped = OrderProduct.objects.filter(delivery_status = 'shipped').count()
        payment_payapl = Payment.objects.filter(payment_method = 'paypal').count()
        payment_razorpay = Payment.objects.filter(payment_method = 'razorpay').count()
        payment_cod = Payment.objects.filter(payment_method = 'cash on delivery').count()
        context = {
            'payment_method_paypal':payment_payapl,
            'payment_method_razorpay':payment_razorpay,
            'payment_method_cod':payment_cod,
            'order_deliverd':order_deliverd,
            'order_cancelled':order_cancelled,
            'order_pending':order_pending,
            'order_shipped':order_shipped,
        }
        return render(request,'admin_panel/admin_home.html',context)


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
        # V_form = VariationForm

        context = {
            'P_form': P_form,
            # 'V_form':V_form,
        }
        if request.method == "POST":
            P_form = ProductForm(request.POST, request.FILES)
            # V_form = VariationForm(request.POST)
            if P_form.is_valid():
                product=P_form.save(commit=False)
                # variation = V_form.save(commit=False)
                product.slug=product.product_name.lower().replace(" ","-")
                product.offer_price = P_form.cleaned_data['price']
                product.save()
            
                # variation.save()
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
                messages.success(request,'product updated successfully')
                return redirect('admin_product_list')
              
        context = {'P_form': p_form,
                    'id':id
                    }
        
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

def admin_brand_list(request):
    if request.session.has_key('email'):
        brands = SubCategory.objects.all()
        context = {
            'brands':brands,
        }
        return render(request,'admin_panel/admin_brands_list.html',context)
    return redirect('admin_login')

def brand_delete(request,id):
    if request.session.has_key('email'):
        brand = SubCategory.objects.get(id = id)
        brand.delete()
        messages.success(request,'brand item delted')
        return redirect('admin_brand_list')
    return redirect('login')


def brand_update(request,id):
    brand = SubCategory.objects.get(id=id)
    b_form = SubCategoryForm(request.POST or None,request.FILES or None,instance=brand)
    if request.method == "POST":
        if b_form.is_valid():
            b_form.save()
            messages.success(request,'brand updated successfully')
            return redirect('admin_brand_list')
    context = {'b_form': b_form,'id':id}
        
    return render(request,'admin_panel/admin_brand_update.html', context)

def admin_add_brand(request):
    if request.session.has_key('email'):
        b_form = SubCategoryForm()
        context = {
            'b_form': b_form,
            # 'V_form':V_form,
        }
        if request.method == "POST":
            b_form =SubCategoryForm(request.POST, request.FILES)
            # V_form = VariationForm(request.POST)
            if b_form.is_valid():
                brand=b_form.save(commit=False)
                # variation = V_form.save(commit=False)
                brand.slug=brand.brand_name.lower().replace(" ","-")
                brand.save()
            
                # variation.save()
                messages.success(request,'product added successfully')
                return redirect('admin_brand_list')
        return render(request, 'admin_panel/admin_add_brand.html',context)

def admin_product_list(request):
    if request.session.has_key('email'):
        products = Product.objects.all()
        context = {
            'products': products,
        }
        return render(request, 'admin_panel/admin_products_list.html', context)
    return redirect('admin_login')


def cat_offer_list(request):
    if request.session.has_key('email'):
        cat_offer = Category.objects.all()
        context  = {
            'cat_offers':cat_offer,
        }
        return render(request,'admin_panel/admin_cat_offer_list.html',context)
    return redirect('admin_login')

def cat_offer_update(request,id):
    cat = Category.objects.get(id=id)
    cat_offer_form = CategoryOfferForm(request.POST or None,request.FILES or None,instance=cat)
    if request.method == "POST":
        if cat_offer_form.is_valid():
            cat_offer_form.save()
            messages.success(request,'category offer updated successfully')
            return redirect('cat_offer_list')
    context = {'cat_offer_form': cat_offer_form,'id':id}
        
    return render(request,'admin_panel/admin_cat_offer_update.html', context)

def pro_offer_list(request):
    pro_offer = Product.objects.all()
    if request.session.has_key('email'):
        context = {
            'pro_offers':pro_offer,
        }
        return render(request,'admin_panel/admin_pro_offer_list.html',context)
    return redirect('admin_login')


def pro_offer_update(request,id):
    pro = Product.objects.get(id=id)
    pro_offer_form = ProductOfferForm(request.POST or None,request.FILES or None,instance=pro)
    if request.method == "POST":
        if pro_offer_form.is_valid():
            pro_offer_form.save()
            messages.success(request,'product offer updated successfully')
            return redirect('pro_offer_list')
    context = {'pro_offer_form': pro_offer_form,'id':id}
        
    return render(request,'admin_panel/admin_pro_offer_update.html', context)

def add_pro_offer(request):
    if request.session.has_key('email'):
        p_form = ProductOfferForm()
        context = {
            'p_form': p_form,
            # 'V_form':V_form,
        }
        if request.method == "POST":
            p_form =ProductOfferForm(request.POST, request.FILES)
            # V_form = VariationForm(request.POST)
            if p_form.is_valid():
                p_offer=p_form.save(commit=False)
                # variation = V_form.save(commit=False)
                
                p_offer.save()
            
                # variation.save()
                messages.success(request,'product offer added successfully')
                return redirect('pro_offer_list')
        return render(request, 'admin_panel/admin_add_pro_offer.html',context)

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


def chart_list(request):
    user = request.user
    order = Order.objects.order_by('-created_at').filter(user_id= request.user.id, is_ordered = True)
    payment_payapl = Payment.objects.filter(payment_method = 'paypal').count()
    payment_razorpay = Payment.objects.filter(payment_method = 'razorpay').count()
    payment_cod = Payment.objects.filter(payment_method = 'cash on delivery').count()
    context = {
        'payment_method_paypal':payment_payapl,
        'payment_method_razorpay':payment_razorpay,
        'payment_method_cod':payment_cod,
    }
    return render(request,'admin_panel/admin_home.html',context)



def test(request):
    form = ProductForm()
    context = {
        'p_form':form,
    }
    return render(request,'admin_panel/test.html',context)

def order_management(request):
   
    order_products = OrderProduct.objects.all().order_by('-id')
    context = {
        'order_products':order_products
    } 
    return render(request,'admin_panel/order_management.html',context)

def order_status_update(request):
    order_products = OrderProduct.objects.get(id = request.GET['id'])
    print(order_products)
    print(request.GET['status'])
    print(request.GET['id'])
    print('==================================================================')
    print(order_products.delivery_status)
    order_products.delivery_status = request.GET['status']
    print(order_products.delivery_status)
    order_products.save()
    return redirect('order_management')


def variation(request):
    if request.session.has_key('email'):
        variation =Variation.objects.all()
        context = {
            'variations':variation,
        }
        return render(request,'admin_panel/admin_variation.html',context)
    return redirect('admin_login')

def edit_variation(request,id):
    var = Variation.objects.get(id=id)
    var_form = VariationForm(request.POST or None,request.FILES or None,instance=var)
    if request.method == "POST":
        if var_form.is_valid():
            var_form.save()
            messages.success(request,'variation updated successfully')
            return redirect('admin_variation')
    context = {'var_form': var_form,'id':id}
        
    return render(request,'admin_panel/admin_variation_update.html', context)

def add_variation(request):
    if request.session.has_key('email'):
        var_form = VariationForm()
        context = {
            'var_form': var_form,
            # 'V_form':V_form,
        }
        if request.method == "POST":
            var_form =VariationForm(request.POST, request.FILES)
            # V_form = VariationForm(request.POST)
            if var_form.is_valid():
                var=var_form.save(commit=False)
                # variation = V_form.save(commit=False)
                var.save()
            
                # variation.save()
                messages.success(request,'variation added successfully')
                return redirect('admin_variation')
        return render(request, 'admin_panel/admin_add_variation.html',context)

def sales_report(request):

    year = request.GET.get('year' or 0)
    month =  request.GET.get('month' or 0)
    date_from = request.GET.get('date_from' or 0)
    date_to = request.GET.get('date_to' or 0)
    
    if date_from and date_to:
        report = OrderProduct.objects.filter(created_at__gte=date_from, created_at__lte=date_to).values('product__product_name').annotate(pr_count = Sum('quantity'),a=Sum('order__order_total'))
    elif date_from:
        report = OrderProduct.objects.filter(created_at__gte=date_from).values('product__product_name').annotate(pr_count = Sum('quantity'),a=Sum('order__order_total'))
    elif date_to:
        print(type(date_to))
        report = OrderProduct.objects.filter(created_at__lte=date_to).values('product__product_name').annotate(pr_count = Sum('quantity'),a=Sum('order__order_total'))
    elif year:
        report = OrderProduct.objects.filter(created_at__year=year).values('product__product_name').annotate(pr_count = Sum('quantity'),a=Sum('order__order_total'))
    elif month:
        print(month, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000')
        spl = month.split("-")
        print(spl[0], '            ', spl[1])
        print(int(spl[1]))

        report = OrderProduct.objects.filter(created_at__year=spl[0],created_at__month=spl[1]).values('product__product_name').annotate(pr_count = Sum('quantity'),a=Sum('order__order_total'))

    else:
        report = OrderProduct.objects.all().values('product__product_name').annotate(pr_count = Sum('quantity'),a=Sum('order__order_total'))

    print(report)
    
    report_count= report.count()
    context = {
        'reports':report,
        'reports_count':report_count,
       
    }
    return render(request,'admin_panel/admin_sales_report.html',context)

def export_excel(request):
    response = HttpResponse(content_type ='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename = Expenses' + \
        str(datetime.now())+'.xls'
    wb = xlwt.Workbook(encoding='utf-8')
    ws = wb.add_sheet('Expenses')
    row_num = 0
    font_style = xlwt.XFStyle()
    font_style.font.bold = True


    columns = ['Amount','Description','Category','Date']

    for col_num in range(len(columns)):
        ws.write(row_num,col_num,columns[col_num],font_style)

    font_style = xlwt.XFStyle()

    rows = OrderProduct.objects.all().values_list('product__product_name').annotate(pr_count = Sum('quantity'),a=Sum('order__order_total'))
    print(rows)
    for row in rows:
        row_num += 1


        for col_num in range(len(row)):
            print(col_num, '-------------------')
            ws.write(row_num,col_num,str(row[col_num]),font_style)
    wb.save(response)
    return response

def coupon_list(request):
    if request.session.has_key('email'):
        coupon = Coupon.objects.all()
        context  = {
            'coupons':coupon,
        }
        return render(request,'admin_panel/coupon_list.html',context)
    return redirect('admin_login')

def coupon_edit(request,id):
    coupon = Coupon.objects.get(id=id)
    coup_form = CouponForm(request.POST or None,request.FILES or None,instance=coupon)
    if request.method == "POST":
        if coup_form.is_valid():
            coup_form.save()
            messages.success(request,'coupon updated successfully')
            return redirect('coupon_list')
    context = {'coup_form': coup_form,'id':id}
        
    return render(request,'admin_panel/coupon_edit.html', context)

def add_coupon(request):
    if request.session.has_key('email'):
        coup_form = CouponForm()
        context = {
            'coup_form': coup_form,
            # 'V_form':V_form,
        }
        if request.method == "POST":
            coup_form =CouponForm(request.POST, request.FILES)
            # V_form = VariationForm(request.POST)
            if coup_form.is_valid():
                coupon=coup_form.save(commit=False)
              
    
                coupon.save()
            
                # variation.save()
                messages.success(request,'coupon added successfully')
                return redirect('coupon_list')
        return render(request, 'admin_panel/add_coupon.html',context)