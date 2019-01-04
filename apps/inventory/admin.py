# from django.contrib import admin
# from daterange_filter.filter import DateRangeFilter
# # Register your models here.
# from import_export.admin import ImportExportModelAdmin
# from django.utils import timezone
# from .models import *
#
#
# # class WuZiCangKuAdmin(ImportExportModelAdmin):
# #     exclude = []
# #
# #     def save_model(self, request, obj, form, change):
# #         obj.ckmc = '%s-%s' % (obj.jg, obj.ckbh)
# #         obj.save()
# #
# #     # list_display = ['ckbh', 'ckmc', 'jg']
# #     raw_id_fields = ('jg',)
# #     readonly_fields = ('ckmc',)
#
# @admin.register(WuZiKuCun)
# class WuZiKuCunAdmin(ImportExportModelAdmin):
#     # def save_model(self, request, obj, form, change):
#     #     obj.wzmc = obj.wzbh.wzmc
#     #     obj.wzkcbh = obj.ssjg.jgbh + '-' + obj.wzbh.wzbh
#     #     obj.save()
#
#     def count(self, obj):
#         return obj.count()
#
#     count.short_description = '库存量'
#     exclude = []
#     list_display = ['wzkcbh', 'ssjg', 'wzmc', 'count']
#     readonly_fields = ['wzkcbh', ]
#     raw_id_fields = ['ssjg', 'wzbh', ]
#
#
# @admin.register(WuZiRuKu)
# class WuZiRuKuAdmin(ImportExportModelAdmin):
#     def save_model(self, request, obj, form, change):
#         obj.czz = request.user
#         obj.save()
#
#     exclude = []
#     list_display = ['rkdh', 'wzkc', 'jj', 'sl', 'czz', 'czsj']
#     raw_id_fields = ['wzkc', ]
#     list_filter = [
#         'wzkc__wzmc',
#         'wzkc__ssjg__jglb',
#         ('czsj', DateRangeFilter),
#     ]
#
#
# @admin.register(WuZiChuKu)
# class WuZiChuKuAdmin(ImportExportModelAdmin):
#     def save_model(self, request, obj, form, change):
#         obj.czz = request.user
#         obj.save()
#
#     exclude = []
#     list_display = ['ckdh', 'wzkc', 'cj', 'sl', 'czz', 'czsj']
#     raw_id_fields = ['wzkc', ]
#     list_filter = [
#         'wzkc__wzmc',
#         'wzkc__ssjg__jglb',
#         ('czsj', DateRangeFilter),
#     ]
#
#
# @admin.register(WuZiFaFang)
# class WuZiFaFangAdmin(admin.ModelAdmin):
#     def save_model(self, request, obj, form, change):
#         if obj.czz is None or obj.czz == '':
#             obj.czz = request.user
#         obj.save()
#
#     readonly_fields = ['ffbh', 'je', 'cj', 'czsj', ]
#     fieldsets = (
#         ('必填条目', {
#             'fields': ('wzkc', 'sl','nh')
#         }),
#
#         ('选填条目', {
#             'classes': ('collaspe',),
#             'fields': ('czz',),
#         }),
#         ('只读条目', {
#             'classes': ('wide', 'extrapretty'),
#             'fields': ('ffbh', 'je', 'cj', 'czsj',),
#         }),
#     )
#     list_display = ['ffbh', 'wzkc', 'cj', 'sl', 'je', 'czz', 'czsj']
#     raw_id_fields = ['wzkc', 'czz']
#     list_filter = [
#         'wzkc__wzmc',
#         'wzkc__ssjg__jglb',
#         ('czsj', DateRangeFilter),
#     ]
