#!/bin/bash

# Installe et démarre fail2ban
dnf install fail2ban -y
systemctl start fail2ban.service
sudo systemctl enable fail2ban.service

# Installe et configure netdata
wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh
systemctl start netdata
systemctl enable netdata

# Configure le pare-feu
firewall-cmd --permanent --add-port=19999/tcp
firewall-cmd --reload

# Installe et démarre vsftpd
dnf install vsftpd -y
systemctl start vsftpd
systemctl enable vsftpd

# Configure le pare-feu pour le service FTP
firewall-cmd --add-service=ftp --permanent --zone=public
firewall-cmd --reload
