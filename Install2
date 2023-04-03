#!/bin/bash

icons=("yelp.desktop" "org.gnome.Tour.desktop" "org.gnome.Calculator.desktop" "org.gnome.Software.desktop" "org.gnome.Screenshot.desktop" "gnome-system-monitor.desktop" "org.gnome.Terminal.desktop" "firefox.desktop" "org.gnome.Characters.desktop" "org.gnome.Cheese.desktop" "org.gnome.Totem.desktop" "org.gnome.Logs.desktop" "org.gnome.gedit.desktop" "org.gnome.baobab.desktop" "org.gnome.font-viewer.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.eog.desktop" "org.gnome.Nautilus.desktop" "gnome-bluetooth-panel.desktop" "gnome-network-panel.desktop" "gnome-online-accounts-panel.desktop" "gnome-notifications-panel.desktop" "gnome-applications-panel.desktop" "gnome-removable-media-panel.desktop" "gnome-lock-panel.desktop" "gnome-sharing-panel.desktop")

for icon in "${icons[@]}"
do
    if [ -f "/usr/share/applications/$icon" ]; then
        sudo rm "/usr/share/applications/$icon"
        echo "Le fichier $icon a été supprimé."
    else
        echo "Le fichier $icon n'existe pas."
    fi
done
