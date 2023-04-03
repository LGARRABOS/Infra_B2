# PC Shadow Citra

Pour installer un pc shadow citra, vous pouvez suivre le tutoriel suivant.

Commande d'utilisation:
- Connexion a distance : IpShadow:3389
- Lancer Citra : citra-emu.citra-qt-nightly

## Prérequis

- Machine Linux Rocky 9.1 :
    - Connexion à Internet (ou réseau local)
    - 2048 MB de mémoire vive (minimum)
    - 128 MB de mémoire vidéo
    - 30 Giga de stockage (minimum)
    - 
- Machines utilisateurs :
    - Windows 10 ou plus
    - Accès à internet (ou réseau local du pc shadow citra)
    - 
- Machine Backup(optionel):
    - Connexion à Internet (ou réseau local du pc shadow citra)

### Install GNOME Desktop

```
[root@localhost ~]# dnf group list --installed
Last metadata expiration check: 0:24:15 ago on Fri Mar 10 09:25:02 2023.
Installed Environment Groups:
Minimal Install
```
```
[root@localhost ~]# dnf group list --available
Last metadata expiration check: 0:27:36 ago on Fri Mar 10 09:25:02 2023.
Available Environment Groups:
   Server
   KDE Plasma Workspaces
   Custom Operating System
   Virtualization Host
Available Groups:
   Fedora Packager
   Xfce
   Legacy UNIX Compatibility
   Console Internet Tools
   Development Tools
   .NET Development
   Graphical Administration Tools
   Network Servers
   RPM Development Tools
   Scientific Support
   Security Tools
   Smart Card Support
   System Tools
   ```
```  
[root@localhost ~]# dnf group install "Workstation"
```
```
[root@localhost ~]# dnf group install "Server with GUI"
```
```
[root@localhost ~]# systemctl set-default graphical
```
```
[root@localhost ~]# systemctl get-default
graphical.target
```
Relancer ensuite votre machine pour lancer l'interface graphique.

### Install xrdp:

```
[root@localhost ~]# dnf install epel-release
```
```
[root@localhost ~]# dnf install xrdp
```
```
[root@localhost ~]# systemctl enable xrdp
```
```
[root@localhost ~]# systemctl start xrdp
```
```
[root@localhost ~]# firewall-cmd --permanent --add-port=3389/tcp
```
```
[root@localhost ~]# firewall-cmd --reload
```

### Citra-emu

```
[root@localhost ~]# dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```
```
[root@localhost ~]# dnf upgrade
```
```
[root@localhost ~]# dnf install snapd
```
```
[root@localhost ~]# snap install citra-emu
```

### Eléments de sécuritée (optionel)
#### Fail2Ban

Install de Fail2Ban

```
[root@localhost ~]# dnf install epel-release -y
Complete!
```
```
[root@localhost ~]# dnf install fail2ban -y
Complete!
```
```
[root@localhost ~]# systemctl start fail2ban.service
[root@localhost ~]# sudo systemctl enable fail2ban.service
```

Modifier la conf de Fail2Ban

```
[root@localhost ~]# vim /etc/fail2ban/jail.conf
```
```
[root@localhost ~]# systemctl restart fail2ban.service
```

#### Sécuriser l'accés a distance

Désactiver Root sur xrdp

```
[root@localhost ~]# vim /etc/xrdp/sesman.ini

[Security]
AllowRootLogin=false
```

Désactiver Root en ssh

```
[root@localhost ~]# vim /etc/ssh/sshd_config

PermitRootLogin No
```

```
[root@localhost ~]# systemctl restart sshd
```

Paramétrer les utilisateurs qui aurront accés au Shadow

```
[root@localhost ~]# groupadd <Nom_du_groupe>
```
Ajoutez les utilisateurs qui aurront accés au Shadow Citra  dans ce groupe (crée un utilisateur par session).
```
[root@localhost ~]# vim /etc/xrdp/sesman.ini

[Security]
[...]
TerminalServerUsers=<Nom_du_groupe>
[...]
AlwaysGroupCheck=true
```

### Eléments d'améliorations
#### Monitoring

Instalation de NetData
```
[root@localhost ~]# dnf install epel-release -y
```
```
[root@localhost ~]# wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh
```
Lancement de NetData
```
[root@localhost ~]# systemctl start netdata

[root@localhost ~]# systemctl enable netdata
```
Ouverture du firewall
```
[root@localhost ~]# firewall-cmd --permanent --add-port=19999/tcp

[root@localhost ~]# firewall-cmd --reload
```
Pour se connecter: http://<IP_Machine>:19999

#### Accés FTP

Création d'un accés FTP réserver à l'administrateur pour ajouter des room de jeux.

```
[root@localhost ~]# dnf install vsftpd -y
```
```
[root@localhost ~]# systemctl start vsftpd

[root@localhost ~]# systemctl enable vsftpd
```
```
[root@localhost ~]# firewall-cmd --add-service=ftp --permanent --zone=public

[root@localhost ~]# firewall-cmd --reload

```
Crée ensuite un user dédier à l'utilisation du FTP (ou utiliser vôtre user qui vous sert déja d'admin).

``` 
[root@localhost ~]# adduser test

[root@localhost ~]# passwd test
```
Allez ensuite dans le fichier `/etc/vsftpd/user_list` et enlever toute les user présent dans le fichier et mettez y le vôtre.

Même manipulation dans le fichier `/etc/vsftpd/ftpusers`

Pour terminer allez dans le fichier `/etc/vsftpd/vsftpd.conf` chercher la ligne `userlist_enable=YES` et passer le `YES` en `NO`

Utiliser ensuite un client FTP (Fille Zila, WinScp etc...) pour vous connecter en protocole FTP à vôtre machine avec l'user adéquat.