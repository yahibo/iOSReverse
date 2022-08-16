##!/bin/sh
#
##  SignApp.sh
##  inserCode
##
##  Created by hibo on 2019/10/15.
##  Copyright © 2019 hibo. All rights reserved.
#
##定义目录路径 ${SRCROOT}为当前工程的根目录
#
#目标文件路径
BUILD_APP_PATH="$BUILT_PRODUCTS_DIR/$TARGET_NAME.app"
#Info文件路径
TARGET_INFO_PLIST=$BUILD_APP_PATH/Info.plist
#定义临时目录变量，存放解.ipa后产生的临时文件
TEMP_PATH="${SRCROOT}/temp"
#tool路径
TOOL_PATH="${SRCROOT}/tool"
#定义APP资源目录变量，存放要重签名的APP
APP_PATH="${SRCROOT}/app"
#定义ipa包路径
IPA_PATH="${APP_PATH}/*.ipa"


#移除临时文件，并重新创建文件夹
rm -rf "${TEMP_PATH}"
mkdir -p "${TEMP_PATH}"



###########1、解压ipa到指定的文件下###########
unzip -o "$IPA_PATH" -d "$TEMP_PATH"
#获取临时app路径
TEMP_APP_PATH=$(set -- "$TEMP_PATH/Payload/"*.app;echo "$1")
echo ".app文件路径：$TEMP_APP_PATH"

###########2、创建en.plist权限文件###########
#Xcode中会生成权限文件，注意将生成的目标文件中的权限文件移动到TEMP_APP_PATH中
echo "目标代码路径:$BUILD_APP_PATH"
cp -rf "$BUILD_APP_PATH/embedded.mobileprovision" "$TEMP_APP_PATH/"

###########3、修改应用info.plist中的BundleId、displayName###########
#设置 "Set :KEY Value" "Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier $PRODUCT_BUNDLE_IDENTIFIER" "$TEMP_APP_PATH/Info.plist"
#获取名称并设置到目标文件中的Info.plist文件中
TARGET_DISPLAY_NAME=$(/usr/libexec/PlistBuddy -c "Print CFBundleDisplayName" "$TARGET_INFO_PLIST")
/usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName $TARGET_DISPLAY_NAME" "$TEMP_APP_PATH/Info.plist"
#删除设备支持字段
/usr/libexec/PlistBuddy -c "Delete :UISupportedDevices $TARGET_DISPLAY_NAME" "$TEMP_APP_PATH/Info.plist"
echo "plist路径：$TARGET_INFO_PLIST"
echo "显示名称：$TARGET_DISPLAY_NAME"

if [[ "$TARGET_DISPLAY_NAME" != "" ]]; then
    for file in `ls "$TEMP_APP_PATH"`;
    do
        extension="${file#*.}"
        if [[ -d "$TEMP_APP_PATH/$file" ]]; then
            if [[ "$extension" == "lproj" ]]; then
                if [[ -f "$TEMP_APP_PATH/$file/InfoPlist.strings" ]];then
                    /usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName $TARGET_DISPLAY_NAME" "$TEMP_APP_PATH/$file/InfoPlist.strings"
                fi
            fi
        fi
    done
fi


###########4、删除扩展应用及插件###########
echo "Removing PlugIns and Watch"
rm -rf "$TEMP_APP_PATH/PlugIns"
rm -rf "$TEMP_APP_PATH/Watch"
#rm -rf "$TEMP_APP_PATH/com.apple.WatchPlaceholder"


###########5、给可执行文件执行权限###########
#获取可执行文件路径
APP_BINARY=`plutil -convert xml1 -o - $TEMP_APP_PATH/Info.plist|grep -A1 Exec|tail -n1|cut -f2 -d\>|cut -f1 -d\<`
#给可执行文件权限
chmod +x "$TEMP_APP_PATH/$APP_BINARY"


###########6、重新签名Frameworks下的所有动态库###########
#获取动态库路径
APP_FRAMEWORKS_PATH="$TEMP_APP_PATH/Frameworks"
#判断文件是否存在
if [ -d "$APP_FRAMEWORKS_PATH" ]
then
#遍历所有动态库
for FRAMEWORK in "$APP_FRAMEWORKS_PATH/"*
do
echo "framework: $FRAMEWORK"
#对动态库签名 $EXPANDED_CODE_SIGN_IDENTITY xcode上的证书
/usr/bin/codesign -fs "$EXPANDED_CODE_SIGN_IDENTITY" "$FRAMEWORK"
echo "EXPANDED_CODE_SIGN_IDENTITY:$EXPANDED_CODE_SIGN_IDENTITY  FRAMEWORK:$FRAMEWORK"
done
fi

###########7、将修改后的.app移动到xcode对应的Products下###########
#BUILT_PRODUCTS_DIR xcode生成的.app包路径
#TARGET_NAME 应用名称
rm -rf "$BUILD_APP_PATH"
mkdir -p "$BUILD_APP_PATH"
cp -rf "$TEMP_APP_PATH/" "$BUILD_APP_PATH/"

###########8、注入到可执行文件中###########
if [ -d "$BUILT_PRODUCTS_DIR/HBHook.framework" ]
then
${SRCROOT}/tool/yololib "$BUILD_APP_PATH/$APP_BINARY" "Frameworks/HBHook.framework/HBHook"
else
echo "没有该文件"
fi
