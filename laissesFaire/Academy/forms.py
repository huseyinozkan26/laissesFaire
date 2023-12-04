from django import forms
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.models import User

class UserProfileForm(UserChangeForm):
    avatar = forms.ImageField(required=False, widget=forms.ClearableFileInput(attrs={'class': 'form-control-file'}))
    first_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class': 'form-control'}))

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email', 'avatar']

    def __init__(self, *args, **kwargs):
        super(UserProfileForm, self).__init__(*args, **kwargs)
        # Mevcut değerleri formda göstermek için:
        self.fields['avatar'].initial = self.instance.profile.avatar.url if hasattr(self.instance, 'profile') and self.instance.profile.avatar else None
        # Şifreyi göstermeyi devre dışı bırak
        self.fields.pop('password', None)

class PasswordResetForm(PasswordChangeForm):
    class Meta:
        model = User
        fields = []

    def __init__(self, *args, **kwargs):
        super(PasswordResetForm, self).__init__(*args, **kwargs)
