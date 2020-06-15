from django.test import RequestFactory
from django.urls import reverse
from django.contrib.auth.models import User, AnonymousUser
from accounts.views import contacting
from mixer.backend.django import mixer
import pytest


@pytest.mark.django_db
class TestViews:

    def test_contacting_unauthenticated(self):
        path = reverse('index')
        request = RequestFactory().get(path)
        request.user = AnonymousUser()

        response = contacting(request)
        assert 'accounts/login' in response

    def test_contacting_authenticated(self):
        path = reverse('index')
        request = RequestFactory().get(path)
        request.user = mixer.blend(User)

        response = contacting(request)
        assert response.status_code == 200
