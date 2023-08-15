#!/bin/bash
echo
echo
echo "解决抖音占用问题"
rm -rf /data/data/com.ss.android.ugc.aweme/files/offlineX
touch /data/data/com.ss.android.ugc.aweme/files/offlineX

rm -rf /data/data/com.ss.android.ugc.aweme/files/effectmodel
touch /data/data/com.ss.android.ugc.aweme/files/effectmodel

rm -rf /data/data/com.ss.android.ugc.aweme/files/luckycat_gecko_root_dir
touch /data/data/com.ss.android.ugc.aweme/files/luckycat_gecko_root_dir
rm -rf /data/data/com.ss.android.ugc.aweme/files/plugins
touch /data/data/com.ss.android.ugc.aweme/files/plugins

rm -rf /data/data/com.ss.android.ugc.aweme/files/.umeng
touch /data/data/com.ss.android.ugc.aweme/files/.umeng
rm -rf /data/data/com.ss.android.ugc.aweme/files/im_resources
touch /data/data/com.ss.android.ugc.aweme/files/im_resources

rm -rf /data/data/com.ss.android.ugc.aweme/files/im_interactive_resource
touch /data/data/com.ss.android.ugc.aweme/files/im_interactive_resource

sleep 1
echo "搞定收工!"
echo
echo