##########################################################################################
#
# MMT 扩展配置脚本
#
##########################################################################################

##########################################################################################
# 配置标识
##########################################################################################

# 取消注释并将“MINAPI”和“MAXAPI”更改为您的模组的最低和最高安卓版本
# 如果您希望将libs安装到vendor的8.0以上和任何较旧的系统，请取消注释 DYNLIB
# 如果您想要完整的调试日志（保存到 /sdcard），请取消注释 DEBUG
# MINAPI=21
# MAXAPI=25
# DYNLIB=true
# DEBUG=true

##########################################################################################
# 替换列表
##########################################################################################

# 列出系统中所有要直接替换的目录
# 按以下格式构建您的列表
# 举个替换的例子
REPLACE_EXAMPLE="
/system/app/aftwd
/system/priv-app/Shell/Shell.apk
/system/system_ext/usr
/system/vendor/lib/soundfx
"

# 替换掉原始APP
REPLACE="
/system/product/app/Calendar
/system/product/app/Camera2
/system/product/app/Desklock
/system/product/app/ExactCalculator
/system/product/app/Jelly
/system/product/app/LatinIME
/system/product/app/messaging
/system/product/app/webview
/system/product/app/Recorder
/system/product/app/Gallery2
/system/product/priv-app/Dialer
/system/product/priv-app/Contacts
"

##########################################################################################
# 设置权限
##########################################################################################

set_permissions() {
  : # 如果要添加这个功能请删除#

  # 请注意，magisk 模块目录中的所有文件/文件夹都有 $MODPATH 前缀 - 将此前缀保留在所有文件/文件夹中
  # 一些例子:
  
  # 对于目录（包括其中的文件）：
  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  
set_perm_recursive $MODPATH/system/app 0 0 0755 0644
set_perm_recursive $MODPATH/system/ppriv-app 0 0 0755 0644
set_perm_recursive $MODPATH/system/etc 0 0 0755 0644
set_perm_recursive $MODPATH/system/framework 0 0 0755 0644
set_perm_recursive $MODPATH/system/lib64 0 0 0755 0644

  # 对于文件 (不在上面处理的目录中)
  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm $MODPATH/system/lib/libart.so 0 0 0644
  # set_perm /data/local/tmp/file.txt 0 0 644
}

##########################################################################################
# MMT 扩展逻辑 - 在此之后不要修改任何内容
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
