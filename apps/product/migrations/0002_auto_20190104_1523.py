# Generated by Django 2.0 on 2019-01-04 07:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='daigoudianshengchan',
            name='dgd',
            field=models.ForeignKey(limit_choices_to={'jglb': 'DG'}, on_delete=django.db.models.deletion.CASCADE, to='company.JiGou', verbose_name='代购点'),
        ),
        migrations.AlterField(
            model_name='shengchanjidishengchan',
            name='scjd',
            field=models.ForeignKey(limit_choices_to={'jglb': 'JD'}, on_delete=django.db.models.deletion.CASCADE, to='company.JiGou', verbose_name='生产基地'),
        ),
        migrations.AlterField(
            model_name='shucaishengchan',
            name='dw',
            field=models.CharField(choices=[('亩', '亩')], max_length=5, verbose_name='单位'),
        ),
    ]