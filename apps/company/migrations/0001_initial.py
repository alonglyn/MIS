# Generated by Django 2.0 on 2019-01-04 01:25

import company.models
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ChanPinXinXi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cpbh', models.CharField(blank=True, editable=False, max_length=50, null=True, verbose_name='产品编号')),
                ('cpmc', models.CharField(max_length=50, verbose_name='产品名称')),
                ('cpdj', models.CharField(max_length=50, verbose_name='产品等级')),
                ('cd', models.CharField(max_length=50, verbose_name='产地')),
                ('jj', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='进价')),
                ('cj', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='出价')),
                ('bzw', models.CharField(blank=True, max_length=5, null=True, verbose_name='包装物')),
            ],
            options={
                'verbose_name_plural': '产品信息',
                'verbose_name': '产品信息',
            },
        ),
        migrations.CreateModel(
            name='Employee',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=10, unique=True, verbose_name='中文姓名')),
                ('lxdh', models.CharField(max_length=12, verbose_name='联系电话')),
            ],
            options={
                'verbose_name_plural': '员工账户',
                'verbose_name': '员工账户',
            },
        ),
        migrations.CreateModel(
            name='GuKeXinXi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gkbh', models.CharField(max_length=20, unique=True, verbose_name='顾客编号')),
                ('gkmc', models.CharField(max_length=20, unique=True, verbose_name='顾客名称')),
                ('gkzz', models.CharField(max_length=20, verbose_name='顾客住址')),
                ('lxdh', models.CharField(max_length=12, verbose_name='联系电话')),
            ],
            options={
                'verbose_name_plural': '顾客信息',
                'verbose_name': '顾客信息',
            },
        ),
        migrations.CreateModel(
            name='JiGou',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('jgbh', models.CharField(editable=False, max_length=50, unique=True, verbose_name='机构编号')),
                ('jgmc', models.CharField(editable=False, max_length=50, unique=True, verbose_name='机构名称')),
                ('jglb', models.CharField(choices=[('GS', '公司'), ('JD', '生产基地'), ('PF', '批发中心'), ('DG', '代购点')], max_length=50, verbose_name='机构类别')),
                ('lxdh', models.CharField(max_length=12, verbose_name='联系电话')),
                ('level', models.PositiveSmallIntegerField(blank=True, null=True, verbose_name='等级')),
                ('fzr', models.ForeignKey(blank=True, null=True, on_delete=models.SET(company.models.get_sentinel_user), to='company.Employee', to_field='name', verbose_name='负责人')),
                ('ssjg', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='child_jg', to='company.JiGou', verbose_name='所属机构')),
            ],
            options={
                'verbose_name_plural': '公司机构',
                'verbose_name': '公司机构',
            },
        ),
        migrations.CreateModel(
            name='NongHuXinXi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nhbh', models.CharField(max_length=100, unique=True, verbose_name='农户编号')),
                ('nhmc', models.CharField(max_length=100, unique=True, verbose_name='农户名称')),
                ('nhzz', models.CharField(max_length=100, verbose_name='农户住址')),
                ('lxdh', models.CharField(max_length=12, verbose_name='联系电话')),
                ('dgd', models.ForeignKey(limit_choices_to={'jglb': 'DGD'}, on_delete=django.db.models.deletion.CASCADE, to='company.JiGou', verbose_name='所属代购点')),
            ],
            options={
                'verbose_name_plural': '农户信息',
                'verbose_name': '农户信息',
            },
        ),
        migrations.CreateModel(
            name='PingZhongXinXi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pzbm', models.CharField(max_length=20, unique=True, verbose_name='品种编码')),
                ('pzmc', models.CharField(max_length=20, verbose_name='品种名称')),
            ],
            options={
                'verbose_name_plural': '品种信息',
                'verbose_name': '品种信息',
            },
        ),
        migrations.CreateModel(
            name='WuZiXinXi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('wzbh', models.CharField(max_length=50, unique=True, verbose_name='物资编号')),
                ('wzmc', models.CharField(max_length=50, unique=True, verbose_name='物资名称')),
                ('jldw', models.CharField(max_length=5, verbose_name='计量单位')),
                ('jj', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='进价')),
                ('cj', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='出价')),
            ],
            options={
                'verbose_name_plural': '物资信息',
                'verbose_name': '物资信息',
            },
        ),
        migrations.AddField(
            model_name='employee',
            name='ssjg',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='company.JiGou', verbose_name='所属机构'),
        ),
        migrations.AddField(
            model_name='employee',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='employee', to=settings.AUTH_USER_MODEL, verbose_name='管理员账户'),
        ),
        migrations.AddField(
            model_name='chanpinxinxi',
            name='jgbh',
            field=models.ForeignKey(blank=True, limit_choices_to={'jglb': 'scjd'}, null=True, on_delete=django.db.models.deletion.CASCADE, to='company.JiGou', verbose_name='基地编号'),
        ),
        migrations.AddField(
            model_name='chanpinxinxi',
            name='pzbm',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='company.PingZhongXinXi', verbose_name='品种编码'),
        ),
        migrations.AlterUniqueTogether(
            name='chanpinxinxi',
            unique_together={('cpmc', 'cd')},
        ),
    ]
