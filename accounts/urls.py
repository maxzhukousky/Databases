from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('logout/', views.logout, name='logout'),
    path('contacting', views.contacting, name='contacting'),
    path('subscription', views.subscribe, name='subscription'),
    path('mailing', views.mailing, name='mailing'),
]