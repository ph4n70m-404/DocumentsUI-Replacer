# DocumentsUI-Replacer
**Stock is not fully supported because documentsui is supposed to be updated by project mainline aka google play system updates meaning it can cause weird bugs.**

# Explanation & beneits
This is a magisk module that replaces the DocumentsUI package with the LineageOS or dotOS one. DocumentsUI is the built in file manager that depending on the rom is also the only file manager. The benefits to replacing it are:
- Fixing any bugs on the native DocumentsUI package such as not being able to view zips
- Making the DocumentsUI package available on the homescreen if it isn't already
- Making the dark theme even darker with the dotOS variant

# Downloading
You can find the latest version [here](https://github.com/ph4n70m-404/DocumentsUI-Replacer/releases/latest).  
You can find the changelog [here](https://github.com/ph4n70m-404/DocumentsUI-Replacer/blob/main/changelog.md).  

# Installation
Download the zip and flash with magisk. You will be given a volume key choice, the up key being the grey dark theme(the LineageOS DocumentsUI package) and the down key being the black dark theme (the dotOS DocumentsUI package).  
You can use the config file (located in the release page and the temp directory in the zip) to preset the theme parameter and set it to custom to load a user picked DocumentsUI package however it must be called DocumentsUI.apk and must be in /sdcard/documentsui-replacer/custom. The config file itself must also be in the /sdcard/documentsui-replacer location.

# Credits
- [@topjohnwu](https://github.com/topjohnwu) - Magisk
- [@Zackptg5](https://github.com/Zackptg5) - Magisk Module Template
- [@LineageOS](https://github.com/lineageos) - The LineageOS DocumentsUI package
- [@dotOS](https://github.com/topjohnwu) - The dotOS DocumentsUI package
