#!/bin/bash

head -9 /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d/file_beanstalk.json > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d/catalina-log.json
tail -6 file_beanstalk.json >> catalina-log.json

sed -i '7s/eb-engine.log/tomcat\/catalina.out/g' catalina-log.json
sed -i '8s/eb-engine.log/tomcat\/catalina.out/g' catalina-log.json

systemctl restart amazon-cloudwatch-agent
