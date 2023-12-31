from django.conf import settings
from django.http import HttpResponse
from django.shortcuts import render,redirect, get_object_or_404
from .models import page as pages, main_nav as Main_nav, team_member, projects as Projects, Sponsors, News, contact_form as Contact, Application
from .forms import ContactForm, StudentForm, ApplicationForm
from django.contrib.auth import login
from django.core.mail import EmailMessage


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
    return render(request, 'forms/contact.html', {'form': form, 'navigation': navigation})


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

def create_student(request):
    navigation = get_main_nav()
    
    if request.method == 'POST':
        form = StudentForm(request.POST)
        if form.is_valid():
            form.save()
            kullanici_adi = form.cleaned_data['username']
            return render(request, 'formSuccess.html',{
                'navigation': navigation,
                'message': "Tebrikler, "+kullanici_adi+" kullanıcı kaydın başarıyla alındı.<br>Giriş bilgilerin admin tarafından onaylandığında sisteme giriş yapabileceksin."

            })
    else:
        form = StudentForm()

    return render(request, 'forms/register.html', {'form': form, 'navigation': navigation})

def apply_view(request):

    navigation = get_main_nav()

    if request.method == 'POST':
        form = ApplicationForm(request.POST)
        if form.is_valid():
            # Aynı e-posta adresi veya telefon numarasına sahip bir başvuru var mı kontrol et
            existing_application = Application.objects.filter(
                email=form.cleaned_data['email']  # veya phone_number=form.cleaned_data['phone_number']
            ).exists()

            if not existing_application:
                application = Application(
                    name=form.cleaned_data['name'],
                    surname=form.cleaned_data['surname'],
                    age=form.cleaned_data['age'],
                    school_name=form.cleaned_data['school_name'],
                    school_level=form.cleaned_data['school_level'],
                    email=form.cleaned_data['email'],
                    phone_number=form.cleaned_data['phone_number']
                )
                
                application.save()
                return render(request, 'forms/application.html', {
                    'message': "Başvurunuz başarıyla alındı.",
                    "form": form,
                    "navigation" : navigation
                })
            else:
                form.add_error(None, 'Bu e-posta adresi/telefon numarası ile zaten bir başvuru yapılmış.')
    else:
        form = ApplicationForm()

    return render(request, 'forms/application.html', {'form': form, 'navigation': navigation})