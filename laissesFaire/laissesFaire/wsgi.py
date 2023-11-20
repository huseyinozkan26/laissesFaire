import os
from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'laissesFaire.settings')  # Projeye özgü settings modülüne ayarlayın

# Sanal ortamın yolunu ekleyin (eğer kullanılıyorsa)
activate_this = '/var/www/django/laissesFaire/lfEnv/bin/activate'
with open(activate_this) as file_:
    exec(file_.read(), dict(__file__=activate_this))

application = get_wsgi_application()