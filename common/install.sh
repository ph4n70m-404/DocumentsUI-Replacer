configfolder=/sdcard/documentsui-replacer/
#installing the proper documentsui package
Install() {
  echo "Installing $theme"
  if [ -e "$MODPATH/temp/$package/DocumentsUI.apk" ]; then
    echo "Files needed found"
  elif [ -e "$configfolder/$package/DocumentsUI.apk" ]; then
    echo "Files needed found"
    cp -f $configfolder/$package $MODPATH/temp/$package
  fi
  mkdir -p $MODPATH/system/priv-app/DocumentsUI
  cp -f $MODPATH/temp/$package/* $MODPATH/system/priv-app/DocumentsUI
}
#Volume key selection if no config
VolumeSelect() {
  echo "- Select Version -"
  echo "Choose which DocumentsUI version you want installed:"
  echo "grey dark theme is from LineageOS, black dark theme is from dotOS"
  echo "Vol+ = grey dark theme, Vol- = black dark theme"
  if chooseport; then
    export theme="Grey dark theme"
    export package=lineageos
    echo "$theme chosen"
  else
    export theme="Black dark theme"
    export package=dotos
    echo "$theme chosen"
  fi
}
#check for config and check for parameters
if [ -f "$configfolder/config.txt" ]; then
  grep -q "theme=grey" $configfolder/config.txt
  if [[ $? = 0 ]]; then
    export theme="Grey dark theme"
    export package=lineageos
    echo "$theme chosen"
  else
    grep -q "theme=black" $configfolder/config.txt
    if [[ $? = 0 ]]; then
      export theme="Black dark theme"
      export package=dotos
      echo "$theme chosen"
    else
      grep -q "theme=custom" $configfolder/config.txt
      if [[ $? = 0 ]]; then
        if [ -e "$configfolder/custom/DocumentsUI.apk" ]; then
          export theme="Custom DocumentsUI"
          export package="custom"
          echo "$theme chosen"
        else
          echo "No valid option selected, falling back to volume key selection"
          VolumeSelect
        fi
      else
        VolumeSelect
      fi
    fi
  fi
else
  VolumeSelect
fi
Install
#post install cleanup
rm -rf $MODPATH/temp
