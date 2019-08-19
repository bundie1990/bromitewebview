 # If you are reading this you owe me $10 => https://paypal.me/innonetlife
MODDIR=${0%/*}	
# wait until boot completed
until [ `getprop sys.boot_completed`. = 1. ]; do sleep 1; done
# Bromite WebView needs to be installed as user app to prevent crashes
pm install -r $MODDIR/system/app/webview/webview.apk
# Determimes the appropriate overlay location and installs it
if [ "$(ls -d /system/product/overlay 2>/dev/null)" ]
then pm install -r $MODPATH/system/product/overlay/treble-overlay-webview.apk $MODPATH/system/product/overlay
fi
if [ "$(ls -d /vendor/overlay 2>/dev/null)" ]
then pm install -r $MODPATH/system/vendor/overlay/treble-overlay-webview.apk $MODPATH/vendor/overlay
fi
# Enable the overlay to allow our webview on incompatible ROMs
cmd overlay enable me.phh.treble.overlay.webview
# Because Google 
pm uninstall com.google.android.webview