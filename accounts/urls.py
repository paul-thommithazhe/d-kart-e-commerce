
from unicodedata import name
from django.urls import path
from . import views


urlpatterns = [
    
    path('register/',views.register, name = 'register'),
    path('login/',views.login, name = 'login'),
    path('logout/',views.logout, name = 'logout'),
    path('otp/',views.otp, name = 'otp'),
    path('mob_login/',views.mob_login, name = 'mob_login'),
    path('dashboard/',views.dashboard,name= 'dashboard'),
    
    
]
