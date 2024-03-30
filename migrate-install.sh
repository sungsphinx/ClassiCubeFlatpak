#!/bin/bash
if command -v kdialog > /dev/null;
then
   mkdir -p ~/.cache/classicube-migrate-install && mkdir -p ~/.var/app/net.classicube.flatpak.client/data && \cp -r ~/.var/app/net.classicube.ClassiCube/data/ClassiCube/ ~/.var/app/net.classicube.flatpak.client/data 2> ~/.cache/classicube-migrate-install/output.log
   if [ $? -eq 0 ]; then
     echo "Successfully migrated data from old Flatpak install"
     kdialog --title "Migration Script" --msgbox "Successfully migrated data from old Flatpak install"
   else
     echo "Failed to migrate data from your old ClassiCube Flatpak install."
     kdialog --title "Migration Script" --detailederror "Failed to migrate data from your old ClassiCube Flatpak install." "$(cat ~/.cache/classicube-migrate-install/output.log)\n\nPlease verify this is not an error with the script (e.g. different directory name, directory not existing because it was removed, these are not issues with the script)"
   fi
else
   echo "KDialog not found, trying Zenity next."
   if command -v zenity > /dev/null;
   then
   mkdir -p ~/.cache/classicube-migrate-install && mkdir -p ~/.var/app/net.classicube.flatpak.client/data && \cp -r ~/.var/app/net.classicube.ClassiCube/data/ClassiCube/ ~/.var/app/net.classicube.flatpak.client/data 2> ~/.cache/classicube-migrate-install/output.log
      if [ $? -eq 0 ]; then
        echo "Successfully migrated data from old Flatpak install"
        zenity --info --title "Migration Script" --text "Successfully migrated data from old Flatpak install"
      else
        echo "Failed to migrate data from your old ClassiCube Flatpak install."
        zenity --error --title "Migration Script" --text "Failed to migrate data from your old ClassiCube Flatpak install, error log(s) will be shown after you click OK."
        zenity --error --title "Migration Script" --text "$(cat ~/.cache/classicube-migrate-install/output.log)"
      fi
   else
     echo "Zenity not found, continuing with CLI."
     mkdir -p ~/.var/app/net.classicube.flatpak.client/data && \cp -r ~/.var/app/net.classicube.ClassiCube/data/ClassiCube/ ~/.var/app/net.classicube.flatpak.client/data/
     if [ $? -eq 0 ]; then
        read -s -p "Successfully migrated data from your old ClassiCube Flatpak install, press enter to continue…" && echo ""
     else
        read -s -p "Failed to migrate data from your old ClassiCube Flatpak install, press enter to continue…" && echo ""
     fi
   fi
fi
