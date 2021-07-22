#Volume key selection
 echo "                         - Select Version -                         "
 echo "         Choose which DocumentsUI version you want installed:       "
 echo "   grey dark theme is from LineageOS, black dark theme is from dotOS"
 echo "            Vol+ = grey dark theme, Vol- = black dark theme         "
if chooseport 5; then
  echo "grey dark theme chosen"
rm -rf $MODPATH/temp
else
  echo "black dark theme chosen"
cp -f $MODPATH/temp/DocumentsUI.apk $MODPATH/system/priv-app/DocumentsUI/DocumentsUI.apk
rm -rf $MODPATH/temp
fi

