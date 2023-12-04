from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='cikis'),
    path('dashboard/', views.dashboard_view, name='dashboard'),
    path('profile', views.profile_view, name="profile"),
    path('settings', views.settings_view, name="settings"),
    path('', views.dashboard_view, name='anasayfa'),
]
