#!/bin/sh
yum -y install wget;
adduser splunk;
wget -O /tmp/splunk-7.2.4-8a94541dcfac-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.4&product=splunk&filename=splunk-7.2.4-8a94541dcfac-Linux-x86_64.tgz&wget=true'
tar -xzvf /tmp/splunk-7.2.4-8a94541dcfac-Linux-x86_64.tgz -C /opt;
/opt/splunk/bin/splunk start --answer-yes --no-prompt --accept-license --seed-passwd changeme;
/opt/splunk/bin/splunk stop -auth admin:changeme;
/opt/splunk/bin/splunk enable boot-start -user splunk;
chown -R splunk:splunk /opt/splunk;
runuser -l splunk -c '/opt/splunk/bin/splunk start';
rm -rf /tmp/splunk-7.2.4-8a94541dcfac-Linux-x86_64.tgz;
