#!/bin/sh
apt -y install wget;
adduser splunk;
wget -O /tmp/splunk-7.2.4-8a94541dcfac-linux-2.6-amd64.deb 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.4&product=splunk&filename=splunk-7.2.4-8a94541dcfac-linux-2.6-amd64.deb&wget=true';
dpkg -i /tmp/splunk-7.2.4-8a94541dcfac-linux-2.6-amd64.deb;
/opt/splunk/bin/splunk start --answer-yes --no-prompt --accept-license --seed-passwd changeme;
/opt/splunk/bin/splunk stop -auth admin:changeme;
/opt/splunk/bin/splunk enable boot-start -user splunk;
chown -R splunk:splunk /opt/splunk;
runuser -l splunk -c '/opt/splunk/bin/splunk start';
rm -rf /tmp/splunk-7.2.4-8a94541dcfac-linux-2.6-amd64.deb;
