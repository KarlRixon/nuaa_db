# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class Commodity(models.Model):
    gid = models.AutoField(primary_key=True)
    gname = models.CharField(max_length=40)
    gprice = models.FloatField()

    def __str__(self):
        return self.gname

    class Meta:
        managed = True
        db_table = 'commodity'


class Customer(models.Model):
    cid = models.AutoField(primary_key=True)
    cname = models.CharField(max_length=10)
    csex = models.CharField(max_length=2)
    cbirthday = models.DateField(blank=True, null=True)
    caddr = models.CharField(max_length=50)
    cphone = models.CharField(max_length=11)

    def __str__(self):
        return self.cname

    class Meta:
        managed = True
        db_table = 'customer'


class Record(models.Model):
    gid = models.ForeignKey(Commodity, models.DO_NOTHING, db_column='gid', primary_key=True)
    cid = models.ForeignKey(Customer, models.DO_NOTHING, db_column='cid')
    rtime = models.DateTimeField()
    rnum = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'record'
        unique_together = (('gid', 'cid'),)

