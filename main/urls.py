from django.urls import path, include
from . import views

urlpatterns = [
   path('', views.index, name='index'),
   path('listing/<int:id>/', views.single_page, name='singlepage'),
   path('catalog/', views.catalog, name='catalog'),
   path('delete/<int:id>/', views.delete_listing, name='delete_listing'),
]