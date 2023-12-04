from .models import Course, Topic

def sidebar_data(request):
    courses = Course.objects.all()
    topics = Topic.objects.all()

    return {'courses': courses, 'topics': topics}
