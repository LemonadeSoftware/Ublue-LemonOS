#!/bin/bash

# Définition des chemins vers les fichiers
os_release_file="/etc/os-release"
lsb_release_file="/etc/lsb-release"
gnome_appearance_settings_schema="org.gnome.desktop.interface"
icon_resource_path="/usr/share/pixmaps"

wget https://getlemonade.org/LemonadeHosting/Assets/LemonadeFN.png -O /usr/share/pixmaps/lemonadelogo.png

# Nouveaux paramètres
new_pretty_name="LemonOS"
new_icon_name="lemonadelogo.png"
new_icon_path="$icon_resource_path/$new_icon_name"

# Sauvegarde des fichiers de configuration originaux
cp $os_release_file "$os_release_file.bak"
cp $lsb_release_file "$lsb_release_file.bak"

# Mise à jour du nom de la distribution
sed -i "s/PRETTY_NAME=.*/PRETTY_NAME=\"$new_pretty_name\"/" $os_release_file
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION=\"$new_pretty_name\"/" $lsb_release_file

# Copie de la nouvelle icône dans le répertoire des ressources
#cp "/usr/share/pixmaps/lemonadelogo.png" $new_icon_path

# Mise à jour de l'icône de la distribution dans les paramètres de GNOME
gsettings set $gnome_appearance_settings_schema logo $new_icon_path

echo "Le nom de la distribution et l'icône ont été changés avec succès."
