from django.contrib import admin

from .models import Commodity, Customer, Record

# Register your models here.

admin.site.register(Commodity)
admin.site.register(Customer)
admin.site.register(Record)