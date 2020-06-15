from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Realtor(models.Model):
    name = models.CharField(max_length=200)
    photo = models.ImageField(upload_to='photos/%Y/%m/%d/', blank=True)
    position = models.CharField(max_length=200)
    description = models.CharField(max_length=300)
    is_on_home_page = models.BooleanField(default=False)
    facebook = models.CharField(max_length=200, blank=True)
    twitter = models.CharField(max_length=200, blank=True)
    linkedin = models.CharField(max_length=200, blank=True)
    instagram = models.CharField(max_length=200, blank=True)

    def __str__(self):
        return self.name


 

class Listing(models.Model):
    address = models.CharField(max_length=200)
    city = models.CharField(max_length=100)
    country = models.CharField(max_length=100)
    photo_main = models.ImageField(upload_to='photos/%Y/%m/%d/')
    photo_1 = models.ImageField(upload_to='photos/%Y/%m/%d/', blank=True)
    photo_2 = models.ImageField(upload_to='photos/%Y/%m/%d/', blank=True)
    photo_3 = models.ImageField(upload_to='photos/%Y/%m/%d/', blank=True)
    price = models.IntegerField()
    is_published = models.BooleanField(default=True)
    is_on_home_page = models.BooleanField(default=False)
    bedrooms = models.IntegerField()
    bathrooms = models.IntegerField()
    sqft = models.IntegerField()
    description = models.CharField(max_length=1000)
    realtor = models.ForeignKey(Realtor, on_delete=models.DO_NOTHING, null=True)

    def __str__(self):
        return self.address


    def get_absolute_url(self):
        return reverse('singlepage', kwargs={
            'id': self.id
        }) 

    @property
    def get_comments(self):
        return self.comments.all()    



class Comment(models.Model):
    listing     = models.ForeignKey(Listing, on_delete=models.CASCADE, related_name='comments', null=True)
    user        = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    message     = models.TextField(blank=True, null=True)
    name        = models.CharField(max_length=200, null=True)
    email       = models.EmailField(null=True)
    created_on  = models.DateTimeField(auto_now_add=True, null=True)
    def __str__(self):
        return self.name


class Reviews(models.Model):
    guest = models.CharField(max_length=200)
    guest_photo = models.ImageField(upload_to='photos/%Y/%m/%d/')
    text_comment = models.TextField()
    is_on_home_page = models.BooleanField(default=False, blank=True)

    class Meta:
        verbose_name_plural = 'Reviews'

    def __str__(self):
        return self.guest