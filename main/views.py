from django.shortcuts import render, get_object_or_404, redirect
from .models import Listing, Realtor, Reviews, Comment
from django.core.paginator import Paginator, PageNotAnInteger


# Create your views here.

def index(request):

    listings = Listing.objects.all().filter(is_on_home_page=True)
    realtors = Realtor.objects.all().filter(is_on_home_page=True) 
    reviews = Reviews.objects.all().filter(is_on_home_page=True)

    context = {
        'listings':listings,
        'realtors':realtors,
        'reviews':reviews,
    }

    return render(request, 'main/index.html', context)


def single_page(request, id):

    listing = get_object_or_404(Listing, id=id)
    comments = Comment.objects.filter(listing=listing).order_by('-created_on')
    
    context = {
        'listing': listing,
        'comments': comments,
    }

    #comments
    if request.method == 'POST':

        name = request.user.username
        email = request.user.email
        message = request.POST['message']
        
        comment = Comment(name=name, email=email, message=message, listing=listing)
        comment.save()


    return render(request, 'main/listing.html', context)


def catalog(request):

    listings = Listing.objects.all().filter(is_published=True)
    comments = Comment.objects.all()

    paginator = Paginator(listings, 9)
    page = request.GET.get('page')
    paged_blogs = paginator.get_page(page)

    context = {
        'listings': paged_blogs,
        'comments': comments,
    }

    return render(request, 'main/catalog.html', context)


def delete_listing(request, id):
    listing = Listing.objects.get(id=id)
    
    if request.method == 'POST':
        listing.delete()


    return redirect('catalog')


