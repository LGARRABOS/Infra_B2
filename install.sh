#!/bin/bash

# Demander à l'utilisateur de saisir le chemin du fichier de sortie
read -p "Entrez le chemin et le nom du fichier de sortie: " log_file
echo "Attention vôtre machine vas se relancer à la fin de se script"

# Rediriger la sortie standard (stdout) et la sortie d'erreur (stderr) vers le fichier de sortie
exec > "$log_file" 2>&1

# Afficher la liste des groupes installés
dnf group list --installed

# Afficher la liste des groupes disponibles
dnf group list --available

# Installer le groupe "Workstation"
dnf group install -y "Workstation"

# Installer le groupe "Server with GUI"
dnf group install -y "Server with GUI"

# Définir le niveau de démarrage par défaut en mode graphique
systemctl set-default graphical

# Installer le paquet "epel-release"
dnf install -y epel-release

# Installer le paquet "xrdp"
dnf install -y xrdp

# Activer le service "xrdp"
systemctl enable xrdp

# Démarrer le service "xrdp"
systemctl start xrdp

# Ajouter la règle de pare-feu pour le port 3389
firewall-cmd --permanent --add-port=3389/tcp

# Recharger la configuration du pare-feu
firewall-cmd --reload

# Installer le paquet "epel-release-latest-8.noarch.rpm"
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Mettre à jour le système
dnf upgrade -y

# Installer le paquet "snapd"
dnf install -y snapd

# Permet de réactiver le service snapd après le reboot
systemctl enable snapd

# Active le service snapd
systemctl start snapd
systemctl start snapd

# Installer le paquet "citra-emu" via snap
snap install citra-emu

# Indiquer à l'utilisateur la localisation du fichier de sortie
echo "Le fichier de sortie se trouve ici: $log_file"

# Prévenir l'utilisateur que le script est terminé
echo "Le script est terminé."
reboot
