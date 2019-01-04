import xadmin
from import_export import resources
from xadmin.plugins.auth import UserAdmin

# Register your models here.
from .models import *


class PingZhongXinXiResource(resources.ModelResource):
    class Meta:
        model = PingZhongXinXi


class ChanPinXinXiResource(resources.ModelResource):
    class Meta:
        model = ChanPinXinXi


class WuZiXinXiResource(resources.ModelResource):
    class Meta:
        model = WuZiXinXi


class NongHuXinXiResource(resources.ModelResource):
    class Meta:
        model = NongHuXinXi


class GuKeXinXiResource(resources.ModelResource):
    class Meta:
        model = GuKeXinXi


class JiGouResource(resources.ModelResource):
    class Meta:
        model = JiGou


@xadmin.sites.register(PingZhongXinXi)
class PingZhongXinXiAdmin:
    import_export_args = {'import_resource_class': PingZhongXinXiResource,
                          'export_resource_class': PingZhongXinXiResource}
    exclude = []
    list_display = ['pzbm', 'pzmc']
    readonly_fields = ['pzbm', ]
    search_fields = ['pzmc']


@xadmin.sites.register(ChanPinXinXi)
class ChanPinXinXiAdmin:
    import_export_args = {'import_resource_class': ChanPinXinXiResource,
                          'export_resource_class': ChanPinXinXiResource}

    exclude = []
    list_display = ['cpbh', 'cpmc', 'cpdj', 'cd', 'jj', 'cj', 'bzw']
    list_filter = ['cpdj', 'cd', ]
    raw_id_fields = ['pzbm', ]
    readonly_fields = ['cpbh', ]
    search_fields = ['cpmc', 'cpbh']


@xadmin.sites.register(WuZiXinXi)
class WuZiXinXiAdmin:
    import_export_args = {'import_resource_class': WuZiXinXiResource,
                          'export_resource_class': WuZiXinXiResource}
    exclude = []
    list_display = ['wzbh', 'wzmc', 'jldw', 'jj', 'cj', ]
    readonly_fields = ['id', 'wzbh']
    search_fields = ['wzmc']
    raw_id_fields = ['jldw']


@xadmin.sites.register(NongHuXinXi)
class NongHuXinXiAdmin:
    import_export_args = {'import_resource_class': NongHuXinXiResource,
                          'export_resource_class': NongHuXinXiResource}
    list_display = ['nhbh', 'nhmc', 'nhzz', 'dgd', 'lxdh', ]
    readonly_fields = ['nhbh']
    exclude = []
    search_fields = ['cpmc']


@xadmin.sites.register(GuKeXinXi)
class GuKeXinXiAdmin:
    import_export_args = {'import_resource_class': GuKeXinXiResource,
                          'export_resource_class': GuKeXinXiResource}
    list_display = ['gkbh', 'gkmc', 'gkzz', 'lxdh', ]
    readonly_fields = ['gkbh']
    exclude = []
    search_fields = ['gkmc']


@xadmin.sites.register(JiGou)
class JiGouAdmin:
    import_export_args = {'import_resource_class': JiGouResource,
                          'export_resource_class': JiGouResource}

    exclude = []
    list_display = ['jgbh', 'jgmc', 'jglb', 'fzr', 'lxdh']
    list_filter = ['jglb', 'fzr', ]
    readonly_fields = ['jgbh', 'jgmc', 'level']
    search_fields = ['cpmc']


class EmployeeInline:
    model = Employee
    extra = 1
    can_delete = False
    verbose_name_plural = 'employee'


# Define a new User admin
class UserNewAdmin(UserAdmin):
    inlines = (EmployeeInline,)


# Re-register UserAdmin
xadmin.site.unregister(User)
xadmin.site.register(User, UserNewAdmin)
