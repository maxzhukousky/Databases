from django.contrib import admin
from .models import Listing, Realtor, Reviews, Comment

# Register your models here.

class ListingAdmin(admin.ModelAdmin):
    list_display = ('address' ,'realtor', 'city', 'is_published')
    list_editable = ('is_published',)
    list_filter = ('city',)

class RealtorAdmin(admin.ModelAdmin):
    list_display = ('name', 'position', 'is_on_home_page')   
    list_editable = ('is_on_home_page',)

class CommentAdmin(admin.ModelAdmin):
    list_display    = ('name', 'created_on', 'email')
    list_filter     = ('created_on',)
    search_fields   = ('name', 'email', 'message')   


class ReviewsAdmin(admin.ModelAdmin):
    list_display = ('guest', 'is_on_home_page')
    list_editable = ('is_on_home_page',)


admin.site.register(Listing, ListingAdmin)
admin.site.register(Realtor, RealtorAdmin)
admin.site.register(Reviews, ReviewsAdmin)
admin.site.register(Comment, CommentAdmin)