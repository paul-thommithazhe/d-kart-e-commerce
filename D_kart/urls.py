
from django.conf.urls.static import static
from django.urls import path,include
from django.conf import settings
from django.contrib import admin



urlpatterns = [

    
    path('admin/', admin.site.urls),
    path('',include('home.urls')),
    path('accounts/',include('accounts.urls')),
    path('category/',include('category.urls')),
    path('store/',include('store.urls')),
    path('admin_panel/',include('admin_panel.urls')),
    path('cart/',include('carts.urls')),
    path('orders/',include('orders.urls')),
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
