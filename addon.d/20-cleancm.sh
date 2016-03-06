#!/sbin/sh
#
# /system/addon.d/20-cleancm.sh
# During a CM13+ upgrade this script repatches CyanogenMod
# using the cleancm patchset.
#

. /tmp/backuptool.functions

deleteApk() {
    rm -rf /system/app/$1.apk /system/priv-app/$1.apk /system/app/$1 /system/priv-app/$1 && echo "Removed $1"
}

del_files() {
cat <<EOF
AudioFX
Browser
Calendar
Camera2
DeskClock
CyanogenSetupWizard
Eleven
Email
Screencast
Gallery2
SoundRecorder
Snap
EOF
}

if [[ "$1" == "post-restore" ]] || [[ "$1" == "" ]]; then
    del_files | while read FILE; do
        deleteApk "$FILE"
    done
fi
