from django.contrib import admin
from import_export.admin import ImportExportModelAdmin
# Register your models here.
from .models import *


@admin.register(ShuCaiShengChan)
class ShuCaiShengChanAdmin(ImportExportModelAdmin):
    list_display = ['scbh', 'zzmj', 'bzq', 'dw', ]
    exclude = []
    search_files = ['scbh', ]
    list_filter = ['scbh', 'bzq']
    raw_id_fields = ['scbh', ]


@admin.register(NongHuShengChan)
class NongHuShengChanAdmin(ImportExportModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.zdr = request.user
        obj.save()

    list_display = ['nh', 'parent', 'zdsj', 'zdr', 'status']
    exclude = []
    raw_id_fields = ['nh', 'parent', ]
    search_files = ['nh']
    list_filter = ['zdsj', 'status']
    # filter_horizontal = ['scscjh']


@admin.register(DaiGouDianShengChan)
class DaiGouDianShengChanAdmin(ImportExportModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.zdr = request.user
        obj.save()

    list_display = ['dgd', 'parent', 'zdsj', 'zdr', 'status']
    exclude = []
    raw_id_fields = ['dgd', 'parent']
    search_files = ['dgd', ]
    list_filter = ['zdsj', 'status']
    # filter_horizontal = ['scscjh']


@admin.register(ShengChanJiDiShengChan)
class ShengChanJiDiShengChanAdmin(ImportExportModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.zdr = request.user
        obj.save()

    list_display = ['scjd', 'parent', 'zdsj', 'zdr', 'status']
    exclude = []
    raw_id_fields = ['scjd', 'parent']
    search_files = ['scjd', ]
    list_filter = ['zdsj', 'status']
    # filter_horizontal = ['scscjh']


@admin.register(GongSiShengChan)
class GongSiShengChanAdmin(ImportExportModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.zdr = request.user
        obj.save()

    list_display = ['scjhbh', 'zdsj', 'zdr', 'status']
    exclude = []
    list_filter = ['zdsj', 'status']
    # filter_horizontal = ['scscjh']
