from django.contrib import admin
from .models import Cart,CartItem

# Register your models here.

class CartItemAdmin(admin.ModelAdmin):
    list_display = ('product','cart','quantity','user')

class CartAdmin(admin.ModelAdmin):
    list_display = ('cart_id',)

admin.site.register(Cart,CartAdmin)
admin.site.register(CartItem,CartItemAdmin)