from django.contrib.auth.models import User, AbstractUser
from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
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

    class Meta:
        verbose_name = "Navigasyon"
        verbose_name_plural = "Navigasyon Elemanları"

    def __str__(self) -> str:
        return f"{self.href} | {self.title}"

    
    
class page(models.Model):
    title=models.CharField(max_length=255, blank=False)
    caller = models.OneToOneField(main_nav, on_delete=models.CASCADE, default="")
    content=models.TextField(blank=False)
    is_active = models.BooleanField(default=True)
    publish_date = models.DateField()

    class Meta:
        verbose_name = "Sayfa"
        verbose_name_plural = "Sayfalar"

    def __str__(self):
        return f"{self.title}"
    

class team_roles(models.Model):
    name = models.CharField(max_length=30, blank=False)
    role_level = models.SmallIntegerField()

    class Meta:
        verbose_name = "Rol"
        verbose_name_plural = "Roller"

    def __str__(self) -> str:
        return f"{self.name}"
    
class team_member(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='team_member')
    role = models.ManyToManyField(team_roles, related_name='team_members')
    class Meta:
        verbose_name = "Takım üyesi"
        verbose_name_plural = "Takım üyeleri"
    def __str__(self):
        return f"{self.user.username} | {self.user.first_name} {self.user.last_name}"
    
    
class contact_form(models.Model):
    fullName = models.CharField(max_length=120, blank=False)
    eposta = models.EmailField(blank=False)
    message = models.TextField(blank=False)
    isRead = models.BooleanField(default=False)

    class Meta:
        verbose_name = "İletişim formu"
        verbose_name_plural = "İletişim formu girişleri"

    def __str__(self):
        return f"{self.fullName}"

class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone_number = PhoneNumberField(blank=True, null=True)
    birth_date = models.DateField(null=True, blank=True)
    school_name = models.CharField(max_length=100, blank=True)
    gender_choices = [('male', 'Erkek'), ('female', 'Kadın'), ('other', 'Belirtmek istemiyorum')]
    gender = models.CharField(max_length=10, choices=gender_choices, blank=True)
    parent_first_name = models.CharField(max_length=30, blank=True)
    parent_last_name = models.CharField(max_length=30, blank=True)
    parent_email = models.EmailField(max_length=254, blank=True)
    parent_phone_number = PhoneNumberField(blank=True, null=True)
    parent_relationship_choices = [('mother', 'Anne'), ('father', 'Baba'), ('other', 'Diğer')]
    parent_relationship = models.CharField(max_length=10, choices=parent_relationship_choices, blank=True)

    class Meta:
        verbose_name = "Öğrenci"
        verbose_name_plural = "Öğrenciler"

    def __str__(self):
        return self.user.username if self.user else 'No User'
    
class projects(models.Model):
    header = models.CharField(max_length=144, blank=False)
    body = models.TextField(blank=True)
    t_image = models.ImageField(blank=False, upload_to="static/assets/uploads/")
    image_1 = models.ImageField(blank=True, upload_to="static/assets/uploads/")
    image_2 = models.ImageField(blank=True, upload_to="static/assets/uploads/")
    btn = models.CharField(max_length=244, blank=True)
    href = models.CharField(max_length=1144, blank=True)

    class Meta:
        verbose_name = "Proje"
        verbose_name_plural = "Projeler"

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

    class Meta:
        verbose_name = "Sponsor"
        verbose_name_plural = "Sponsorlar"

    def __str__(self):
        return f"{self.title}"
    
class News(models.Model):
    header = models.CharField(max_length=255, blank=False)
    desc = models.TextField(blank=True)
    head_image = models.ImageField(blank=False, upload_to="static/assets/upload/news")
    timestamp = models.DateTimeField(default=timezone.now)
    images = models.ManyToManyField('Image', blank=True)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name = "Haber"
        verbose_name_plural = "Haberler"

    def __str__(self):
        return f"{self.header}"

    def get_absolute_url(self):
        return reverse('haber_detay', args=[str(self.id)])
    

def news_upload_to(instance, filename):
    # Bu fonksiyon, yüklenen dosyanın hangi dizine kaydedileceğini belirler.
    # Kodunuzu ve gereksinimlerinizi uyarlamak için bu fonksiyonu düzenleyin.
    return f'news/{filename}'

class Image(models.Model):
    image = models.ImageField(upload_to="static/assets/upload/news")
    class Meta:
        verbose_name = "Görsel"
        verbose_name_plural = "Görseller"

    def __str__(self):
        return f"{self.image}"

class Application(models.Model):
    name = models.CharField(max_length=100)
    surname = models.CharField(max_length=100)
    age = models.IntegerField()
    school_name = models.CharField(max_length=100)
    school_level = models.CharField(max_length=50)  # Sınıf seviyesini metin olarak sakla
    email = models.EmailField()
    phone_number = models.CharField(max_length=15)  # PhoneNumberField kullanmıyorsanız CharField kullanın
    application_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Üye Başvurusu"
        verbose_name_plural = "Üye Başvuruları"

    def __str__(self):
        return f"{self.name} {self.surname}"
    