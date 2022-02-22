
from unicodedata import name
from django.urls import path
from . import views


urlpatterns = [
    
    path('register/',views.register, name = 'register'),
    path('login/',views.login, name = 'login'),
    path('logout/',views.logout, name = 'logout'),
    path('otp/',views.otp, name = 'otp'),
    path('resend/',views.resend, name = 'resend'),
    path('mob_login/',views.mob_login, name = 'mob_login'),
    path('dashboard/',views.dashboard,name= 'dashboard'),
    path('my_orders/',views.my_orders,name= 'my_orders'),
    path('edit_profile/',views.edit_profile,name= 'edit_profile'),
    path('edit_address/',views.edit_address,name= 'edit_address'),
    path('change_password/',views.change_password,name= 'change_password'),
    path('order_detail/<int:order_id>/',views.order_detail,name= 'order_detail'),
    path('user_address_edit/<id>/',views.user_address_edit,name='user_address_edit'),
    path('user_address_delete/<id>/',views.user_address_delete,name='user_address_delete')

    # path('user_edit_address/<int:id>/',views.user_edit_address,name= 'user_edit_address'),
    
    
]
