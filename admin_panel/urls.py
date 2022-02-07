from unicodedata import name
from django.urls import path
from . import views

urlpatterns = [
    
    path('',views.admin_login, name = 'admin_login'),
    path('admin_logout/',views.admin_logout, name= 'admin_logout'),
    path('admin_home/',views.admin_home, name = 'admin_home'),
    path('admin_users_list/',views.admin_users_list, name = 'admin_users_list'),
    path('category_list/',views.category_list, name = 'admin_category_list'),
    path('admin_product_list/',views.admin_product_list, name = 'admin_product_list'),
    path('admin_add_category/',views.admin_add_category, name = 'admin_add_category'),
    path('admin_add_product/',views.admin_add_product, name = 'admin_add_product'),
    path('block/<id>/',views.block, name= 'block'),
    path('unblock/<id>/',views.unblock, name= 'unblock'),
    path('cat_delete/<id>/',views.cat_delete, name= 'cat_delete'),
    path('p_delete/<id>/',views.p_delete, name= 'p_delete'),
    path('search/',views.search ,name = 'search'),
    
    path('test/',views.test, name= "test")
]
