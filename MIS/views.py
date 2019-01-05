from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
import os

def index(request):
    return HttpResponseRedirect('/xadmin')

def backup(request):
    cmd = 'mysqldump -uroot -padmin mis > ./mis.sql'
    os.system(cmd)
    ret = '<script language=\'javascript\'>alert(\'备份成功\'); window.history.go(-1);</script>'
    return HttpResponse(ret)

def reload(request):
    cmd = 'mysql -uroot -padmin mis < ./mis.sql'
    os.system(cmd)
    ret = '<script language=\'javascript\'>alert(\'还原成功\'); window.history.go(-1);</script>'
    return HttpResponse(ret)
