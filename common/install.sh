#installing the proper documentsui package
GreyInstall() {
  echo "Installing grey dark theme"
}
BlackInstall() {
  echo "Installing black dark theme"
  cp -f $MODPATH/temp/DocumentsUI.apk $MODPATH/system/priv-app/DocumentsUI/DocumentsUI.apk
}
CustomInstall() {
  echo "Installing custom DocumentsUI package"
  if [ -e "$configfolder/DocumentsUI.apk" ]; then
    cp -f $configfolder/DocumentsUI.apk $MODPATH/system/priv-app/DocumentsUI/DocumentsUI.apk
  else
    echo "No DocumentsUI package in the valid area, falling back to volume key selection"
    VolumeSelect
  fi
}
#Volume key selection if no config
VolumeSelect() {
  echo "- Select Version -"
  echo "Choose which DocumentsUI version you want installed:"
  echo "grey dark theme is from LineageOS, black dark theme is from dotOS"
  echo "Vol+ = grey dark theme, Vol- = black dark theme"
  if chooseport; then
    echo "Grey dark theme chosen"
    GreyInstall
  else
    echo "Black dark theme chosen"
    BlackInstall
  fi
}
#look for config and check for parameters
configfolder=/sdcard/documentsui-replacer/
if [ -f "$configfolder/config.txt" ]; then
  grep -q "theme=grey" $configfolder/config.txt
  if [[ $? = 0 ]]; then
    GreyInstall
  else
    grep -q "theme=black" $configfolder/config.txt
    if [[ $? = 0 ]]; then
      BlackInstall
    else
      grep -q "theme=custom" $configfolder/config.txt
      if [[ $? = 0 ]]; then
        CustomInstall
      else
        echo "No valid option selected, falling back to volume key selection"
        VolumeSelect
      fi
    fi
  fi
else
  VolumeSelect
fi
#post install cleanup
rm -rf $MODPATH/temp
