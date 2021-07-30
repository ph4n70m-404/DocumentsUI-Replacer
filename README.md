# DocumentsUI-Replacer
**Stock is not fully supported because documentsui is supposed to be updated by project mainline aka google play system updates meaning it can cause weird bugs.**

# Explanation & beneits
This is a magisk module that replaces the DocumentsUI package with the LineageOS or dotOS one. DocumentsUI is the built in file manager that depending on the rom is also the only file manager. The benefits to replacing it are:
- Fixing any bugs on the native DocumentsUI package such as not being able to view zips
- Making the DocumentsUI package available on the homescreen if it isn't already
- Making the dark theme even darker with the dotOS variant

# Installation
Download the zip and flash with magisk. You will be given a volume key choice, the up key being the grey dark theme(the LineageOS DocumentsUI package) and the down key being the black dark theme (the dotOS DocumentsUI package).  
You can use the config file (located in the release page and the temp directory in the zip) to preset the theme parameter and set it to custom to load a user picked DocumentsUI package however it must be called DocumentsUI.apk and must be in /sdcard/documentsui-replacer/custom. The config file itself must also be in the /sdcard/documentsui-replacer location.

# Credits
- [@topjohnwu](https://github.com/topjohnwu) - Magisk
- [@Zackptg5](https://github.com/Zackptg5) - Magisk Module Template
- [@LineageOS](https://github.com/lineageos) - The LineageOS DocumentsUI package
- [@dotOS](https://github.com/topjohnwu) - The dotOS DocumentsUI package

# Changelog
- **v2.3**  
Cleaned up the code a bit  
Redid the installation code  
Added the ability to download the packages online in case they get removed from the zip  
Custom DocumentsUI packages now have to be placed in /sdcard/documentsui-replacer/custom  
- **v2.2**  
Fixed config not working  
New config  
Old config doesn't work with the new version  
Cleaned up the code a bit more  
Made it so that if the config fails it takes you to the volume selection menu  
- **v2.1**  
Added support for a config file  
Implemented the ability to use a user picked DocumentsUI that can only be set with the config file  
Cleaned up the code a bit, deleted unused files  
- **v2**  
Implemented the volume key decision between themes  
Pulled DocumentsUI packages from official LineageOS 18.1 and dotOS 5.1.2 builds
- **v1**  
Original release  
Pulled DocumentsUI package from an AICP build (AICP uses their DocumentsUI from LineageOS apparently)
