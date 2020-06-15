from django.db import models
from django.contrib.auth.models import AbstractUser, User


# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    verified = models.BooleanField(default=False, null=True)
    
    def __str__(self):
        return self.user.username



class Contact(models.Model):
    fname = models.CharField(max_length=200)
    lname = models.CharField(max_length=200)
    email = models.EmailField()
    message = models.TextField()
    
    def __str__(self):
        return self.fname


class Subscribtion(models.Model):
    email = models.EmailField()

    class Meta:
        verbose_name_plural = 'subscribtions'

    def __str__(self):
        return self.email          