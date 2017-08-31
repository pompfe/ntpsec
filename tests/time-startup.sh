#!/bin/sh
# Hack to measure startup timing

# FIXME - needed on Fedora
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

if test "$#" -ge 1
then
  CONF=$1
else
  CONF=/etc/ntp.conf
fi



killall ntpd
sleep 5

time /usr/local/sbin/ntpd -u ntp:ntp -g -c $CONF
/usr/local/bin/ntpwait -v -n 999 -s 1

/usr/local/bin/ntpq -np
