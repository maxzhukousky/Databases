from django.contrib import admin
from .models import Contact, Subscribtion, Profile

# Register your models here.
class ContactAdmin(admin.ModelAdmin):
    list_display = ('fname', 'email')

admin.site.register(Contact, ContactAdmin)
admin.site.register(Subscribtion)
admin.site.register(Profile)