import xadmin
# Register your models here.
from .models import *
from import_export import resources

'''
import-export
'''


class ShuCaiShengChanResource(resources.ModelResource):
    class Meta:
        model = ShuCaiShengChan


class NongHuShengChanResource(resources.ModelResource):
    class Meta:
        model = NongHuShengChan


class DaiGouDianShengChanResource(resources.ModelResource):
    class Meta:
        model = DaiGouDianShengChan


class ShengChanJiDiShengChanResource(resources.ModelResource):
    class Meta:
        model = ShengChanJiDiShengChan


class GongSiShengChanResource(resources.ModelResource):
    class Meta:
        model = GongSiShengChan


'''
inline
'''


class NongHuShengChanInline:
    model = NongHuShengChan
    extra = 0
    can_delete = True
    # verbose_name = ''


class DaiGouDianShengChanInline:
    model = DaiGouDianShengChan
    extra = 0
    can_delete = True
    # verbose_name = ''


class ShengChanJiDiShengChanInline:
    model = ShengChanJiDiShengChan
    extra = 0
    can_delete = True
    # verbose_name = ''


'''
admin
'''


@xadmin.sites.register(ShuCaiShengChan)
class ShuCaiShengChanAdmin:
    import_export_args = {'import_resource_class': ShuCaiShengChanResource,
                          'export_resource_class': ShuCaiShengChanResource}
    list_display = ['scbh', 'zzmj', 'bzq', 'dw', ]
    exclude = []
    search_files = ['scbh', ]
    list_filter = ['scbh', 'bzq']
    raw_id_fields = ['scbh', ]


@xadmin.sites.register(NongHuShengChan)
class NongHuShengChanAdmin:
    import_export_args = {'import_resource_class': NongHuShengChanResource,
                          'export_resource_class': NongHuShengChanResource}

    # def save_models(self):
    #     obj = self.new_obj
    #     obj.zdr = self.request.user.employee
    #     obj.save()

    exclude = []
    style_fields = {'scscjh': 'm2m_transfer'}
    raw_id_fields = ['nh', 'parent', ]
    search_files = ['nh']
    list_filter = ['zdsj', 'status']
    list_display = ['nh', 'parent', 'zdsj', 'zdr', 'status']


@xadmin.sites.register(DaiGouDianShengChan)
class DaiGouDianShengChanAdmin:
    import_export_args = {'import_resource_class': DaiGouDianShengChanResource,
                          'export_resource_class': DaiGouDianShengChanResource}

    # def save_models(self):
    #     obj = self.new_obj
    #     obj.zdr = self.request.user.employee
    #     obj.save()
    style_fields = {'scscjh': 'm2m_transfer'}
    list_display = ['dgd', 'parent', 'zdsj', 'zdr', 'status']
    exclude = []
    raw_id_fields = ['dgd', 'parent']
    search_files = ['dgd', ]
    list_filter = ['zdsj', 'status']
    inlines = [NongHuShengChanInline, ]


@xadmin.sites.register(ShengChanJiDiShengChan)
class ShengChanJiDiShengChanAdmin:
    import_export_args = {'import_resource_class': ShengChanJiDiShengChanResource,
                          'export_resource_class': ShengChanJiDiShengChanResource}

    # def save_models(self):
    #     obj = self.new_obj
    #     obj.zdr = self.request.user.employee
    #     obj.save()

    list_display = ['scjd', 'parent', 'zdsj', 'zdr', 'status']
    exclude = []
    raw_id_fields = ['scjd', 'parent']
    search_files = ['scjd', ]
    list_filter = ['zdsj', 'status']
    # filter_horizontal = ['scscjh']
    style_fields = {'scscjh': 'm2m_transfer'}
    inlines = [DaiGouDianShengChanInline, ]


@xadmin.sites.register(GongSiShengChan)
class GongSiShengChanAdmin:

    import_export_args = {'import_resource_class': GongSiShengChanResource,
                          'export_resource_class': GongSiShengChanResource}

    # def save_models(self):
    #     obj = self.new_obj
    #     obj.zdr = self.request.user.employee
    #     obj.save()
    style_fields = {'scscjh': 'm2m_transfer'}
    list_display = ['scjhbh', 'zdsj', 'zdr', 'status']
    exclude = []
    list_filter = ['zdsj', 'status']

    inlines = [ShengChanJiDiShengChanInline, ]
