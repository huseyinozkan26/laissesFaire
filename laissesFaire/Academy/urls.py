from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='cikis'),
    path('dashboard/', views.dashboard_view, name='dashboard'),
    path('profile', views.profile_view, name="profile"),
    path('settings', views.settings_view, name="settings"),
    path('content_list/<int:topic_id>/', views.content_list, name='content_list'),
    path('show_content/<int:content_id>/', views.show_content, name='show_content'),
    path('update_watched_duration/', views.update_watched_duration, name='update_watched_duration'),
    path('get_watched_duration/', views.get_watched_duration, name='get_watched_duration'),
    path('', views.dashboard_view, name='anasayfa'),
]
