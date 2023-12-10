from django.contrib import admin
from .models import Level, Course, Topic, Content, WatchedContent
admin.site.register(Level)
admin.site.register(Course)
admin.site.register(Topic)
admin.site.register(Content)
admin.site.register(WatchedContent)