from django.shortcuts import render, redirect
from django.contrib import auth, messages
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .models import Contact, Subscribtion
from django.core.mail import send_mail
import time
from datetime import datetime
import multiprocessing
import logging, traceback


# Create your views here.
logger = logging.getLogger('django')

def login(request):
    if request.method == 'POST':

        username = request.POST['username']
        password = request.POST['password']

        user = auth.authenticate(username=username, password=password)

        if user is not None:
            auth.login(request, user)
            logger.info(f'{ username } logged in')
            return redirect('index')
        else:
            messages.error(request, 'Invalid username/password')
            logger.warning('invalid username/password')
            return redirect('login')
    else:    
        return render(request, 'accounts/login.html')  


def register(request):
    if request.method == 'POST':
        # get form values
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        username = request.POST['username']
        password = request.POST['password']
        password2 = request.POST['password2']
        email = request.POST['email']

        # passwords should match
        if password == password2:
            if User.objects.filter(username=username).exists():
                messages.error(request, 'That username is taken')
                return redirect('register')
            else:
                if User.objects.filter(email=email).exists():
                    messages.error(request, 'That email is taken. Please, log in.')
                    return redirect('register')
                else:  
                    user = User.objects.create_user(username=username, password=password, email=email, first_name=first_name, last_name=last_name) 
                    user.save()
                    messages.success(request, f'Account created for {username}')
                    logger.info(f'Account created for {username}')
                    return redirect('login')

        else:
            messages.error(request, 'Passwords should match')
            return redirect('register')    

    else:    
        return render(request, 'accounts/register.html')    



def logout(request):
    if request.method == 'POST':
        auth.logout(request)
        print('you are logged out')
    
        return render(request, 'main/index.html') 


@login_required
def contacting(request):
    if request.method == 'POST':
        fname = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        message_contact = request.POST['message_contact']

        contact = Contact(fname=fname, lname=lname, email=email, message=message_contact)
        contact.save()


        send_mail(
            'customer`s message',
            f'From { fname } { lname } ({ email }). { message_contact }. Sign into the admin panel for more info.',
            'sanyok200092@gmail.com',
            ['a.amialiashka@gmail.com'],
            fail_silently=False,
        )

        messages.success(request, 'Your message has been sent!')

        return redirect('index')    


def subscribe(request):
    if request.method == 'POST':
        email = request.POST['email']

        sub = Subscribtion(email=email)
        sub.save()

        messages.success(request, 'Thanks, sub!')
        return redirect('index')        


def mailing(request):
    start = time.time() 
    subscribers = Subscribtion.objects.all()
    arr = list(subscribers)


    if request.method == 'POST':
        print('Sleeping 1 second ...')
        time.sleep(1)

        message = request.POST['message']
 
        processes = []

        for i in arr:
            print(i)
            p = multiprocessing.Process(target=func, args=[i, message])
            p.start()
            processes.append(p)

        for process in processes:
            process.join()

        print(time.time() - start) 
        return redirect('/admin')  
  
def func(*args):

    send_mail(
        'It`s Warehouse!',
        f'{ args[1] }',
        'sanyok200092@gmail.com',
        [args[0]],
        fail_silently=False,
    )