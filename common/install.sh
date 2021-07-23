#installing the proper documentsui package
GreyInstall() {
  echo "installing grey dark theme"
}
BlackInstall() {
  echo "installing black dark theme"
  cp -f $MODPATH/temp/DocumentsUI.apk $MODPATH/system/priv-app/DocumentsUI/DocumentsUI.apk
}
CustomInstall() {
  if [ -e "$configfolder/DocumentsUI.apk" ]; then
    cp -f $configfolder/DocumentsUI.apk $MODPATH/system/priv-app/DocumentsUI/DocumentsUI.apk
  else
    echo"no documentsui package in the valid area"
  fi
}
#look for config
configfolder=/sdcard/documentsui-replacer/
if [ -f "$configfolder/config.txt" ]; then
  source $configfolder/config.txt
  if theme=grey; then
    GreyInstall
  elif theme=black; then
    BlackInstall
  elif theme=custom; then
    CustomInstall
  else
    echo"no valid option selected"
  fi
else
  #Volume key selection if no config
  echo "- Select Version -"
  echo "Choose which DocumentsUI version you want installed:"
  echo "grey dark theme is from LineageOS, black dark theme is from dotOS"
  echo "Vol+ = grey dark theme, Vol- = black dark theme"
  if chooseport; then
    echo "grey dark theme chosen"
    GreyInstall
  else
    echo "black dark theme chosen"
    BlackInstall
  fi
fi
#post install cleanup
rm -rf $MODPATH/temp
