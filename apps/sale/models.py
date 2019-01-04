from django.db import models
from django.contrib.auth.models import User
from company.models import get_sentinel_user
from functools import reduce
import django.utils.timezone as timezone

# Create your models here.

# TODO 入库量超过库存控制， 在销售和填写出库单的时候验证表单的时候查询库存
'''
销售模块，
结合生产模块。
涉及模型， 代购点， 农户， 批发中心， 顾客表。 涉及表， 生产计划表。销售表

'''

from django.db import models


# Create your models here.

# company GuKeXinXi
# company ChanPinXinxi


class ChanPinKuCun(models.Model):
    class Meta:
        verbose_name = "产品库存"
        verbose_name_plural = "产品库存"

    cpkcbh = models.CharField("产品库存编号", editable=False, max_length=50)
    ssjg = models.ForeignKey(
        'company.JiGou',
        on_delete=models.CASCADE,
        # TODO 添加limit限制
        verbose_name='所属机构',
    )
    cpbh = models.ForeignKey(
        'company.ChanPinXinXi',
        on_delete=models.CASCADE,
        verbose_name='产品编号',
    )
    cpmc = models.CharField('产品名称', editable=False, default='', max_length=50)

    # 查询库存数量， 也可以使用库存数量字段， 但是要设置触发器， 在更新的时候更新库存数量， 不过这样比较麻烦
    def count(self):
        ret = 0
        l = [int(i.sl) for i in self.chanpinruku_set.all()]
        if len(l) != 0:
            ret += reduce(lambda x, y: x + y, l)
        l = [int(i.sl) for i in self.chanpinchuku_set.all()]
        if len(l) != 0:
            ret -= reduce(lambda x, y: x + y, l)
        l = [int(i.sl) for i in self.chanpinxiaoshou_set.all()]
        if len(l) != 0:
            ret -= reduce(lambda x, y: x + y, l)
        l = [int(i.sl) for i in self.chanpinpancun_set.all()]
        if len(l) != 0:
            ret += reduce(lambda x, y: x + y, l)

        return ret

    def save(self, *args, **kwargs):
        self.cpmc = self.cpbh.cpmc
        self.cpkcbh = self.ssjg.jgbh + self.cpbh.cpbh
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s 的 %s' % (self.ssjg.jgmc, self.cpmc)


'''
自动填充字段
金额， 经手人， 片名（cpkc.ssjg)

'''


class ChanPinRuKu(models.Model):
    class Meta:
        verbose_name = "产品入库"
        verbose_name_plural = "产品入库"

    rkdh = models.CharField('入库单号', unique=True, max_length=50, )
    cpkc = models.ForeignKey(
        ChanPinKuCun,
        on_delete=models.CASCADE,
        verbose_name='产品库存表'
    )
    dj = models.DecimalField('单价', default=0, null=True, blank=True, max_digits=10, decimal_places=2)
    sl = models.IntegerField('数量', default=0)
    je = models.DecimalField('金额', max_digits=20, decimal_places=2, editable=False, null=True, blank=True, )
    jyr = models.ForeignKey(
        'company.Employee', to_field='name',

        on_delete=models.CASCADE,
        null=True,
        blank=True,
        related_name='rk_jyr',
        verbose_name='检验人',
    )
    jsr = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        editable=False,
        null=True,
        blank=True,
        related_name='rk_jsr',
        verbose_name='经手人',
        help_text='默认为填表人',
    )
    czsj = models.DateTimeField('操作时间', default=timezone.now)#auto_now_add=True
    pm = models.CharField('片名', max_length=30, editable=False, null=True, blank=True)
    ckdh = models.OneToOneField(
        'ChanPinChuKu',
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        verbose_name='对应出库单号',
    )
    date = models.DateField('日期', editable=False, blank=True, null=True)#auto_now_add=True

    nh = models.ForeignKey(
        'company.NongHuXinXi',
        blank=True,
        null=True,
        to_field='id',
        on_delete=models.CASCADE,
        verbose_name='负责农户',
    )

    def month(self):
        return self.date.month

    # TODO 这里使用两个save会带来autofield一次增加两个。
    def save(self, *args, **kwargs):
        self.date = self.czsj.date()
        if not self.dj:
            self.dj = self.cpkc.cpbh.jj
        if not self.nh and self.ckdh:
            self.nh = self.ckdh.nh
        self.je = self.dj * self.sl
        self.pm = self.cpkc.ssjg.jgmc
        super().save(*args, **kwargs)
        self.rkdh = '%07d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s出库%s %s' % (self.cpkc.ssjg, self.cpkc.cpmc, self.sl)


class ChanPinChuKu(models.Model):
    class Meta:
        verbose_name = "产品出库"
        verbose_name_plural = "产品出库"

    ckdh = models.CharField('出库单号', unique=True, max_length=50, )
    cpkc = models.ForeignKey(
        ChanPinKuCun,
        on_delete=models.CASCADE,
        verbose_name='产品库存表'
    )
    dj = models.DecimalField('单价', default=0, null=True, blank=True, max_digits=10, decimal_places=2)
    sl = models.IntegerField('数量', default=0)
    je = models.DecimalField('金额', max_digits=20, decimal_places=2, editable=False, null=True, blank=True, )
    jyr = models.ForeignKey(
        'company.Employee', to_field='name',

        on_delete=models.CASCADE,
        blank=True,
        null=True,
        related_name='ck_jyr',
        verbose_name='检验人',
    )
    jsr = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        editable=False,
        null=True,
        blank=True,
        related_name='ck_jsr',
        verbose_name='经手人',
        help_text='默认为填表人',
    )
    rkdh = models.OneToOneField(
        'ChanPinRuKu',
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        verbose_name='对应入库单号',
    )
    czsj = models.DateTimeField('操作时间', default=timezone.now)#auto_now_add=True
    pm = models.CharField('片名', max_length=10, editable=False, null=True, blank=True)
    nh = models.ForeignKey(
        'company.NongHuXinXi',
        to_field='id',
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        verbose_name='负责农户',
    )
    date = models.DateField('日期', editable=False, blank=True, null=True)#auto_now_add=True

    # is_sg = models.BooleanField('是否从农户收购')
    def month(self):
        return self.date.month

    def save(self, *args, **kwargs):
        self.date = self.czsj.date()
        self.je = self.dj * self.sl
        self.pm = self.cpkc.ssjg.jgmc
        if self.nh is None or self.nh == '':
            self.nh = self.rkdh.nh
        super().save(*args, **kwargs)
        self.ckdh = '%07d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s出库%s %s' % (self.cpkc.ssjg, self.cpkc.cpmc, self.sl)


class ChanPinXiaoShou(models.Model):
    class Meta:
        verbose_name_plural = '产品销售'
        verbose_name = '产品销售'

    xsdh = models.CharField('销售单号', unique=True, max_length=10)
    cpkc = models.ForeignKey(
        'ChanPinKuCun',
        on_delete=models.CASCADE,
        verbose_name='产品库存',
    )
    dj = models.DecimalField('单价', default=0, max_digits=10, blank=True, decimal_places=2)
    sl = models.IntegerField('数量', default=0)
    je = models.DecimalField('金额', max_digits=20, decimal_places=2, editable=False, null=True, blank=True, )
    jsr = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        # blank=True,
        # null=True,
        related_name='xs_jsr',
        verbose_name='销售经手人',
        help_text='默认为填表人',
    )
    xssj = models.DateTimeField('销售时间', default=timezone.now)#auto_now_add=True
    gk = models.ForeignKey(
        'company.GuKeXinXi',
        # to_field='gkmc',
        on_delete=models.CASCADE,
        verbose_name='顾客',
    )

    date = models.DateField('日期', editable=False, blank=True, null=True)#auto_now_add=True

    def month(self):
        return self.date.month

    def save(self, *args, **kwargs):
        self.date = self.xssj.date()
        if not self.dj:
            self.dj = self.cpkc.cpbh.cj
        self.je = self.dj * self.sl

        super().save(*args, **kwargs)
        self.xsdh = '%07d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s销售%s %s' % (self.cpkc.ssjg, self.cpkc.cpmc, self.sl)


class ChanPinPanCun(models.Model):
    class Meta:
        verbose_name = '产品盘存'
        verbose_name_plural = '产品盘存'

    cpkc = models.ForeignKey(
        'ChanPinKuCun',
        on_delete=models.CASCADE,
        verbose_name='产品库存',
    )

    sl = models.IntegerField('数量', default=0)
    jsr = models.ForeignKey(
        'company.Employee',
        on_delete=models.CASCADE,
        blank=True,
        null=True,
        related_name='pc_jsr',
        verbose_name='盘存经手人',
        help_text='默认为填表人',
    )
    pcsj = models.DateTimeField('盘存时间', default=timezone.now)
    date = models.DateField('日期', editable=False, blank=True, null=True)

    def month(self):
        return self.date.month

    def __str__(self):
        if self.sl > 0:
            pc = '增加了'
        else:
            pc = '减少了'
        return '%s%s%d' % (self.cpkc, pc, self.sl)
