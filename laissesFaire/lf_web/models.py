from django.db import models
from django.contrib.auth.models import User
from datetime import datetime
from django.utils import timezone
from django.urls import reverse

class main_nav(models.Model):
    title = models.CharField(max_length=30, blank=False)
    href = models.CharField(max_length=100, blank=False)
    target = models.CharField(max_length=10, blank=True)
    btnType = models.CharField(max_length=20, blank=True)
    level = models.IntegerField(blank=True, default=0)
    is_active = models.BooleanField(default=True)

    def __str__(self) -> str:
        return f"{self.href} | {self.title}"

    
    
class page(models.Model):
    title=models.CharField(max_length=255, blank=False)
    caller = models.OneToOneField(main_nav, on_delete=models.CASCADE, default="")
    content=models.TextField(blank=False)
    is_active = models.BooleanField(default=True)
    publish_date = models.DateField()

    def __str__(self):
        return f"{self.title}"
    

class team_roles(models.Model):
    name = models.CharField(max_length=30, blank=False)
    role_level = models.SmallIntegerField()

    def __str__(self) -> str:
        return f"{self.name}"
    
class team_member(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    role = models.ManyToManyField(team_roles)

    def __str__(self):
        return f"{self.user.username} | {self.user.first_name} {self.user.last_name}"
    
    
class contact_form(models.Model):
    fullName = models.CharField(max_length=120, blank=False)
    eposta = models.EmailField(blank=False)
    message = models.TextField(blank=False)
    isRead = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.fullName}"
    
class projects(models.Model):
    header = models.CharField(max_length=144, blank=False)
    body = models.TextField(blank=True)
    t_image = models.ImageField(blank=False, upload_to="static/assets/uploads/")
    image_1 = models.ImageField(blank=True, upload_to="static/assets/uploads/")
    image_2 = models.ImageField(blank=True, upload_to="static/assets/uploads/")
    btn = models.CharField(max_length=244, blank=True)
    href = models.CharField(max_length=1144, blank=True)

    def __str__(self):
        return f"{self.header}"
    def get_absolute_url(self):
        return reverse('proje_detay', args=[str(self.id)])
    

class Sponsors(models.Model):
    queue = models.IntegerField(default=0, blank=True)
    title = models.CharField(max_length=244, blank=False)
    image = models.ImageField(blank=False, upload_to="static/assets/uploads/sponsors")
    desc = models.TextField(blank=True)
    year = models.DateField(default=datetime.now().replace(day=1, month=1).date(), blank=False)

    def __str__(self):
        return f"{self.title}"
    
class News(models.Model):
    header = models.CharField(max_length=255, blank=False)
    desc = models.TextField(blank=True)
    head_image = models.ImageField(blank=False, upload_to="static/assets/upload/news")
    timestamp = models.DateTimeField(default=timezone.now)
    images = models.ManyToManyField('Image', blank=True)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.header}"

    def get_absolute_url(self):
        return reverse('haber_detay', args=[str(self.id)])

class Image(models.Model):
    image = models.ImageField(upload_to="static/assets/upload/news")

    def __str__(self):
        return f"{self.image}"

    