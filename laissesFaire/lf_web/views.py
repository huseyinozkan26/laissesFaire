from django.conf import settings
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from .models import page as pages, main_nav as Main_nav, team_member, projects as Projects, Sponsors, News, contact_form as Contact
from .forms import ContactForm


def get_main_nav():
    try:
        main_nav = Main_nav.objects.filter(is_active=True).order_by('level')
        return main_nav
    except:
        return None


def index(request):
    navigation = get_main_nav()
    aboutUs = pages.objects.get(title="Hakkımızda")
    news = News.objects.all().order_by('-timestamp')[:5]
    return render(request, 'index.html', {
        'navigation': navigation,
        'aboutUs': aboutUs,
        'news': news
    })


def ourProjects(request):
    navigation = get_main_nav()
    ourProjects = Projects.objects.all()
    return render(request, "ourProjects.html", {
        'navigation': navigation,
        'projects': ourProjects
    })


def projectDetails(request, project_id):
    navigation = get_main_nav()
    project = get_object_or_404(Projects, pk=project_id)
    return render(request, 'projectDetail.html', {'project': project, 'navigation': navigation})


def ourNews(request):
    navigation = get_main_nav()
    newss = News.objects.all().order_by('-timestamp')

    return render(request, 'ourNews.html', {
        'navigation': navigation,
        'newss': newss
    })


def newsDetails(request, news_id):
    navigation = get_main_nav()
    news = get_object_or_404(News, pk=news_id)
    return render(request, 'newsDetails.html', {'news': news, 'navigation': navigation})


def ourSponsors(request):
    navigation = get_main_nav()
    ourSponsors = Sponsors.objects.all().order_by('queue')
    return render(request, "ourSponsors.html", {
        'navigation': navigation,
        'sponsors': ourSponsors
    })


def team(request):
    navigation = get_main_nav()
    team_members = team_member.objects.prefetch_related('role').all()
    print(team_members)

    return render(request, "team.html", {
        "navigation": navigation
    })


def contact(request):
    navigation = get_main_nav()
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            message = form.cleaned_data['message']
            # eposta gönderme

            print(settings.EMAIL_ADMIN)
            try:
                # EmailMessage nesnesi oluşturun
                mail_subject = f'{name} isimli kişinin | {email} e-posta adresi ile iletişim formu mesajı'
                mail_body = message
                mail = EmailMessage(
                    mail_subject,
                    mail_body,
                    settings.DEFAULT_FROM_EMAIL,  # Ayarlarınızdan gelen varsayılan gönderen e-posta adresini kullanın
                    [settings.EMAIL_ADMIN],  # Alıcı e-posta adreslerinin bulunduğu liste
                    reply_to=[email],  # Yanıt e-posta adresini belirtin
                )
                
                # E-postayı gönderin
                mail.send()
            except Exception as e:
                print(f"E-Posta gönderilirken hata oluştu: {e}")
    
            # veritabanı kayıt işlemleri
            contact_model = Contact.objects.create(
                fullName=name, eposta=email, message=message)

            return render(request, 'success.html', {'name': name, 'navigation': navigation})
    else:
        form = ContactForm()
    return render(request, 'contact.html', {'form': form, 'navigation': navigation})


def academy(request):
    return HttpResponse("Akademi")


def page(request, page):
    navigation = get_main_nav()
    try:
        _response = pages.objects.get(caller__href=page)

        return render(request, 'page.html', {
            'pageValues': _response,
            'navigation': navigation
        })
    except:
        _response = "Sayfa Bulunamadı"
        navigation = get_main_nav()
        return render(request, 'error.html', {
            'navigation': navigation,
            'error': {
                'code': '404',
                'text': 'sayfa bulunamadı'
            }
        })


from django.core.mail import EmailMessage

