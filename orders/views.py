import datetime
from email import message
import re
from django.http import HttpRequest, HttpResponse, JsonResponse
from django.shortcuts import redirect, render
from django.contrib import messages
from django.db.models import Q
from store.models import Product, Variation
from .forms import OrderForm
from carts.models import CartItem
from .models import AddressTable, Order, OrderProduct, Payment
import datetime
from .models import *
import json
from django.views.decorators.csrf import csrf_protect


import razorpay
client = razorpay.Client(
    auth=("rzp_test_ftUDx8pmsTCDs8", "HL8urXgYmQ00DZmY1SJt7rgE"))


def place_order(request, total=0, quantity=0):

    coup = request.POST.get('coupon' or None)

    current_user = request.user
    add_table = AddressTable.objects.filter(user=current_user)
    if request.session.has_key('buy_now'):
        var_id = request.session['buy_now']
        variation = var_id.split('-')
        varient = Variation.objects.get(id=int(variation[0]))
        pro = Product.objects.get(id=varient.product.id)
        total = pro.offer_price
        quantity = 1
        if coup:
            a =Coupon.objects.get(coupon_code__iexact = coup)
            total = total- (total * a.coupon_offer)/100
    else:
        cart_items = CartItem.objects.filter(user=current_user)
        cart_count = cart_items.count()
        if cart_count <= 0:
            return redirect('store')

        grand_total = 0
        for cart_item in cart_items:
            total += (cart_item.product.offer_price * cart_item.quantity)
            quantity += cart_item.quantity
            if coup:
                a =Coupon.objects.get(coupon_code__iexact = coup)
                total =total- (total * a.coupon_offer)/100

    grand_total = total
    print('grand_total:', grand_total)
    if request.method == 'POST':
        form = OrderForm(request.POST, use_required_attribute=False)

        # Store all the billing information inside Order table

        data = Order()
        data.order_total = grand_total
        data.user = current_user
        if request.POST['addr_id'] != '-1' or form.is_valid():

            if request.POST['addr_id'] != '-1':
                add_table = AddressTable.objects.get(
                    id=int(request.POST['addr_id']))
                data.first_name = add_table.first_name
                data.last_name = add_table.last_name
                data.phone = add_table.phone
                data.email = add_table.email
                data.address_line_1 = add_table.address_line_1
                data.address_line_2 = add_table.address_line_2
                data.state = add_table.state
                data.city = add_table.city
                data.save()
            elif form.is_valid():
                data.first_name = form.cleaned_data['first_name']
                data.last_name = form.cleaned_data['last_name']
                data.phone = form.cleaned_data['phone']
                data.email = form.cleaned_data['email']
                data.address_line_1 = form.cleaned_data['address_line_1']
                data.address_line_2 = form.cleaned_data['address_line_2']
                data.state = form.cleaned_data['state']
                data.city = form.cleaned_data['city']
                data.save()
                AddressTable.objects.create(user=data.user, first_name=data.first_name, last_name=data.last_name,
                                            phone=data.phone, email=data.email, address_line_1=data.address_line_1, address_line_2=data.address_line_2, state=data.state, city=data.city)
            # Generate order number

            yr = int(datetime.date.today().strftime('%Y'))
            dt = int(datetime.date.today().strftime('%d'))
            mt = int(datetime.date.today().strftime('%m'))
            d = datetime.date(yr, mt, dt)
            current_date = d.strftime("%Y%m%d")  # 20210305
            order_number = current_date + str(data.id)
            data.order_number = order_number
            data.save()

            order = Order.objects.get(
                user=current_user, is_ordered=False, order_number=order_number)


            DATA = {
                "amount": grand_total *100,
                "currency": "INR",
                "receipt": "receipt#1",
                "notes": {
                    "key1": "value3",
                    "key2": "value2"
                }
            }
            payment = client.order.create(data=DATA)
            context = {
                'order': order,
                'total': total,
                'grand_total': grand_total,
                'payment': payment['id'],
                'coupon':coup,
  
            }

            return render(request, 'orders/payment.html', context)

        else:
            messages.error(request, 'enter details correctly')
            return render(request, 'store/checkout.html', {'cart_items': cart_items, 'add_table': add_table})

    # return render(request,'store/checkout.html')


def payments(request):


    
    if request.method == 'GET' and request.GET['payment_method']  == 'razorpay':
        if request.GET['coupon']:
            coupon = Coupon.objects.get(coupon_code = request.GET['coupon'])
            order = Order.objects.get( user=request.user, is_ordered=False, order_number=request.GET['orderID'])
            order.coupon = coupon
            print(coupon)
            print('==========++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=============')
            order.save()

            print(order)
            print('==========================================hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh')

        else:
            order = Order.objects.get( user=request.user, is_ordered=False, order_number=request.GET['orderID'] )

        payment = Payment(
            user=request.user,payment_method=request.GET['payment_method'],
            amount_paid=order.order_total,status=request.GET['status']
        )
    else:

        body = json.loads(request.body)
        print(body)
        coupon = body['coupon']
        print(coupon)
        # if body['orderID']:
        #     pass
        print('.................................................................................')
        coupon = Coupon.objects.get(coupon_code = coupon)



        order = Order.objects.get( user=request.user, is_ordered=False, order_number=body['orderID'],coupen= coupon)
        order.coupon = coupon
        payment = Payment(
            user=request.user,payment_id=body['transID'],payment_method=body['payment_method'],
            amount_paid=order.order_total,status=body['status']
        )

    payment.save()
    order.payment = payment
    order.is_ordered = True
    order.save()

    # move cart item to order table
    if request.session.has_key('buy_now'):

        var_id = request.session['buy_now']
        variation = var_id.split('-')
        varient = Variation.objects.get(id=int(variation[0]))
        pro = Product.objects.get(id=varient.product.id)

        orderproduct = OrderProduct()
        orderproduct.order_id = order.id
        orderproduct.payment = payment
        orderproduct.user_id = request.user.id
        orderproduct.product = pro
        orderproduct.quantity = 1
        orderproduct.product_price = pro.offer_price
        orderproduct.ordered = True
        orderproduct.save()
        orderproduct = OrderProduct.objects.get(id=orderproduct.id)
        product_variation = []
        for i in range(2):
            product_variation.append(
                Variation.objects.get(id=int(variation[i])))
        orderproduct.variations.set(product_variation)
        orderproduct.save()
        pro.stock -= 1
        pro.save()

        del request.session['buy_now']

    else:
        cart_items = CartItem.objects.filter(user=request.user)

        for item in cart_items:
            orderproduct = OrderProduct()
            orderproduct.order_id = order.id
            orderproduct.payment = payment
            orderproduct.user_id = request.user.id
            orderproduct.product_id = item.product_id
            orderproduct.quantity = item.quantity
            orderproduct.product_price = item.product.offer_price
            orderproduct.ordered = True
            orderproduct.save()

            cart_item = CartItem.objects.get(id=item.id)
            product_variation = cart_item.variations.all()
            orderproduct = OrderProduct.objects.get(id=orderproduct.id)
            print(product_variation)
            orderproduct.variations.set(product_variation)
            orderproduct.save()

            # stock product delete

            product = Product.objects.get(id=item.product_id)
            product.stock -= item.quantity
            product.save()

        CartItem.objects.filter(user=request.user).delete()
    
    if request.method == 'GET' and request.GET['payment_method'] == 'razorpay':
        
        return redirect("/orders/order_complete/?order_number="+str(order.order_number))

    data = {
        'order_number': order.order_number,
        'transID': payment.payment_id
    }

    return JsonResponse(data)


def order_complete(request):
    order_number = int(request.GET.get('order_number'))
    transID = request.GET.get('payment_id' or None)

    try:
        order = Order.objects.get(order_number=order_number, is_ordered=True)
        orderpro=OrderProduct.objects.filter(order=order)[0]
        ordered_products = OrderProduct.objects.filter(order_id=order.id)
        # payment = Payment.objects.get(payment_id=transID)
        context = {
            'order': order,
            'ordered_products': ordered_products,
            'order_number': order.order_number,
            'transID': orderpro.payment.payment_id,
            'payment': orderpro.payment,

        }
        return render(request, 'orders/order_complete.html', context)

    except(Payment.DoesNotExist, Order.DoesNotExist):
        return redirect('home')

def coupon_check(request):
    try:
        coup=Coupon.objects.get(coupon_code=request.GET['coup'])
        if Order.objects.filter(Q(coupon=coup) & Q(user=request.user)).exists():
            return JsonResponse({'f':2})
        else:
            tot=int(request.GET['tot'])
            tot-=(tot*coup.coupon_offer/100)
            return JsonResponse({'f':0,'tot':int(tot), 'coup_id':coup.id})
    except:
        return JsonResponse({'f':1})
