# Academy/views.py

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import UserProfileForm, PasswordResetForm
from .models import Course, Topic


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
