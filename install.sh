#!/bin/bash
#
# Copyright 2019 Anneberg School 
#
# Author: MW
# Common code

#I. Install all Pre-requisites

#PHP
dnf install php php-mysqlnd
#MariaDB
dnf install mariadb-server
#Apache
dnf install httpd

#II. Open HTTP and HTTPS port 80 and 443 on firewall.

#firewall-cmd --permanent --zone=public --add-service=http
#firewall-cmd --permanent --zone=public --add-service=https

#OR

firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp

#III. Start both Apache and MariaDB service.

systemctl start mariadb
systemctl start httpd

#IV. Enable MariaDB and Apache on startup after system reboot.

systemctl enable mariadb
systemctl enable httpd

#V. Install additional PHP modules if needed

#dnf search php -

#VI. Remove Virbr0 Virtual Bridge Interface

#Stop the libvirtd.service
systemctl stop libvirtd.service

#Disable the service
systemctl disable libvirtd.service

#Down the Bridge
ip link set virbr0 down

#VII. Install Webmin for Remote Management

Go to OPT directory
# cd /opt
# wget http://www.webmin.com/jcameron-key.asc
# wget http://www.webmin.com/download/rpm/webmin-current.rpm
# dnf install perl-Encode-Detect
# dnf install perl-Digest-MD5
# rpm --import jcameron-key.asc
# rpm -Uvh webmin-current.rpm

VIII. Set Hostname
# hostnamectl set-hostname "CentOS8"
