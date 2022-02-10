from ast import Dict
from category.models import Category
from category.models import SubCategory

def menu_links(request):
    links = Category.objects.all()
    return dict(links =links)

def menu_links_brand(request):
    links_brand = SubCategory.objects.all()
    return dict(links_brand =links_brand) 