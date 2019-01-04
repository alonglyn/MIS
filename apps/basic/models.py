from django.db import models


# Create your models here.

class JiLiangDanWei(models.Model):
    class Meta:
        verbose_name = '计量单位'
        verbose_name_plural = '计量单位'

    mc = models.CharField('名称', unique=True, max_length=10, )

    def __str__(self):
        return self.mc


class ZhongZhiDanWei(models.Model):
    class Meta:
        verbose_name = '种植单位'
        verbose_name_plural = '种植单位'

    mc = models.CharField('名称', unique=True, max_length=10, )

    def __str__(self):
        return self.mc


class BaoZhuangWu(models.Model):
    class Meta:
        verbose_name = '包装物'
        verbose_name_plural = '包装物'

    mc = models.CharField('名称', unique=True, max_length=10, )

    def __str__(self):
        return self.mc


class Status(models.Model):
    class Meta:
        verbose_name = '状态'
        verbose_name_plural = '状态'

    status = models.CharField('状态', unique=True, max_length=10, )
