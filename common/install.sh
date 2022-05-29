configfolder=/sdcard/documentsui-replacer/

#installing the proper documentsui package
INSTALL() {
  echo "Installing $THEME"
  if [ -e "$MODPATH/temp/$PACKAGE/DocumentsUI-$ANDROIDVERSION.apk" ]; then
    echo "Files needed found"
    mv $MODPATH/temp/$PACKAGE/DocumentsUI-$ANDROIDVERSION.apk $MODPATH/temp/$PACKAGE/DocumentsUI.apk
    rm $MODPATH/temp/$PACKAGE/DocumentsUI-11.apk $MODPATH/temp/$PACKAGE/DocumentsUI-12_1.apk
  elif [ -e "$configfolder/$PACKAGE/DocumentsUI.apk" ]; then
    echo "Files needed found"
    cp -f -r $configfolder/$PACKAGE $MODPATH/temp/$PACKAGE
  else
    echo "Files missing"
    exit 1
  fi
  mkdir -p $MODPATH/system/priv-app/DocumentsUI
  cp -f -r $MODPATH/temp/$PACKAGE/* $MODPATH/system/priv-app/DocumentsUI
}

#Volume key selection if no config
VOLUMESELECT() {
  echo "- Select Version -"
  echo "Choose which DocumentsUI version you want installed:"
  echo "grey dark theme is from LineageOS, black dark theme is from dotOS"
  echo "Vol+ = grey dark theme, Vol- = black dark theme"
  if chooseport; then
    export THEME='Grey dark theme'
    export PACKAGE='lineageos'
    echo "$THEME chosen"
  else
    export THEME='Black dark theme'
    export PACKAGE='dotos'
    echo "$THEME chosen"
  fi
}

#check for config and check for parameters
CONFIGCHECK() {
  if [ -f "$configfolder/config.txt" ]; then
    grep -q "theme=grey" $configfolder/config.txt
    if [[ $? = 0 ]]; then
      export THEME='Grey dark theme'
      export PACKAGE='lineageos'
      echo "$THEME chosen"
    else
      grep -q "theme=black" $configfolder/config.txt
      if [[ $? = 0 ]]; then
        export THEME='Black dark theme'
        export PACKAGE='dotos'
        echo "$THEME chosen"
      else
        grep -q "theme=custom" $configfolder/config.txt
        if [[ $? = 0 ]]; then
          if [ -e "$configfolder/custom/DocumentsUI.apk" ]; then
            export THEME='Custom DocumentsUI'
            export PACKAGE='custom'
            echo "$THEME chosen"
          else
            echo "No valid option selected, falling back to volume key selection"
            VOLUMESELECT
          fi
        else
          VOLUMESELECT
        fi
      fi
    fi
  else
    VOLUMESELECT
  fi
}

#check android version
grep -q "ro.system.build.version.sdk=32" /system/build.prop
if [[ $? = 0 ]]; then
  export ANDROIDVERSION='12_1'
  export THEME='Grey dark theme'
  export PACKAGE='lineageos'
  echo "Black dark theme, assuming grey dark theme"
else
  grep -q "ro.system.build.version.sdk=30" /system/build.prop
  if [[ $? = 0 ]]; then
    export ANDROIDVERSION='11'
    CONFIGCHECK
  else
    echo "This does not work with your android version"
    exit 1
  fi
fi
INSTALL

#post install cleanup
rm -rf $MODPATH/temp
