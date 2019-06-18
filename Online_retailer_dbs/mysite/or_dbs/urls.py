from django.urls import path, include

import or_dbs.views

urlpatterns = [
    path('hello_world', or_dbs.views.hello_world),
    path('index', or_dbs.views.index)
]