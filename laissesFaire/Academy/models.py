from django.db import models
from django.contrib.auth.models import User

class Level(models.Model):
    name = models.CharField(max_length=100)
    order = models.IntegerField(default=0)
    

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['order']
        verbose_name = "Seviye"
        verbose_name_plural = "Seviyeler"

class Course(models.Model):
    name = models.CharField(max_length=100)
    level = models.ForeignKey(Level, on_delete=models.CASCADE)
    menu_icon = models.CharField(max_length=100, default="fa-graduation-cap")

    def __str__(self):
        return self.name
    class Meta:
        ordering = ['level']
        verbose_name = "Ders"
        verbose_name_plural = "Dersler"

class Topic(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    order = models.IntegerField(default=0)
    menu_icon = models.CharField(max_length=100, default="fa-graduation-cap")

    def __str__(self):
        return self.name
    class Meta:
        ordering = ['course', 'order']
        verbose_name = "Konu"
        verbose_name_plural = "Konular"
    
class Content(models.Model):
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    content_type_choices = [('scorm', 'Scorm'), ('video', 'Video')]
    content_type = models.CharField(max_length=10, choices=content_type_choices)
    file = models.FileField(upload_to="static/assets/uploads/academy/contents")
    image = models.ImageField(upload_to="static/assets/uploads/academy/contentImg", blank=True)
    
    class Meta:
        verbose_name = "İçerik"
        verbose_name_plural = "İçerikler"

    def __str__(self):
        return self.title

class WatchedContent(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.ForeignKey(Content, on_delete=models.CASCADE)
    watched_duration = models.PositiveIntegerField(default=0)
    last_watched_timestamp = models.DateTimeField(auto_now=True)
    watched_percentage = models.FloatField(default=0)
    
    class Meta:
        verbose_name = "İzlenme"
        verbose_name_plural = "İzlenmeler"

    def __str__(self):
        return f"{self.user.username} - {self.content.title}"