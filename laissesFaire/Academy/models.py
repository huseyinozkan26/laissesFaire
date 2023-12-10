from django.db import models
from django.contrib.auth.models import User

class Level(models.Model):
    name = models.CharField(max_length=100)
    order = models.IntegerField(default=0)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['order']

class Course(models.Model):
    name = models.CharField(max_length=100)
    level = models.ForeignKey(Level, on_delete=models.CASCADE)
    menu_icon = models.CharField(max_length=100, default="fa-graduation-cap")

    def __str__(self):
        return self.name
    class Meta:
        ordering = ['level']

class Topic(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    order = models.IntegerField(default=0)
    menu_icon = models.CharField(max_length=100, default="fa-graduation-cap")

    def __str__(self):
        return self.name
    class Meta:
        ordering = ['course', 'order']
    
class Content(models.Model):
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    content_type_choices = [('scorm', 'Scorm'), ('video', 'Video')]
    content_type = models.CharField(max_length=10, choices=content_type_choices)
    file = models.FileField(upload_to="static/assets/uploads/academy/contents")

    def __str__(self):
        return self.title

class WatchedContent(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.ForeignKey(Content, on_delete=models.CASCADE)
    watched_duration = models.PositiveIntegerField(default=0)
    last_watched_timestamp = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.username} - {self.content.title}"