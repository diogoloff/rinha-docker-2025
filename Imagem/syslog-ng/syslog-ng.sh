#!/bin/bash
set -e
set -x

SYSLOG_NG_BUILD_PATH=/docker_build/syslog-ng

rm -f /etc/my_init.d/10_syslog-ng.init
rm -f /etc/my_init.d/10_syslog-ng.shutdown

## Install a syslog daemon.
apt-get install -y --no-install-recommends syslog-ng-core
cp $SYSLOG_NG_BUILD_PATH/syslog-ng.init /etc/my_init.d/10_syslog-ng.init
cp $SYSLOG_NG_BUILD_PATH/syslog-ng.shutdown /etc/my_init.pre_shutdown.d/90_syslog-ng.shutdown
cp $SYSLOG_NG_BUILD_PATH/smart-multi-line.fsm /usr/share/syslog-ng/smart-multi-line.fsm
mkdir -p /var/lib/syslog-ng
cp $SYSLOG_NG_BUILD_PATH/syslog_ng_default /etc/default/syslog-ng
touch /var/log/syslog
chmod u=rw,g=r,o= /var/log/syslog
cp $SYSLOG_NG_BUILD_PATH/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

## Install logrotate.
apt-get install -y --no-install-recommends logrotate
cp $SYSLOG_NG_BUILD_PATH/logrotate.conf /etc/logrotate.conf
cp $SYSLOG_NG_BUILD_PATH/logrotate_syslogng /etc/logrotate.d/syslog-ng
