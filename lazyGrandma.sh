#!/bin/bash

# lazyGrandma V.1 by @AhmedConstant

# Description:
# lazyGrandma: is a shell script aim to automatically launch 50+ online web scanning tools in the Browsaer against a target domain in a 10 waves.
# Wave.1 	: Subdomains Enumeration
# Wave.2 	: Ports/DNS/Whois
# Wave.3 	: Headers/Built With
# Wave.4 	: TLS/SSL Certificates
# Wave.5 	: Analyze
# Wave.6 	: Wayback MACHINE
# Wave.7 	: Search Engines
# Wave.8 	: Google Dorks
# Wave.9 	: Github Dorks p1
# Wave.10 	: Github Dorks p2

# DEPENDENCIES:
# iceweasel or xdg-utils (apt-get install xdg-utils)
# Linux

# Credits
# THIS SCRIPT IS INSPIRED BY "GooHak by @xer0dayz", SO BIG THANKS TO HIM/HER.

TARGET="$1"
BROWSER="xdg-open"
DELAY=5
RAM="### make sure you close the opened tabs, before going on to the next wave - a message from your RAM ###"

if [ -z $TARGET ]; then
	echo -e "Write a Valid Domain!"
	echo -e "./lazyGrandma <domain>"
	echo -e "Ex: ./lazyGrandma exmple.com"
	exit
fi
figlet -t Lazy Grandma

read -p "First wave: #! Subdomains Enumeration !# ** Press Any Key To Continue...."

#### Sub Domains
# Virustotal
$BROWSER https://www.virustotal.com/gui/domain/$TARGET/relations 2> /dev/null
# CRT.SH
$BROWSER https://crt.sh/?q=%25.$TARGET 2> /dev/null
# DNSdumpster
https://dnsdumpster.com/
# Riddler
$BROWSER https://riddler.io/search?q=pld:$TARGET 2> /dev/null
$BROWSER https://riddler.io/search?q=host:$TARGET 2> /dev/null
$BROWSER https://riddler.io/search?q=keyword%3A$TARGET&view_type=data_table 2> /dev/null

sleep $DELAY

# Find subdomains
$BROWSER https://findsubdomains.com/subdomains-of/souqana.com 2> /dev/null
# DNStable
$BROWSER https://dnstable.com/domain/$TARGET 2> /dev/null
# Securitytrails
$BROWSER https://securitytrails.com/list/apex_domain/$TARGET 2> /dev/null
# Certspotter
$BROWSER https://certspotter.com/api/v0/certs?domain=$TARGET 2> /dev/null

sleep $DELAY
# Google
$BROWSER "https://www.google.ca/search?q=site:*.$TARGET" 2> /dev/null
$BROWSER "https://www.google.ca/search?q=site:*.*.$TARGET" 2> /dev/null

echo $RAM
read -p "Next wave: #! Ports/DNS/Whois !# ** Press Any Key To Continue...."

#### Ports/DNS/Whois
# Port Scan
$BROWSER https://viewdns.info/portscan/?host=$TARGET 2> /dev/null
# DNS Report
$BROWSER https://viewdns.info/dnsreport/?domain=$TARGET 2> /dev/null
# Reverse Whois
$BROWSER http://viewdns.info/reversewhois/?q=$TARGET 2> /dev/null
# Whois
$BROWSER https://viewdns.info/whois/?domain=$TARGET 2> /dev/null
# DNSlytics
$BROWSER https://dnslytics.com/domain/$TARGET 2> /dev/null

echo "### anything could be useful, if you know how to use it :) ###"
read -p "Next wave: #! Headers/Built With !# ** Press Any Key To Continue...."

# THREATCROWD
$BROWSER https://www.threatcrowd.org/domain.php?domain=$TARGET 2> /dev/null
# Security Headers
$BROWSER https://securityheaders.com/?q=$TARGET&followRedirects=on 2> /dev/null
# Headers
$BROWSER https://viewdns.info/httpheaders/?domain=$TARGET 2> /dev/null
# Built With
$BROWSER https://builtwith.com/$TARGET 2> /dev/null

echo $RAM
read -p "Next wave: #! TLS/SSL Certificates !# ** Press Any Key To Continue...."

#### SSL
# SSLLABS
$BROWSER https://www.ssllabs.com/ssltest/analyze.html?d=$TARGET 2> /dev/null
# Cert DB
$BROWSER https://certdb.com/search/index?q=domain%3A%22$TARGET%22 2> /dev/null
# Transparency Report
$BROWSER https://transparencyreport.google.com/https/certificates?cert_search_auth=&cert_search_cert=p:c291cWFuYS5jb206dHJ1ZTp0cnVlOjpFQUU9&cert_search=include_expired:true;include_subdomains:true;domain:$TARGET&lu=cert_search_cert 2> /dev/null

echo $RAM
read -p "Next wave: #! Analyze !# ** Press Any Key To Continue...."

# Immuniweb
$BROWSER https://www.immuniweb.com/websec/ 2> /dev/null
# NETCRAFT
$BROWSER http://toolbar.netcraft.com/site_report?url=$TARGET 2> /dev/null
# Sucuri
$BROWSER https://sitecheck.sucuri.net/results/$TARGET 2> /dev/null
# Siteguarding
$BROWSER https://www.siteguarding.com/spam/viewreport?domain=$TARGET 2> /dev/null
# Upguard
$BROWSER https://app.upguard.com/webscan#/www.$TARGET 2> /dev/null
# Observatory
$BROWSER https://observatory.mozilla.org/analyze/$TARGET 2> /dev/null
# Accessify
$BROWSER https://www.accessify.com/s/$TARGET 2> /dev/null

echo "### old is always GOOD! :) ###"
read -p "Next wave: #! Wayback MACHINE !# ** Press Any Key To Continue...."

# WAYBACKMACHINE
$BROWSER https://web.archive.org/web/*/$TARGET 2> /dev/null

echo "### i hope you are good at Mandarin Chinese :'D ###"
read -p "Next wave: #! Search Engines !# ** Press Any Key To Continue...."

#### Search Engines
# FOFA
$BROWSER https://fofa.so/result?q=$TARGET&qbase64=ImZhY2Vib29rLmNvbSI%3D&full=true 2> /dev/null
# ZOOMEYE
$BROWSER https://www.zoomeye.org/searchResult/bugs?q=$TARGET 2> /dev/null
$BROWSER https://www.zoomeye.org/searchResult?q=$TARGET
# SHOWDAN
$BROWSER https://www.shodan.io/search?query=$TARGET 2> /dev/null
# CENSYS
$BROWSER https://www.censys.io/ipv4?q=$TARGET 2> /dev/null

echo $RAM
read -p "Next wave: #! Google Dorks !# ** Press Any Key To Continue...."

#### Google Dorks
# FIND FILES BY EXTENSION:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+ext:cgi+OR+ext:php+OR+ext:asp+OR+ext:aspx+OR+ext:jsp+OR+ext:jspx+OR+ext:swf+OR+ext:fla+OR+ext:xml" 2> /dev/null
# FIND DOCUMENTS BY EXTENSION:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+ext:doc+OR+ext:docx+OR+ext:csv+OR+ext:pdf+OR+ext:txt+OR+ext:log+OR+ext:bak" 2> /dev/null
# FIND APACHE STRUTS RCE's:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+ext:action+OR+struts" 2> /dev/null
# FIND PASTEBIN POSTS FOR DOMAIN:
$BROWSER "https://www.google.ca/search?q=site:pastebin.com+$TARGET" 2> /dev/null
# FIND EMPLOYEES ON LINKEDIN:
$BROWSER "https://www.google.ca/search?q=site:linkedin.com+employees+$TARGET" 2> /dev/null

sleep $DELAY

# FIND LOGIN PAGES:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+username+OR+password+OR+login+OR+root+OR+admin" 2> /dev/null
# SEARCH FOR BACKDOORS:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+inurl:shell+OR+inurl:backdoor+OR+inurl:wso+OR+inurl:cmd+OR+shadow+OR+passwd+OR+boot.ini+OR+inurl:backdoor" 2> /dev/null
# FIND SETUP OR INSTALL FILES:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+inurl:readme+OR+inurl:license+OR+inurl:install+OR+inurl:setup+OR+inurl:config" 2> /dev/null
# FIND WORDPRESS PLUGINS/UPLOADS/DOWNLOADS:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+inurl:wp-+OR+inurl:plugin+OR+inurl:upload+OR+inurl:download" 2> /dev/null
# FIND OPEN REDIRECTS:
$BROWSER "https://www.google.ca/search?q=site:$TARGET+inurl:redir+OR+inurl:url+OR+inurl:redirect+OR+inurl:return+OR+inurl:src=http+OR+inurl:r=http" 2> /dev/null

sleep $DELAY

echo "### it's perfectly normal not finding any results, Don't be frustrated :( ###"
read -p "Next wave: #! Github Dorks p1 !# ** Press Any Key To Continue...."

#### Github Dorks
# 
$BROWSER https://github.com/search?q=$TARGET 2> /dev/null
# npm registry authentication data
$BROWSER https://github.com/search?q=$TARGET+filename:.npmrc_auth 2> /dev/null
# docker registry authentication data
$BROWSER https://github.com/search?q=$TARGET+filename:.dockercfg+auth 2> /dev/null
# private keys
$BROWSER https://github.com/search?q=$TARGET+extension:pem+private 2> /dev/null

sleep $DELAY

# puttygen private keys
$BROWSER https://github.com/search?q=$TARGET+extension:ppk+private 2> /dev/null
# private ssh keys
$BROWSER https://github.com/search?q=$TARGET+filename:id_rsa 2> /dev/null
# private ssh keys
$BROWSER https://github.com/search?q=$TARGET+filename:id_dsa 2> /dev/null
# mysql dump
$BROWSER https://github.com/search?q=$TARGET+extension:sql+mysql+dump 2> /dev/null

echo "### it's recommended that you wait for a couple moments, before this wave, so you escape from Github Rate limit ###"
read -p "Next wave: #! Github Dorks p2 !# ** Press Any Key To Continue...."

# mysql dump look for password
$BROWSER https://github.com/search?q=$TARGET+extension:sql+mysql+dump+password 2> /dev/null
# htpasswd files
$BROWSER https://github.com/search?q=$TARGET+filename:.htpasswd 2> /dev/null
# Heroku api keys
$BROWSER https://github.com/search?q=$TARGET+HEROKU_API_KEY+language:shell 2> /dev/null
# Heroku api keys in json files
$BROWSER https://github.com/search?q=$TARGET+HEROKU_API_KEY+language:json 2> /dev/null
# Bash history file
$BROWSER https://github.com/search?q=$TARGET+filename:.bash_history 2> /dev/null
# history file
$BROWSER https://github.com/search?q=$TARGET+filename:.history 2> /dev/null

read -p "goodbye, and i wish you find a $20,000 Bug today :)"
