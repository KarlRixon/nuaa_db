from django.shortcuts import render

from django.http import HttpResponse

from .models import Commodity, Customer, Record

from django.db import connection

def hello_world(request):
    return HttpResponse("Hello World")

def index(request):
    cname = request.POST.get('cname')
    gname = request.POST.get('gname')
    result = {}
    cursor = connection.cursor()
    if cname != None:
        result['c'] = True
        result['g'] = False
        sql = "select gname, gprice, rnum, rtime from commodity, customer, record " \
              "where commodity.gid=record.gid and record.cid=customer.cid " \
              "and customer.cname='%s';" %cname
        cursor.execute(sql)
        rows = cursor.fetchall()
        result['cr'] = rows
        result['cn'] = cname
        # print(result['c'])
        # print(result['cr'])
    elif gname != None:
        result['g'] = True
        result['c'] = False
        sql = "select cname, csex, cphone from commodity, customer, record " \
              "where commodity.gid=record.gid and record.cid=customer.cid " \
              "and commodity.gname='%s';" %gname
        cursor.execute(sql)
        rows = cursor.fetchall()
        result['gr'] = rows
        result['gn'] = gname
        # print(result['g'])
        # print(result['gr'])
    return render(request, 'index.html', result)