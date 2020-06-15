from django.urls import resolve, reverse


class TestUrls:


    def test_listing_url(self):
        path = reverse('singlepage', kwargs={'id': 1})
        assert resolve(path).view_name == 'singlepage'