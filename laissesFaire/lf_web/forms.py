from django import forms

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