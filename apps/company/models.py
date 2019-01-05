from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.auth.models import User
from basic.models import *
import django.utils.timezone as timezone

# Create your models here.

'''
1、产品信息表（产品编号，产品名称，产品等级，产地，进价，包装物）

2、物资信息表（物资编号、物资名称、计量单位、进价、出价）

# 3、农户信息表（农户编号、农户名称、农户住址、联系电话、播种面积） 

# 4、顾客信息表（顾客编号、购买日期、顾客名称、顾客住址、联系电话、购买金额、购买品种、备注）

# 5、机构信息（机构编号、机构名称、机构类别、负责人、联系电话）

# 6、系统设置

# 5、销售信息表（销售编号、销售日期、销售品种、销售金额、销售地址、销售人编号、备注）

# 6、生产计划信息表（生产计划编号、农户、生产品种、生产面积、播种期、备注）

# 7、产品入库信息表（入库单号、产品编号、产品名称、单价、数量、金额、检验人、经手人、入库时间、片名、农户）

# 8、产品出库信息表（出库单号、产品编号、产品名称、进价、数量、金额、经手人、出库时间、片名、农户、收货方）

# 9、公司机构设置表（

'''


# 用于删除操作员后的接锅侠
def get_sentinel_user(username='default'):
    return get_user_model().objects.get_or_create(username=username)[0]


'''
基本模型
'''

'''
公司模型
'''


class WuZiXinXi(models.Model):
    class Meta:
        verbose_name = "物资信息"
        verbose_name_plural = "物资信息"

    wzbh = models.CharField('物资编号', unique=True, max_length=50)
    wzmc = models.CharField('物资名称', unique=True, max_length=50)
    jldw = models.CharField(
        '计量单位',
        max_length=5,
        choices=JiLiangDanWei.objects.all().values_list('mc', 'mc')
    )  #  dymanic select
    jj = models.DecimalField('进价', max_digits=10, decimal_places=2)
    cj = models.DecimalField('出价', max_digits=10, decimal_places=2)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        self.wzbh = 'WZ%03d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return self.wzmc


class PingZhongXinXi(models.Model):
    class Meta:
        verbose_name = '品种信息'
        verbose_name_plural = '品种信息'

    pzbm = models.CharField('品种编码', max_length=20, unique=True)
    pzmc = models.CharField('品种名称', max_length=20)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        self.pzbm = 'PZ%04d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return self.pzmc


class ChanPinXinXi(models.Model):
    class Meta:
        verbose_name = "产品信息"
        verbose_name_plural = "产品信息"
        unique_together = ('cpmc', 'cd')

    cpbh = models.CharField('产品编号', editable=False, null=True, blank=True, max_length=50)
    cpmc = models.CharField('产品名称', max_length=50)
    cpdj = models.CharField('产品等级', max_length=50)
    cd = models.CharField('产地', max_length=50)
    jj = models.DecimalField('进价', default=0, max_digits=10, decimal_places=2)
    cj = models.DecimalField('出价', default=0, max_digits=10, decimal_places=2)
    bzw = models.CharField(
        '包装物',
        max_length=5,
        blank=True,
        null=True,
        choices=BaoZhuangWu.objects.values_list('mc', 'mc'),
    )
    pzbm = models.ForeignKey(
        PingZhongXinXi,
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        verbose_name='品种编码',
    )
    jgbh = models.ForeignKey(
        'JiGou',
        on_delete=models.CASCADE,
        blank=True,
        null=True,
        limit_choices_to={'jglb': 'JD'},
        verbose_name='基地编号',
    )

    def save(self, *args, **kwargs):
        if self.jgbh is not None and self.pzbm is not None and self.jgbh.jgbh != '' and self.pzbm.pzbm != '' and self.cpdj != '':
            self.cpbh = self.jgbh.jgbh + self.pzbm.pzbm + self.cpdj
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s的%s' % (self.cd, self.cpmc)


class NongHuXinXi(models.Model):
    class Meta:
        verbose_name = '农户信息'
        verbose_name_plural = '农户信息'

    nhbh = models.CharField(unique=True, max_length=100, verbose_name='农户编号')
    nhmc = models.CharField(unique=True, max_length=100, verbose_name='农户名称')
    nhzz = models.CharField(max_length=100, verbose_name='农户住址')
    dgd = models.ForeignKey(
        'JiGou',
        on_delete=models.CASCADE,
        verbose_name='所属代购点',
        limit_choices_to={'jglb': 'DG'},
    )
    lxdh = models.CharField('联系电话', max_length=12)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if not self.nhbh:
            self.nhbh = 'NH%05d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return self.nhmc


class GuKeXinXi(models.Model):
    class Meta:
        verbose_name = '顾客信息'
        verbose_name_plural = '顾客信息'

    gkbh = models.CharField('顾客编号', unique=True, max_length=20)
    gkmc = models.CharField('顾客名称', unique=True, max_length=20)
    gkzz = models.CharField('顾客住址', max_length=20)
    lxdh = models.CharField('联系电话', max_length=12)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        self.gkbh = 'GK%05d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return self.gkmc


class Employee(models.Model):
    class Meta:
        verbose_name = '员工账户'
        verbose_name_plural = '员工账户'

    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,  # 删除绑定员工
        related_name='employee',
        verbose_name='管理员账户',
    )
    ssjg = models.ForeignKey(
        'JiGou',
        on_delete=models.CASCADE,
        verbose_name='所属机构',
    )
    name = models.CharField('中文姓名', max_length=10, unique=True)
    lxdh = models.CharField('联系电话', max_length=12)

    def save(self, *args, **kwargs):
        if not self.name and self.user.first_name and self.user.last_name:
            self.name = self.user.first_name + '' + self.user.last_name
        super().save(*args, **kwargs)

    def __str__(self):
        return self.user.username


class JiGou(models.Model):
    class Meta:
        verbose_name = "公司机构"
        verbose_name_plural = "公司机构"

    JGLB_CHOICE = (
        ('GS', '公司'),
        ('JD', '生产基地'),
        ('PF', '批发中心'),
        ('DG', '代购点'),
    )
    # 由jglb+jbbh生成
    jgbh = models.CharField('机构编号', unique=True, editable=False, max_length=50)  # 机构类别+机构序号
    jgmc = models.CharField('机构名称', unique=True, editable=False, max_length=50)  # 机构类别+机构序号
    jglb = models.CharField('机构类别', max_length=50, choices=JGLB_CHOICE)
    ssjg = models.ForeignKey(
        'self',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='child_jg',
        verbose_name='所属机构',
    )
    # TODO 添加自定义的valid实现父机构的选择控制
    fzr = models.ForeignKey(
        'company.Employee', to_field='name',
        blank=True,
        null=True,
        on_delete=models.SET(get_sentinel_user),
        verbose_name='负责人',
    )
    lxdh = models.CharField('联系电话', max_length=12)
    level = models.PositiveSmallIntegerField('等级', blank=True, null=True)

    def get_level(self):
        level_dict = {
            'GS': 0,
            'JD': 1,
            'PF': 2,
            'DG': 3,
        }
        return level_dict[self.jglb]

    def save(self, *args, **kwargs):
        # # TODO 重写函数不能实现存在数据的报错。 所以要实现自定义表单来验证， 来实现控制。
        super().save(*args, **kwargs)
        tid = '%02d' % self.id
        self.jgmc = self.get_jglb_display() + tid
        self.jgbh = self.jglb + tid
        self.level = self.get_level()
        super().save(*args, **kwargs)

    def __str__(self):
        return self.jgmc
