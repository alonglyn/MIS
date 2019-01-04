import xadmin
from import_export import resources
# Register your models here.
from .models import *

import xadmin
from xadmin import views
'''
基本主题设置
'''


class BaseSetting:
    enable_themes = True
    use_bootswatch = True


xadmin.site.register(views.BaseAdminView, BaseSetting)

'''
站点全局设置
'''


class GlobalSettings(object):
    site_title = "蔬菜产销存管理系统"
    site_footer = "霜雪"
    menu_style = "accordion"


xadmin.site.register(views.CommAdminView, GlobalSettings)

'''
其他设置
'''


class ZhongZhiDanWeiResource(resources.ModelResource):
    class Meta:
        model = ZhongZhiDanWei


class JiLiangDanWeiResource(resources.ModelResource):
    class Meta:
        model = JiLiangDanWei


class BaoZhuangWuResource(resources.ModelResource):
    class Meta:
        model = BaoZhuangWu


@xadmin.sites.register(ZhongZhiDanWei)
class ZhongZhiDanWeiAdmin:
    import_export_args = {'import_resource_class': ZhongZhiDanWeiResource,
                          'export_resource_class': ZhongZhiDanWeiResource}
    exclude = []
    search_fields = ['mc']


@xadmin.sites.register(JiLiangDanWei)
class JiLiangDanWeiAdmin:
    import_export_args = {'import_resource_class': JiLiangDanWeiResource,
                          'export_resource_class': JiLiangDanWeiResource}
    exclude = []
    search_fields = ['mc']


@xadmin.sites.register(BaoZhuangWu)
class BaoZhuangWuAdmin:
    import_export_args = {'import_resource_class': BaoZhuangWuResource, 'export_resource_class': BaoZhuangWuResource}
    exclude = []
    search_fields = ['mc']


