from django.db import models
from django.contrib.auth.models import User
from company.models import get_sentinel_user
from basic.models import *
import django.utils.timezone as timezone


# def auto_update_status(obj):
#     obj.parent


# Create your models here.
# 蔬菜生产表 蔬菜编号， 种植面积， 播种期
class ShuCaiShengChan(models.Model):
    class Meta:
        verbose_name = '蔬菜生产计划'
        verbose_name_plural = '蔬菜生产计划'

    scbh = models.ForeignKey(
        'company.ChanPinXinXi',
        on_delete=models.CASCADE,
        verbose_name='蔬菜编号',
    )
    zzmj = models.IntegerField('种植面积')
    dw = models.CharField(
        verbose_name='单位',
        max_length=5,
        choices=ZhongZhiDanWei.objects.all().values_list('mc', 'mc'),
    )
    bzq = models.DateField('播种期')  # TODO 播种期是否使用choice选项。

    def __str__(self):
        return '生产 %s %d亩' % (self.scbh.cpmc, self.zzmj)


# 公司生产计划表  （生产计划编号， 制定时间， 制定人， 参与生产基地）
class GongSiShengChan(models.Model):
    class Meta:
        verbose_name = '公司生产计划'
        verbose_name_plural = '公司生产计划'

    scjhbh = models.CharField('生产计划编号', unique=True, max_length=50)
    scscjh = models.ManyToManyField(
        ShuCaiShengChan,
        blank=True,
        verbose_name='蔬菜生产计划',
    )
    zdsj = models.DateField('制定时间', default=timezone.now)  # auto_now_add=True
    zdr = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        verbose_name='制定人'
    )
    status = models.BooleanField('状态', help_text='整个计划是否完成')

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        self.rkdh = '%07d' % self.id
        super().save(*args, **kwargs)

    def __str__(self):
        return '公司的%s生产计划' % self.scjhbh


# 生产基地生产（
class ShengChanJiDiShengChan(models.Model):
    class Meta:
        verbose_name = '生产基地生产计划'
        verbose_name_plural = '生产基地生产计划'

    scjd = models.ForeignKey(
        'company.JiGou',
        on_delete=models.CASCADE,
        limit_choices_to={'jglb': 'JD'},
        verbose_name='生产基地'
    )
    parent = models.ForeignKey(
        GongSiShengChan,
        on_delete=models.CASCADE,
        verbose_name='父计划',
    )
    scscjh = models.ManyToManyField(
        ShuCaiShengChan,
        blank=True,
        verbose_name='蔬菜生产计划',
    )
    zdsj = models.DateField('制定时间', default=timezone.now)  # auto_now_add=True
    zdr = models.ForeignKey(
        'company.Employee',
        to_field='name',
        on_delete=models.CASCADE,
        verbose_name='制定人'
    )
    status = models.BooleanField('状态', help_text='整个计划是否完成')

    def get_bh(self):
        return self.parent.scjhbh

    def __str__(self):
        return '%s 的 %s 生产计划' % (self.scjd.jgmc, self.get_bh())


# 代购点生产

class DaiGouDianShengChan(models.Model):
    class Meta:
        verbose_name = '代购点生产计划'
        verbose_name_plural = '代购点生产计划'

    dgd = models.ForeignKey(
        'company.JiGou',
        on_delete=models.CASCADE,
        limit_choices_to={'jglb': 'DG'},
        verbose_name='代购点'
    )
    parent = models.ForeignKey(
        ShengChanJiDiShengChan,
        on_delete=models.CASCADE,
        verbose_name='父计划',
    )
    scscjh = models.ManyToManyField(
        ShuCaiShengChan,
        blank=True,
        verbose_name='蔬菜生产计划',
    )
    zdsj = models.DateField('制定时间', default=timezone.now)  # auto_now_add=True
    zdr = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        verbose_name='制定人'
    )
    status = models.BooleanField('状态', help_text='整个计划是否完成')

    def get_bh(self):
        return self.parent.get_bh()

    def __str__(self):
        return '%s 的 %s 生产计划' % (self.dgd.jgmc, self.get_bh())


# 农户生产表(
class NongHuShengChan(models.Model):
    class Meta:
        verbose_name = '农户生产计划'
        verbose_name_plural = '农户生产计划'

    nh = models.ForeignKey(
        'company.NongHuXinXi',
        on_delete=models.CASCADE,
        verbose_name='农户',
    )
    parent = models.ForeignKey(
        DaiGouDianShengChan,
        on_delete=models.CASCADE,
        verbose_name='父计划',
    )
    scscjh = models.ManyToManyField(
        ShuCaiShengChan,
        blank=True,
        verbose_name='蔬菜生产计划',
    )
    zdsj = models.DateField('制定时间', default=timezone.now)  # auto_now_add=True
    zdr = models.ForeignKey(
        'company.Employee', to_field='name',
        on_delete=models.CASCADE,
        verbose_name='制定人'
    )
    status = models.BooleanField('状态', help_text='整个计划是否完成')

    def get_bh(self):
        return self.parent.get_bh()

    def __str__(self):
        return '%s 的 %s 生产计划' % (self.nh.nhmc, self.get_bh())
