#!/bin/bash
#add this to crontab: */15 * * * * sh /root/ssbc/bin/ssbc-reboot.sh
ps -ef|grep simdht_worker.py|grep -v grep|awk '{print $2}'|xargs kill -9
ps -ef|grep index_worker.py|grep -v grep|awk '{print $2}'|xargs kill -9
cd /root/ssbc/workers
nohup python simdht_worker.py >/dev/zero 2>&1&
nohup python index_worker.py >/dev/zero 2>&1&
exit
