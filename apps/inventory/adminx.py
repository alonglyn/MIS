import xadmin
from import_export import resources
from daterange_filter.filter import DateRangeFilter
from .models import *
from django.db.models import Q


class WuZiKuCunResource(resources.ModelResource):
    class Meta:
        model = WuZiKuCun


class WuZiRuKuResource(resources.ModelResource):
    class Meta:
        model = WuZiRuKu


class WuZiChuKuResource(resources.ModelResource):
    class Meta:
        model = WuZiChuKu


class WuZiFaFangResource(resources.ModelResource):
    class Meta:
        model = WuZiFaFang


@xadmin.sites.register(WuZiKuCun)
class WuZiKuCunAdmin:
    import_export_args = {'import_resource_class': WuZiKuCunResource,
                          'export_resource_class': WuZiKuCunResource}

    def count(self, obj):
        return obj.count()

    def queryset(self):
        qs = super().queryset()
        user = self.request.user
        if user.is_superuser:
            return qs
        else:
            qs = qs.filter(Q(ssjg=user.employee.ssjg) | Q(ssjg__ssjg=user.employee.ssjg))
            return qs

    exclude = []
    list_display = ['wzkcbh', 'ssjg', 'wzmc', 'count']
    readonly_fields = ['wzkcbh', 'wzmc', ]
    raw_id_fields = ['ssjg', 'wzbh', ]

    # data_charts = {
    #     "month_sl": {
    #         'title': "总库存量",
    #         "x-field": "_name", "y-field": ('count',),
    #         "option": {
    #             "series": {"bars": {"align": "center", "barWidth": 0.6, 'show': True}},
    #             # "xaxis": {"aggregate": "sum", "mode": "categories"},
    #         },
    #     },
    # }

    # 获得库存量
    def count(self, obj):
        return obj.count()

    def _name(self, obj):
        return obj.wzkcbh

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


@xadmin.sites.register(WuZiRuKu)
class WuZiRuKuAdmin:
    import_export_args = {'import_resource_class': WuZiRuKuResource,
                          'export_resource_class': WuZiRuKuResource}

    def save_models(self):
        obj = self.new_obj
        if not obj.czz:
            obj.czz = User.objects.get(username=self.request.user).employee
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
            qs = qs.filter(Q(wzkc__ssjg=user.employee.ssjg) | Q(wzkc__ssjg__ssjg=user.employee.ssjg))
            return qs

    readonly_fields = ['rkdh', ]

    exclude = []
    list_display = ['rkdh', 'wzkc', 'cj', 'sl', 'je', 'czz', 'czsj']
    raw_id_fields = ['wzkc', ]

    list_filter = [
        'wzkc__wzmc',
        'wzkc__ssjg__jglb',
        'czsj',
    ]
    search_fields = [
        'wzkc__wzmc',
        'wzkc__ssjg__jgmc',
    ]
    aggregate_fields = {"je": "sum", 'sl': 'sum'}

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


@xadmin.sites.register(WuZiChuKu)
class WuZiChuKuAdmin:
    import_export_args = {'import_resource_class': WuZiChuKuResource,
                          'export_resource_class': WuZiChuKuResource}

    def save_models(self):
        obj = self.new_obj
        if not obj.czz:
            obj.czz = User.objects.get(username=self.request.user).employee
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
            qs = qs.filter(Q(wzkc__ssjg=user.employee.ssjg) | Q(wzkc__ssjg__ssjg=user.employee.ssjg))
            return qs

    exclude = []
    readonly_fields = ['ckdh', ]
    list_display = ['ckdh', 'wzkc', 'cj', 'sl', 'je', 'czz', 'czsj']
    raw_id_fields = ['wzkc', ]
    list_filter = [
        'wzkc__wzmc',
        'wzkc__ssjg__jglb',
        'czsj',
    ]
    search_fields = [
        'wzkc__wzmc',
        'wzkc__ssjg__jgmc',
    ]
    aggregate_fields = {"je": "sum", 'sl': 'sum'}

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


@xadmin.sites.register(WuZiFaFang)
class WuZiFaFangAdmin:
    import_export_args = {'import_resource_class': WuZiFaFangResource,
                          'export_resource_class': WuZiFaFangResource}

    def save_models(self):
        obj = self.new_obj
        if not obj.czz:
            obj.czz = User.objects.get(username=self.request.user).employee
        obj.save()

    def queryset(self):
        qs = super().queryset()
        user = self.request.user
        if user.is_superuser:
            return qs
        else:
            qs = qs.filter(Q(wzkc__ssjg=user.employee.ssjg) | Q(wzkc__ssjg__ssjg=user.employee.ssjg))
            return qs

    readonly_fields = ['ffbh', 'je', 'cj', ]
    list_display = ['wzkc', 'cj', 'sl', 'je', 'czz', 'czsj']
    raw_id_fields = ['wzkc', 'czz']
    list_filter = [
        'wzkc__wzmc',
        'wzkc__ssjg__jglb',
        'czsj',
    ]
    search_fields = [
        'wzkc__wzmc',
        'wzkc__ssjg__jgmc',
    ]
    aggregate_fields = {"je": "sum", 'sl': 'sum'}

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


@xadmin.sites.register(WuZiPanCun)
class WuZiPanCunAdmin:

    def save_models(self):
        obj = self.new_obj
        if not obj.czz:
            obj.czz = User.objects.get(username=self.request.user).employee
        obj.save()

    def queryset(self):
        qs = super().queryset()
        user = self.request.user
        if user.is_superuser:
            return qs
        else:
            qs = qs.filter(Q(wzkc__ssjg=user.employee.ssjg) | Q(wzkc__ssjg__ssjg=user.employee.ssjg))
            return qs

    exclude = []
    list_display = ['wzkc', 'sl', 'czz']
    raw_id_fields = ['wzkc', ]
    list_filter = [
        'wzkc__wzmc',
        'wzkc__ssjg__jglb',
        'czsj',
    ]
