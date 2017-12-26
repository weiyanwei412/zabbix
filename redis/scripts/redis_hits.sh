#!/bin/bash
# -------------------------------------------------------------------------------
# Filename:    redis3.2.10
# Revision:    v0.1
# Date:        2017.12.21
# Author:      letian
# Email:       412166174@qq.com
# Website:     http://blog.51cto.com/412166174
# -------------------------------------------------------------------------------
# Notice
# redis Take hits
#UserParameter=redis_hits,/etc/zabbix/scripts/redis_hits.sh
# is scripts Take hits hits/(hits+misses)
hits=`awk -F ':' '/keyspace_hits/{print $2}' /tmp/redis-info.txt`
misses=`awk -F ':' '/keyspace_misses/{print $2}' /tmp/redis-info.txt`
a=$hits
b=$misses
c=`awk 'BEGIN{a=$a;b=$b;print '$a+$b'}'`
awk 'BEGIN{c=$c;a=$a;print '$a/$c'}'
