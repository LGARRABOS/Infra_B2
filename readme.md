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

## Instalation de vôtre environement

- Télécharger les deux scipts trouvable dans Install.
    Lancer le script "install.sh"
    Une fois la machine relancer lancer le deuxiéme script

### Eléments suplémentaire 

Se premier script vous permet d'installer Fail2Ban netdata ainsi vsftpd.
- Fail2Ban:
    Renforce la sécuritée des résaux de communication avec l'extérieur (vsftpd et ssh)

    Vous pouvez ajuster la configuration selon vos besoin en allant dans "/etc/fail2ban/jail.conf" pensez ensuite à redémarer le service avec "systemctl restart fail2ban.service"

- netdata:
    netdata est une solution de monitoring accesible en local sur vôtre navigateur web "http://<IP_Machine>:19999"

- vsftpd:
    Il s'agit d'un serveur FTP permetant d'accéder et de manipuler facilement des fichier/dossier sur vôtre machine.

    Il est utile si vous voulez mettre facilement à disposition des roms à vos utilisateurs.

    Pour améliorer la sécuritée de vos accés FTP vous pouvez effectuer la manip suivante:

        Crée ensuite un user dédier à l'utilisation du FTP (ou utiliser vôtre user qui vous sert déja d'admin).

        ``` 
        [root@localhost ~]# adduser test

        [root@localhost ~]# passwd test
        ```

        Allez ensuite dans le fichier `/etc/vsftpd/user_list` et enlever toute les user présent dans le fichier et mettez y le vôtre.

        Même manipulation dans le fichier `/etc/vsftpd/ftpusers`

        Pour terminer allez dans le fichier `/etc/vsftpd/vsftpd.conf` chercher la ligne `userlist_enable=YES` et passer le `YES` en `NO`

        Utiliser ensuite un client FTP (Fille Zila, WinScp etc...) pour vous connecter en protocole FTP à vôtre machine avec l'user adéquat.  


### Securisation des accés

#### Désactiver Root sur xrdp

```
[root@localhost ~]# vim /etc/xrdp/sesman.ini

[Security]
AllowRootLogin=false
```

#### Désactiver Root en ssh

```
[root@localhost ~]# vim /etc/ssh/sshd_config

PermitRootLogin No
```

```
[root@localhost ~]# systemctl restart sshd
```

#### Paramétrer les utilisateurs qui aurront accés au Shadow

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
