from django.contrib import admin
from import_export.admin import ImportExportModelAdmin

# Register your models here.
from .models import *


@admin.register(PingZhongXinXi)
class PingZhongXinXiAdmin(ImportExportModelAdmin):
    exclude = []
    list_display = ['pzbm', 'pzmc']
    search_fields = ['pzmc']


@admin.register(ChanPinXinXi)
class ChanPinXinXiAdmin(ImportExportModelAdmin):
    exclude = []
    list_display = ['cpmc', 'cpdj', 'cd', 'jj', 'bzw']
    list_filter = ['cpdj', 'cd', ]
    raw_id_fields = ['pzbm', ]
    readonly_fields = ['cpbh', ]
    search_fields = ['cpmc', ]


@admin.register(WuZiXinXi)
class WuZiXinXiAdmin(ImportExportModelAdmin):
    exclude = []
    list_display = ['wzbh', 'wzmc', 'jldw', 'jj', 'cj', ]
    search_fields = ['wzmc']


@admin.register(JiGou)
class JiGouAdmin(ImportExportModelAdmin):

    exclude = []
    list_display = ['jgbh', 'jgmc', 'jglb', 'fzr', 'lxdh']
    list_filter = ['jglb', 'fzr', ]
    readonly_fields = ['jgmc']
    search_fields = ['cpmc']


@admin.register(NongHuXinXi)
class NongHuXinXiAdmin(ImportExportModelAdmin):
    list_display = ['nhbh', 'nhmc', 'nhzz', 'dgd', 'lxdh', ]
    exclude = []
    search_fields = ['cpmc']

# 部门单独化

# @admin.register(GongSi)
# class GongSiAdmin(ImportExportModelAdmin):
#     exclude = []
#     list_display = ['code', 'name', 'location', ]
#     search_fields = ['code']
#
#
# @admin.register(PiFaZhongXin)
# class PiFaZhongXinAdmin(ImportExportModelAdmin):
#     exclude = []
#     list_display = ['code', 'name', 'location', ]
#     search_fields = ['code']
#
#
# @admin.register(ShengChanJiDi)
# class ShengChanJiDiAdmin(ImportExportModelAdmin):
#     exclude = []
#     list_display = ['code', 'name', 'location', ]
#     search_fields = ['code']
#
#
# @admin.register(DaiGouDian)
# class DaiGouDianAdmin(ImportExportModelAdmin):
#     exclude = []
#     list_display = ['code', 'name', 'location', ]
#     search_fields = ['code']
