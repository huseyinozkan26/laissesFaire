from django.db import models

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

    def __str__(self):
        return self.name
    class Meta:
        ordering = ['level']

class Topic(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    order = models.IntegerField(default=0)

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

