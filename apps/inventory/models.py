from django.db import models
from functools import reduce
from django.contrib.auth.models import User
from company.models import get_sentinel_user
import django.utils.timezone as timezone

# Create your models here.
'''
机构(....)  company

仓库(仓库编号， 仓库名称， 所属机构， (负责人))  here

产品  company


产品库存（仓库， 产品名称， 数量）   here

入库单（[物资 \ 产品]库存[fk]， .....）   here

出库单   here

盘存单   here



物资  company

物资库存（仓库[fk]， 物资名称[fk]， 数量）（单价）   here

入库单（[物资 \ 产品]库存[fk]， .....）   here

出库单   here

盘存单   here

'''


class WuZiKuCun(models.Model):
    class Meta:
        verbose_name = "物资库存"
        verbose_name_plural = "物资库存"

    wzkcbh = models.CharField(unique=True, max_length=50, verbose_name="物资库存编号")
    ssjg = models.ForeignKey(
        'company.JiGou',
        on_delete=models.CASCADE,
        verbose_name='所属机构'
    )
    wzbh = models.ForeignKey(
        'company.WuZiXinXi',
        on_delete=models.CASCADE,
        verbose_name='物资编号',
    )
    wzmc = models.CharField(default='', max_length=50, verbose_name='物资名称')

    # 查询库存数量， 也可以使用库存数量字段， 但是要设置触发器， 在更新的时候更新库存数量， 不过这样比较麻烦
    def count(self):
        ret = 0
        l = [int(i.sl) for i in self.wuziruku_set.all()]
        if len(l) != 0:
            ret += reduce(lambda x, y: x + y, l)
        l = [int(i.sl) for i in self.wuzichuku_set.all()]
        if len(l) != 0:
            ret -= reduce(lambda x, y: x + y, l)
        l = [int(i.sl) for i in self.wuzifafang_set.all()]
        if len(l) != 0:
            ret -= reduce(lambda x, y: x + y, l)
        l = [int(i.sl) for i in self.wuzipancun_set.all()]
        if len(l) != 0:
            ret += reduce(lambda x, y: x + y, l)

        return ret

    def save(self, *args, **kwargs):
        self.wzmc = self.wzbh.wzmc
        self.wzkcbh = self.ssjg.jgbh + self.wzbh.wzbh
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s 的 %s' % (self.ssjg.jgmc, self.wzmc)


class WuZiRuKu(models.Model):
    class Meta:
        verbose_name = "物资入库"
        verbose_name_plural = "物资入库"

    rkdh = models.CharField(unique=True, max_length=50, verbose_name='入库单号')
    wzkc = models.ForeignKey(
        WuZiKuCun,
        on_delete=models.CASCADE,
        verbose_name='物资库存表',
    )

    cj = models.DecimalField('价格', default=0, null=True, blank=True, max_digits=10, decimal_places=2)
    sl = models.IntegerField('数量', default=0)
    je = models.DecimalField('金额', max_digits=20, decimal_places=2, editable=False, null=True, blank=True, )

    czz = models.ForeignKey(
        'company.Employee',
        to_field='name',
        on_delete=models.CASCADE,
        verbose_name='操作者'
    )
    czsj = models.DateTimeField(verbose_name='操作时间', default=timezone.now)  # auto_now_add=True
    date = models.DateField('日期', editable=False, blank=True)

    def save(self, *args, **kwargs):
        self.date = self.czsj.date()
        super().save(*args, **kwargs)
        if not self.cj:
            self.cj = self.wzkc.wzbh.cj
        self.je = self.cj * self.sl
        self.rkdh = '%07d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s入库%s %s' % (self.wzkc.ssjg, self.wzkc.wzmc, self.sl)


class WuZiChuKu(models.Model):
    class Meta:
        verbose_name = "物资出库"
        verbose_name_plural = "物资出库"

    ckdh = models.CharField(unique=True, max_length=50, verbose_name='出库单号')
    wzkc = models.ForeignKey(
        WuZiKuCun,
        on_delete=models.CASCADE,
        verbose_name='物资库存表'
    )

    cj = models.DecimalField('价格', default=0, null=True, blank=True, max_digits=10, decimal_places=2)
    sl = models.IntegerField('数量', default=0)
    je = models.DecimalField('金额', max_digits=20, decimal_places=2, editable=False, null=True, blank=True, )
    czz = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        verbose_name='操作者'
    )
    czsj = models.DateTimeField(verbose_name='操作时间', default=timezone.now)  # auto_now_add=True
    date = models.DateField('日期', editable=False, blank=True)

    def save(self, *args, **kwargs):
        self.date = self.czsj.date()
        super().save(*args, **kwargs)
        if not self.cj:
            self.cj = self.wzkc.wzbh.cj
        self.je = self.cj * self.sl
        self.ckdh = '%07d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s出库%s %s' % (self.wzkc.ssjg, self.wzkc.wzmc, self.sl)


class WuZiFaFang(models.Model):
    class Meta:
        verbose_name = "物资发放"
        verbose_name_plural = "物资发放"

    ffbh = models.CharField('发放编号', unique=True, max_length=20)
    wzkc = models.ForeignKey(
        WuZiKuCun,
        on_delete=models.CASCADE,
        verbose_name='物资库存表'
    )

    cj = models.DecimalField('价格', default=0, null=True, blank=True, max_digits=10, decimal_places=2)
    sl = models.IntegerField('数量', default=0)
    je = models.DecimalField('金额', max_digits=20, decimal_places=2, editable=False, null=True, blank=True, )
    czz = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        verbose_name='操作者',
    )
    nh = models.ForeignKey(
        'company.NongHuXinXi',
        on_delete=models.CASCADE,
        verbose_name='农户',
    )
    czsj = models.DateTimeField(verbose_name='操作时间', default=timezone.now)  # auto_now_add=True
    date = models.DateField('日期', editable=False, blank=True)

    def save(self, *args, **kwargs):
        self.date = self.czsj.date()
        super().save(*args, **kwargs)
        if not self.cj:
            self.cj = self.wzkc.wzbh.cj
        self.je = self.cj * self.sl
        self.ffbh = '%07d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return '%s发放%s %s' % (self.wzkc.ssjg, self.wzkc.wzmc, self.sl)


class WuZiPanCun(models.Model):
    class Meta:
        verbose_name = "物资盘存"
        verbose_name_plural = "物资盘存"

    wzkc = models.ForeignKey(
        WuZiKuCun,
        on_delete=models.CASCADE,
        verbose_name='物资库存表'
    )

    sl = models.IntegerField('数量', default=0)
    czz = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        verbose_name='操作者',
    )
    czsj = models.DateTimeField(verbose_name='操作时间', default=timezone.now)  # auto_now_add=True
    date = models.DateField('日期', editable=False, blank=True)

    def save(self, *args, **kwargs):
        self.date = self.czsj.date()
        super().save(*args, **kwargs)

    def __str__(self):
        if self.sl > 0:
            pc = '增加了'
        else:
            pc = '减少了'
        return '%s%s%d' % (self.wzkc, pc, self.sl)
