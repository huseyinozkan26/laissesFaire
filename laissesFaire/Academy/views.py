# Academy/views.py

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib import messages

from django.http import JsonResponse
from django.views.decorators.http import require_POST


from .forms import UserProfileForm, PasswordResetForm

from .models import Course, Topic, Content, WatchedContent


def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            # Başarılı giriş yapıldığında yönlendirilecek sayfa
            return redirect('dashboard')
        else:
            # Kullanıcı adı veya şifre hatalı
            return render(request, 'academy/login.html', {'error_message': 'Invalid username or password'})

    return render(request, 'academy/login.html')


@login_required
def logout_view(request):
    logout(request)
    return redirect('login')  # Oturum kapatıldığında yönlendirilecek sayfa


@login_required
def dashboard_view(request):
    return render(request, 'academy/index.html')


@login_required
def profile_view(request):
    user_profile_form = UserProfileForm(instance=request.user)
    password_reset_form = PasswordResetForm(user=request.user)

    if request.method == 'POST':
        if 'profile-update' in request.POST:
            user_profile_form = UserProfileForm(
                request.POST, request.FILES, instance=request.user)
            if user_profile_form.is_valid():
                user_profile_form.save()
                messages.success(request, 'Profil başarıyla güncellendi.')
                return redirect('profile')

        elif 'password-reset' in request.POST:
            password_reset_form = PasswordResetForm(request.user, request.POST)
            if password_reset_form.is_valid():
                user = password_reset_form.save()
                # Güncellenen şifre sonrasında oturumu güncelle
                update_session_auth_hash(request, user)
                messages.success(request, 'Şifre başarıyla sıfırlandı.')
                return redirect('profile')

    return render(request, "academy/profile.html", {'user_profile_form': user_profile_form, 'password_reset_form': password_reset_form})


@login_required
def settings_view(request):
    return render(request, "academy/settings.html")


@login_required
def content_list(request, topic_id):
    topic = Topic.objects.get(pk=topic_id)
    contents = Content.objects.filter(topic=topic)
    return render(request, 'academy/content_list.html', {'topic': topic, 'contents': contents})

@login_required
def show_content(request, content_id):
    content = Content.objects.get(pk=content_id)
    return render(request, 'academy/show_content.html', {"content": content})


@require_POST
def update_watched_duration(request):
    content_id = request.POST.get('content_id')
    watched_duration = request.POST.get('watched_duration')

    # İzleme durumu bilgisini güncelle
    try:
        watched_content = WatchedContent.objects.get(content_id=content_id, user=request.user)
        watched_content.watched_duration = watched_duration
        watched_content.save()
    except WatchedContent.DoesNotExist:
        # Eğer izleme durumu kaydı yoksa, oluşturabilirsiniz
        WatchedContent.objects.create(content_id=content_id, user=request.user, watched_duration=watched_duration)

    return JsonResponse({'success': True})


def get_watched_duration(request):
    content_id = request.GET.get('content_id')
    try:
        watched_content = WatchedContent.objects.get(content_id=content_id, user=request.user)
        return JsonResponse({'success': True, 'watched_duration': watched_content.watched_duration})
    except WatchedContent.DoesNotExist:
        return JsonResponse({'success': False})