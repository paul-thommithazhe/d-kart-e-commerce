import datetime
from email import message
from django.http import HttpRequest, HttpResponse
from django.shortcuts import redirect, render
from django.contrib import messages

from store.models import Product
from .forms import OrderForm
from carts.models import CartItem
from .models import AddressTable, Order, OrderProduct, Payment
import datetime
# Create your views here.
import json
from django.views.decorators.csrf import csrf_protect


def place_order(request, total=0, quantity=0):

    current_user = request.user
    cart_items = CartItem.objects.filter(user=current_user)
    add_table =  AddressTable.objects.filter(user = current_user)
    cart_count = cart_items.count()
    if cart_count <= 0:
        return redirect('store')

    grand_total = 0
    for cart_item in cart_items:
        total += (cart_item.product.offer_price * cart_item.quantity)
        quantity += cart_item.quantity
    grand_total = total
    print(grand_total)
    if request.method == 'POST':
        form = OrderForm(request.POST)
       
            # Store all the billing information inside Order table

        data = Order()
        data.order_total = grand_total
        data.user = current_user
        if request.POST['addr_id']!='-1' or form.is_valid():
            
            if request.POST['addr_id']!='-1':
                add_table = AddressTable.objects.get(id = int(request.POST['addr_id']))
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

           

            import razorpay
            client = razorpay.Client(auth=("rzp_test_ftUDx8pmsTCDs8", "HL8urXgYmQ00DZmY1SJt7rgE"))

            DATA = {
                "amount": 100,
                "currency": "INR",
                "receipt": "receipt#1",
                "notes": {
                    "key1": "value3",
                    "key2": "value2"
                }
            }
            payment=client.order.create(data=DATA)
            context = {
                'order': order,
                'cart_items': cart_items,
                'total': total,
                'grand_total': grand_total,
                'payment':payment,
            }

            return render(request, 'orders/payment.html', context)
        

        else:
            messages.error(request, 'enter details correctly')
            return render(request, 'store/checkout.html', {'cart_items': cart_items,'add_table':add_table})

    # return render(request,'store/checkout.html')


def payments(request):
    body = json.loads(request.body)
    order = Order.objects.get(user = request.user, is_ordered = False, order_number = body['orderID'])

    payment = Payment(
        user = request.user,
        payment_id = body['transID'],
        payment_method = body['payment_method'],
        amount_paid = order.order_total,
        status = body['status'],
    )
    payment.save()
    order.payment = payment
    order.is_ordered = True
    order.save()

   # move cart item to order table

    cart_items = CartItem.objects.filter(user=request.user)

    for item in cart_items:
        orderproduct = OrderProduct()
        orderproduct.order_id = order.id
        orderproduct.payment = payment
        orderproduct.user_id = request.user.id
        orderproduct.product_id = item.product_id
        orderproduct.quantity = item.quantity
        orderproduct.product_price = item.product.price
        orderproduct.ordered = True
        orderproduct.save()
    
        cart_item = CartItem.objects.get(id=item.id)
        product_variation = cart_item.variations.all() 
        orderproduct = OrderProduct.objects.get(id= orderproduct.id)
        orderproduct.variations.set(product_variation)
        orderproduct.save()    

        #stock product delete

        product = Product.objects.get(id = item.product_id)
        product.stock -= item.quantity
        product.save()
    
    CartItem.objects.filter(user=request.user).delete()


    return render(request, 'orders/payment.html')


def order_complete(request):
    return render(request,'orders/order_complete.html')

