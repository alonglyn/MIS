import xadmin
from import_export import resources
from django.db.models import Q
from company.models import Employee
from xadmin import views
from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction
# Register your models here.
from .models import *
import django.utils.timezone as timezone


class ChanPinKuCunResource(resources.ModelResource):
    class Meta:
        model = ChanPinKuCun


class ChanPinRuKuResource(resources.ModelResource):
    class Meta:
        model = ChanPinRuKu


class ChanPinChuKuResource(resources.ModelResource):
    class Meta:
        model = ChanPinChuKu


class ChanPinXiaoShouResource(resources.ModelResource):
    class Meta:
        model = ChanPinXiaoShou


@xadmin.sites.register(ChanPinKuCun)
class ChanPinKuCunAdmin:
    import_export_args = {'import_resource_class': ChanPinKuCunResource,
                          'export_resource_class': ChanPinKuCunResource}

    def count(self, obj):
        return obj.count()

    def _name(self, obj):
        return obj.cpkcbh

    def queryset(self):
        qs = super().queryset()
        user = self.request.user
        if user.is_superuser:
            return qs
        else:
            qs = qs.filter(Q(ssjg=user.employee.ssjg) | Q(ssjg__ssjg=user.employee.ssjg))
            return qs

    count.short_description = '库存量'  # 显示为库存量
    count.allow_tags = True
    count.is_column = True

    list_display = ['cpkcbh', 'ssjg', 'cpmc', 'count']

    readonly_fields = ['cpkcbh', ]
    raw_id_fields = ['ssjg', 'cpbh', ]
    search_fields = [
        'cpkcbh',

    ]
    list_filter = (
        'ssjg',
        'cpmc',
    )
    # data_charts = {
    #     "month_sl": {
    #         'title': "总库存量",
    #         "x-field": "_name", "y-field": ('count',),
    #         # "option": {
    #         #     "series": {"lines": {"show": True}, "points": {"show": True}},"grid": {"hoverable": True, "clickable": True},
    #         #     # "xaxis": {"aggregate": "sum", "mode": "categories"},
    #         # },
    #     },
    # }

    # 获得库存量


@xadmin.sites.register(ChanPinRuKu)
class ChanPinRuKuAdmin:
    import_export_args = {'import_resource_class': ChanPinRuKuResource,
                          'export_resource_class': ChanPinRuKuResource}

    def save_models(self):
        obj = self.new_obj
        if not obj.jsr:
            obj.jsr = User.objects.get(username=self.request.user).employee
        obj.save()

    def queryset(self):
        qs = super().queryset()
        user = self.request.user
        if user.is_superuser:
            return qs
        else:
            qs = qs.filter(Q(cpkc__ssjg=user.employee.ssjg) | Q(cpkc__ssjg__ssjg=user.employee.ssjg))
            return qs

    def count(self, obj):
        return obj.cpkc.count()

    count.short_description = '剩余库存量'  # 显示为库存量
    count.allow_tags = True
    count.is_column = True

    readonly_fields = ['je', 'pm', 'rkdh']
    list_display = ['rkdh', 'cpkc', 'dj', 'sl', 'je', 'jyr', 'jsr', 'czsj', 'count']
    aggregate_fields = {"je": "sum", 'sl': 'sum'}
    raw_id_fields = ['cpkc', ]
    list_filter = [
        'cpkc__cpmc',
        'cpkc__ssjg__jglb',
        'cpkc__ssjg__jgmc',
        'date',
    ]
    search_fields = [
        'cpkc__cpmc',
        'cpkc__ssjg__jgmc',
    ]

    data_charts = {
        "day_sl": {
            'title': "日汇总入库量",
            "x-field": "_chart_day", "y-field": ('sl',),
            'order': ('date',),
            "option": {
                "series": {"lines": {"show": True}, "points": {"show": True}},
                "grid": {"hoverable": True, "clickable": True},
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
        "month_sl": {
            'title': "月汇总入库量",
            "x-field": "_chart_month", "y-field": ('sl',),
            'order': ('date',),
            "option": {
                "series": {"bars": {"align": "center", "barWidth": 0.8, 'show': True}},
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
    }

    def _chart_day(self, obj):
        return obj.date.strftime('%F')

    def _chart_month(self, obj):
        return obj.date.strftime('%B')

    def _chart_year(self, obj):
        return obj.date.strftime('%G')


@xadmin.sites.register(ChanPinChuKu)
class ChanPinChuKuAdmin:
    import_export_args = {'import_resource_class': ChanPinChuKuResource,
                          'export_resource_class': ChanPinChuKuResource}

    def save_models(self):
        obj = self.new_obj
        if not obj.jsr:
            obj.jsr = User.objects.get(username=self.request.user).employee
        obj.save()

    def count(self, obj):
        return obj.cpkc.count()

    count.short_description = '剩余库存量'  # 显示为库存量
    count.allow_tags = True
    count.is_column = True

    def queryset(self):
        qs = super().queryset()
        user = self.request.user
        if user.is_superuser:
            return qs
        else:
            qs = qs.filter(Q(cpkc__ssjg=user.employee.ssjg) | Q(cpkc__ssjg__ssjg=user.employee.ssjg))
            return qs

    readonly_fields = ['je', 'pm', 'ckdh']
    list_display = ['ckdh', 'cpkc', 'dj', 'sl', 'je', 'jyr', 'jsr', 'czsj', 'count']
    raw_id_fields = ['cpkc', ]
    list_filter = [
        'cpkc__cpmc',
        'cpkc__ssjg__jglb',
        'date',
    ]
    search_fields = [
        'cpkc__cpmc',
        'cpkc__ssjg__jgmc',
    ]
    aggregate_fields = {"je": "sum", 'sl': 'sum'}

    data_charts = {
        "day_sl": {
            'title': "日汇总出库量",
            "x-field": "_chart_day", "y-field": ('sl',),
            'order': ('date',),
            "option": {
                "series": {"lines": {"show": True}, "points": {"show": True}},
                "grid": {"hoverable": True, "clickable": True},
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
        "month_sl": {
            'title': "月汇总出库量",
            "x-field": "_chart_month", "y-field": ('sl',),
            'order': ('date',),
            "option": {
                "series": {"bars": {"align": "center", "barWidth": 0.8, 'show': True}},
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
    }

    def _chart_day(self, obj):
        return obj.date.strftime('%F')

    def _chart_month(self, obj):
        return obj.date.strftime('%B')

    def _chart_year(self, obj):
        return obj.date.strftime('%G')


@xadmin.sites.register(ChanPinXiaoShou)
class ChanPinXiaoShouAdmin:
    import_export_args = {'import_resource_class': ChanPinXiaoShouResource,
                          'export_resource_class': ChanPinXiaoShouResource}

    def save_models(self):
        obj = self.new_obj
        if not obj.jsr:
            obj.jsr = User.objects.get(username=self.request.user).employee
        obj.save()

    def queryset(self):
        qs = super().queryset()
        user = self.request.user
        if user.is_superuser:
            return qs
        else:
            qs = qs.filter(Q(cpkc__ssjg=user.employee.ssjg) | Q(cpkc__ssjg__ssjg=user.employee.ssjg))
            return qs

    readonly_fields = ['xsdh', 'je', ]
    list_display = ['xsdh', 'cpkc', 'gk', 'dj', 'sl', 'je', 'jsr', 'xssj']
    # raw_id_fields = ['cpkc', 'jsr']
    list_filter = [
        'gk__gkmc',
        'cpkc__cpmc',
        # 'cpkc__ssjg__jglb',
        'cpkc__ssjg__jgmc',
        'date',
    ]
    search_fields = [
        'gk__gkmc',
    ]
    aggregate_fields = {"je": "sum", 'sl': 'sum'}
    data_charts = {
        "day_sl": {
            'title': "日汇总销售量",
            "x-field": "_chart_day", "y-field": ('sl',),
            'order': ('date',),
            "option": {
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
        "month_sl": {
            'title': "月汇总销售量",
            "x-field": "_chart_month", "y-field": ('sl',),
            'order': ('date',),
            "option": {
                "series": {"bars": {"align": "center", "barWidth": 0.8, 'show': True}},
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
        "year_sl": {
            'title': "年汇总销售量",
            "x-field": "_chart_year", "y-field": ('sl',),
            'order': ('date',),
            "option": {
                "series": {"bars": {"align": "center", "barWidth": 0.8, 'show': True}},
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
        "day_je": {
            'title': "日汇总销售额",
            "x-field": "_chart_day", "y-field": ('je',),
            'order': ('date',),
            "option": {
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
        "month_je": {
            'title': "月汇总销售额",
            "x-field": "_chart_month", "y-field": ('je',),
            'order': ('date',),
            "option": {
                "series": {"bars": {"align": "center", "barWidth": 0.8, 'show': True}},
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
        "year_je": {
            'title': "年汇总销售额",
            "x-field": "_chart_year", "y-field": ('je',),
            'order': ('date',),
            "option": {
                "series": {"bars": {"align": "center", "barWidth": 0.8, 'show': True}},
                "xaxis": {"aggregate": "sum", "mode": "categories"},
            },
        },
    }

    def _chart_day(self, obj):
        return obj.date.strftime('%F')

    def _chart_month(self, obj):
        return obj.date.strftime('%B')

    def _chart_year(self, obj):
        return obj.date.strftime('%G')
    # relfield_style = "fk-ajax"


@xadmin.sites.register(ChanPinPanCun)
class ChanPinPanCunAdmin:

    def save_models(self):
        obj = self.new_obj
        if not obj.jsr:
            obj.jsr = User.objects.get(username=self.request.user).employee
        obj.save()

    def queryset(self):
        qs = super().queryset()
        user = self.request.user
        if user.is_superuser:
            return qs
        else:
            qs = qs.filter(Q(cpkc__ssjg=user.employee.ssjg) | Q(cpkc__ssjg__ssjg=user.employee.ssjg))
            return qs

    readonly_fields = ['id', ]
    list_display = ['cpkc', 'sl', 'jsr', 'pcsj']
    raw_id_fields = ['cpkc', 'jsr']
    list_filter = [
        'cpkc__cpmc',
        # 'cpkc__cpmc__pzmc',
        'cpkc__ssjg__jglb',
        'cpkc__ssjg__jgmc',
        'date',
    ]
    search_fields = [
        'cpkc__cpmc',
        'cpkc__ssjg__jgmc',
    ]
