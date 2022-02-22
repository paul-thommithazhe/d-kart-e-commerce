from unicodedata import name
from django.urls import path
from . import views
urlpatterns = [
    path('',views.store, name = 'store'),
    
    path('<slug:category_slug>/',views.store,name = 'products_by_category'),
    path('brand/<slug:brand_slug>/',views.brand_store, name ='products_by_brand'),
    path('<slug:category_slug>/<slug:product_slug>/',views.product_detail,name ='product_detail'),
    path('price_filter',views.price_filter,name='price_filter')
    
]
