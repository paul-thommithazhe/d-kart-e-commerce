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
    path('admin_brand_list/',views.admin_brand_list, name = 'admin_brand_list'),
    path('admin_add_category/',views.admin_add_category, name = 'admin_add_category'),
    path('admin_add_product/',views.admin_add_product, name = 'admin_add_product'),
    path('admin_update_product/<id>/',views.admin_update_product, name = 'admin_update_product'),
    path('admin_update_category/<id>/',views.admin_update_category, name = 'admin_update_category'),
    path('block/<id>/',views.block, name= 'block'),
    path('unblock/<id>/',views.unblock, name= 'unblock'),
    path('cat_delete/<id>/',views.cat_delete, name= 'cat_delete'),
    path('brand_delete/<id>/',views.brand_delete, name= 'brand_delete'),
    path('brand_update/<id>/',views.brand_update, name= 'brand_update'),
    path('admin_add_brand/',views.admin_add_brand, name= 'admin_add_brand'),
    path('p_delete/<id>/',views.p_delete, name= 'p_delete'),
    path('search/',views.search ,name = 'search'),
    path('cat_offer_list/',views.cat_offer_list,name='cat_offer_list'),
    path('cat_offer_update/<id>/',views.cat_offer_update,name='cat_offer_update'),
    path('pro_offer_list/',views.pro_offer_list,name='pro_offer_list'),
    path('pro_offer_update/<id>/',views.pro_offer_update,name='pro_offer_update'),
    path('add_pro_offer/',views.add_pro_offer, name= 'add_pro_offer'),
    path('chart_list',views.chart_list,name="chart_list"),
    path('test/',views.test, name= "test"),
    path('order_management/',views.order_management,name='order_management'),
    path('admin_variation/',views.variation,name = 'admin_variation'),
    path('edi_variation/<id>/',views.edit_variation,name = 'edit_variation'),
    path('add_variation/',views.add_variation,name = 'add_variation'),
    path('order_status_update/',views.order_status_update,name = 'order_status_update'),
    path('sales_report',views.sales_report,name='sales_report'),
    path('export_excel',views.export_excel,name='export_excel'),

]
