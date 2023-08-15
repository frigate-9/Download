#!/bin/bash
echo "解决WiFi感叹号问题"
settings delete global captive_portal_http_url
settings delete global captive_portal_https_url
settings put global captive_portal_http_url "http://connectivitycheck.platform.hicloud.com/generate_204"
settings put global captive_portal_https_url "https://connectivitycheck.platform.hicloud.com/generate_204"


#ht删tp://wifi.vivo.com.cn/generate_204
 #- vivo提供的用于检测网络连接状态的地址。

#ht删tp://connect.rom.miui.com/generate_204
 #- 小米提供的用于检测网络连接状态的地址。
 
#ht删tp://connectivitycheck.platform.hicloud.com/generate_204
# - 华为提供的用于网络连接状态检测的地址。
 
 #ht删tp://captive.apple.com/hotspot-detect.html
# - 苹果提供的用于检测网络连接状态的地址。

#ht删tp://www.msftconnecttest.com/connecttest.txt
 #- 微软提供的用于检测网络连接状态的地址。

#ht删tp://www.qualcomm.cn/generate_204
 #- 高通提供的用于检测网络连接状态的地址。

#ht删tp://detectportal.firefox.com/success.txt
# - Mozilla Firefox 提供的用于检测网络连接状态的地址。
 
#ht删tp://captiveportal.konqi.cn/generate_204
# - 也可用于检测网络连接状态的地址。

#ht删tp://connectivitycheck.gstatic.com/generate_204
# - 由 Google 提供的用于检测网络连接状态的地址。

#ht删tp://www.google.com/generate_204
 #- 同样由 Google 提供的网络连接状态检测地址。






