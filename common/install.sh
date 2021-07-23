#look for conig
configfolder=/sdcard/documentsui-replacer/
if [ -f "$configfolder/config.txt" ]; then
  source $configfolder/config.txt
else
  #Volume key selection if no config
  echo "- Select Version -"
  echo "Choose which DocumentsUI version you want installed:"
  echo "grey dark theme is from LineageOS, black dark theme is from dotOS"
  echo "Vol+ = grey dark theme, Vol- = black dark theme"
  if chooseport; then
    echo "grey dark theme chosen"
    theme=grey
  else
    echo "black dark theme chosen"
    theme=black
  fi
fi
#Check the defined settings and install the proper documentsui package
if theme=black; then
  echo "installing black dark theme"
  cp -f $MODPATH/temp/DocumentsUI.apk $MODPATH/system/priv-app/DocumentsUI/DocumentsUI.apk
else
  if theme=grey; then
    echo "installing grey dark theme"
  else
    if theme=custom; then
      if [ -e "$configfolder/DocumentsUI.apk" ]; then
        cp -f $configfolder/DocumentsUI.apk $MODPATH/system/priv-app/DocumentsUI/DocumentsUI.apk
      else
        echo"no documentsui package in the valid area"
        else
        echo"no valid option selected"
      fi
    fi
  fi
fi
rm -rf $MODPATH/temp
