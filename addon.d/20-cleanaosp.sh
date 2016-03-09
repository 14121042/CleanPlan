#!/sbin/sh
#
# /system/addon.d/20-cleanaosp.sh
#

. /tmp/backuptool.functions

deleteApk() {
    rm -rf /system/app/$1.apk /system/priv-app/$1.apk /system/app/$1 /system/priv-app/$1 && echo "Removed $1"
}

del_files() {
cat <<EOF
Videos
YouTube
Books
Chrome
CloudPrint2
Drive
EditorsDocs
EditorsSheets
EditorsSlides
FitnessPrebuilt
GoogleEars
GoogleEarth
GoogleHindiIME
GooglePinyinIME
KoreanIME
Maps
Music2
Newsstand
Photos
PlusOne
PrebuiltGmail
PrebuiltKeep
PrebuiltNewsWeather
Street
Hangouts
Wallet
EOF
}

if [[ "$1" == "post-restore" ]] || [[ "$1" == "" ]]; then
    del_files | while read FILE; do
        deleteApk "$FILE"
    done
fi
