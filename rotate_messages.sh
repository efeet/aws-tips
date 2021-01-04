rm /root/ejemplo
cat <<EOF >>/root/ejemplo
/var/log/cron
/var/log/maillog
/var/log/secure
/var/log/spooler
{
    missingok
    sharedscripts
    postrotate
	/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
    endscript
}

/var/log/messages
{
	missingok
	compress
	delaycompress
    daily
    rotate 31
    create 0600 root root
	size 200M
    postrotate
    /bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
    endscript
}
EOF
ls -l /root/ejemplo
ls -l /etc/logrotate.d/syslog
cp /etc/logrotate.d/syslog /root/syslog.bkp.$(date +%H:%m:%S)
cp /root/ejemplo  /etc/logrotate.d/syslog
cat /etc/logrotate.d/syslog
ls -l /etc/logrotate.d/syslog