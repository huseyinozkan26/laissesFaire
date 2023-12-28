
from django.http import HttpRequest, HttpResponse
from django.urls import path
from . import views


urlpatterns = [
    path('', views.index),
    path('hakkimizda', views.index),
    path("ana", views.index),
    path("takim", views.team),
    path("iletisim", views.contact, name='contact'),
    path("projelerimiz", views.ourProjects),
    path('proje/<int:project_id>/', views.projectDetails, name='projectDetails'),
    path('haberler', views.ourNews),
    path('haber/<int:news_id>/', views.newsDetails, name='newsDetails'),
    path("contact", views.contact),
    path("sponsorlarimiz", views.ourSponsors),
    path("register",views.create_student, name="Student Register Form"),
    path("application",views.apply_view, name="Student Application Form"),
    path('<page>', views.page)
]
