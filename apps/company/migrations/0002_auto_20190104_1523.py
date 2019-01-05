# Generated by Django 2.0 on 2019-01-04 07:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chanpinxinxi',
            name='bzw',
            field=models.CharField(blank=True, choices=[('箱', '箱')], max_length=5, null=True, verbose_name='包装物'),
        ),
        migrations.AlterField(
            model_name='wuzixinxi',
            name='jldw',
            field=models.CharField(choices=[('个', '个'), ('件', '件'), ('捆', '捆'), ('瓶', '瓶'), ('袋', '袋')], max_length=5, verbose_name='计量单位'),
        ),
    ]