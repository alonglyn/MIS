from django.contrib import admin
from django.utils import timezone
from import_export.admin import ImportExportModelAdmin
from daterange_filter.filter import DateRangeFilter
from .models import *
import django.utils.timezone as timezone




@admin.register(ChanPinKuCun)
class ChanPinKuCunAdmin(ImportExportModelAdmin):

    # 获得库存量
    def count(self, obj):
        return obj.count()

    count.short_description = '库存量'
    exclude = []
    list_display = ['cpkcbh', 'ssjg', 'cpmc', 'count']
    readonly_fields = ['cpkcbh', ]
    raw_id_fields = ['ssjg', 'cpbh', ]


@admin.register(ChanPinRuKu)
class ChanPinRuKuAdmin(ImportExportModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.jsr = request.user
        obj.save()

    readonly_fields = ['je', 'jsr', 'pm']
    fieldsets = (
        ('必填条目', {
            'fields': ('rkdh', 'cpkc', 'dj', 'sl',)
        }),
        ('选填条目', {
            'classes': ('collaspe',),
            'fields': ('jyr', 'nh', 'ckdh'),
        }),
        ('只读条目', {
            'classes': ('wide', 'extrapretty'),
            'fields': (('je', 'pm',), ('jsr', 'czsj',))
        }),

    )
    list_display = ['rkdh', 'cpkc', 'dj', 'sl', 'je', 'jyr', 'jsr', 'czsj']
    raw_id_fields = ['cpkc', ]
    list_filter = [
        'cpkc__cpmc',
        'cpkc__ssjg__jglb',
        ('czsj', DateRangeFilter),
    ]


@admin.register(ChanPinChuKu)
class ChanPinChuKuAdmin(ImportExportModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.jsr = request.user
        obj.save()

    readonly_fields = ['je', 'jsr', 'pm']
    fieldsets = (
        ('必填条目', {
            'fields': ('ckdh', 'cpkc', 'dj', 'sl',)
        }),

        ('选填条目', {
            'classes': ('collaspe',),
            'fields': ('jyr', 'nh', 'rkdh'),
        }),
        ('只读条目', {
            'classes': ('wide', 'extrapretty'),
            'fields': (('je', 'pm'), ('jsr', 'czsj',))
        }),
    )
    list_display = ['ckdh', 'cpkc', 'dj', 'sl', 'je', 'jyr', 'jsr', 'czsj']
    raw_id_fields = ['cpkc', ]
    list_filter = [
        'cpkc__cpmc',
        'cpkc__ssjg__jglb',
        ('czsj', DateRangeFilter),
    ]


@admin.register(ChanPinXiaoShou)
class ChanPinXiaoShouAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        if obj.jsr is None or obj.jsr == '':
            obj.jsr = request.user
        obj.save()

    readonly_fields = ['id', 'je', ]
    fieldsets = (
        ('必填条目', {
            'fields': ('cpkc', 'dj', 'sl',)
        }),

        ('选填条目', {
            'classes': ('collaspe',),
            'fields': ('jsr',),
        }),
        ('只读条目', {
            'classes': ('wide', 'extrapretty'),
            'fields': ('id', 'je', 'xssj',),
        }),
    )
    list_display = ['id', 'cpkc', 'dj', 'sl', 'je', 'jsr', 'xssj']
    raw_id_fields = ['cpkc', 'jsr']
    list_filter = [
        'cpkc__cpmc',
        'cpkc__ssjg__jglb',
        ('xssj', DateRangeFilter),
    ]


