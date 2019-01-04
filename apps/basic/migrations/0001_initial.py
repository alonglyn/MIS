# Generated by Django 2.0 on 2019-01-04 01:24

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BaoZhuangWu',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mc', models.CharField(max_length=10, unique=True, verbose_name='名称')),
            ],
            options={
                'verbose_name_plural': '包装物',
                'verbose_name': '包装物',
            },
        ),
        migrations.CreateModel(
            name='JiLiangDanWei',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mc', models.CharField(max_length=10, unique=True, verbose_name='名称')),
            ],
            options={
                'verbose_name_plural': '计量单位',
                'verbose_name': '计量单位',
            },
        ),
        migrations.CreateModel(
            name='Status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=10, unique=True, verbose_name='状态')),
            ],
            options={
                'verbose_name_plural': '状态',
                'verbose_name': '状态',
            },
        ),
        migrations.CreateModel(
            name='ZhongZhiDanWei',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mc', models.CharField(max_length=10, unique=True, verbose_name='名称')),
            ],
            options={
                'verbose_name_plural': '种植单位',
                'verbose_name': '种植单位',
            },
        ),
    ]
