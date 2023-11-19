from django.contrib import admin
from .models import main_nav,team_member,team_roles,page,contact_form,projects, Sponsors, News
# Register your models here.

admin.site.register(main_nav)
admin.site.register(team_roles)
admin.site.register(team_member)
admin.site.register(page)
admin.site.register(contact_form)
admin.site.register(projects)
admin.site.register(Sponsors)
admin.site.register(News)