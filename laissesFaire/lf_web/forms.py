from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from django import forms
from phonenumber_field.formfields import PhoneNumberField
from .models import Student
from django.contrib.auth.models import User


class ContactForm(forms.Form):
    name = forms.CharField(
        label='Adınız Soyadınız',
        max_length=100,
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        required=True  # isim alanı boş bırakılamaz
    )
    email = forms.EmailField(
        label='E-Posta Adresiniz',
        widget=forms.EmailInput(attrs={'class': 'form-control'}),
        required=True  # email alanı boş bırakılamaz
    )
    message = forms.CharField(
        label='Mesajınız',
        widget=forms.Textarea(attrs={'class': 'form-control'}),
        required=True  # mesaj alanı boş bırakılamaz
    )

class StudentForm(forms.ModelForm):

    # User modeline ait alanlar
    username = forms.CharField(
        label="Kullanıcı adı:",
        widget=forms.TextInput(attrs={'class': 'form-control col-md-4'}))
    email = forms.EmailField(
        label="E-posta",
        widget=forms.EmailInput(
        attrs={'class': 'form-control col-md-4'}))
    password = forms.CharField(
        label="Şifre",
        widget=forms.PasswordInput(attrs={'class': 'form-control col-md-4'}))

    class Meta:
        model = User
        fields = ['username', 'email', 'password']

     # Students modeline ait alanlar
    phone_number = PhoneNumberField(
        label="Telefon numarası:",
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control col-auto'})
    )
    birth_date = forms.DateField(
        label="Doğum tarihi:",
        required=False,
        widget=forms.DateInput(attrs={'type': 'date', "class": "form-control col-auto"})
    )
    school_name = forms.CharField(
        label="Okul adı:",
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control col-auto'})
    )
    gender = forms.ChoiceField(
        label="Cinsiyet:",
        choices=[('male', 'Erkek'), ('female', 'Kadın'),
                 ('other', 'Belirtmek istemiyorum')],
        required=False,
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    parent_first_name = forms.CharField(
        label="Veli adı:",
        required=False,  
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    parent_last_name = forms.CharField(
        label="Veli soyadı:",
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    parent_email = forms.EmailField(
        label="Veli e-posta:",
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    parent_phone_number = PhoneNumberField(
        label="Veli telefon numarası:",
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    parent_relationship = forms.ChoiceField(
        label="Veli yakınlığı:",
        choices=[('mother', 'Anne'), ('father', 'Baba'), ('other', 'Diğer')], 
        required=False,
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    #phone_number = PhoneNumberField()

    birth_date = forms.DateField(
        label="Doğum tarihi:",
        widget=forms.DateInput(
            attrs={'type': 'date', 'class': 'form-control'}),
        input_formats=['%Y-%m-%d'],
        required=False
    )

    def save(self, commit=True):
        # User modeline ait bilgileri kaydet
        user = super(StudentForm, self).save(commit=False)
        user.set_password(self.cleaned_data['password'])
        if commit:
            user.save()

        # UserProfile modeline ait bilgileri kaydet
        Students = Student.objects.create(
            user=user,
            phone_number=self.cleaned_data['phone_number'],
            birth_date=self.cleaned_data['birth_date'],
            school_name=self.cleaned_data['school_name'],
            gender=self.cleaned_data['gender'],
            parent_first_name=self.cleaned_data['parent_first_name'],
            parent_last_name=self.cleaned_data['parent_last_name'],
            parent_email=self.cleaned_data['parent_email'],
            parent_phone_number=self.cleaned_data['parent_phone_number'],
            parent_relationship=self.cleaned_data['parent_relationship'],
        )

        return user, Students
