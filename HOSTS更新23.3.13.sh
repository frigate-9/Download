#可以在38行添加hosts
echo ""
echo ""
echo "•••••••••••••••••••••••••••••••"
echo "••       BusyBox检测:        ••"
echo "••                by:q14060  ••"
echo "•••••••••••••••••••••••••••••••"
if vconfig 2>&1 | grep BusyBox; then
echo "•••••••••••••••••••••••••••••••"
echo "••   本机已经安装BusyBox     ••"
echo "•••••••••••••••••••••••••••••••"
mydir=`pwd`
VAR='yh.sh'
cat > ${VAR} <<- 'EOF'
	#优化
#rm -rf download.sh  #删除
mydir=`pwd`
cd myhosts    
echo " "
echo "……………正在合并所有文件………………"
find -name "*.temp" -exec 'cat' {} \; > hosts.temp_1
echo "……………合并文件完成………………"
echo " "
echo "……………正在删除临时文件………………"
rm -rf *.temp
echo "……………删除临时文件完成………………"
echo " "
echo "……………去带#的行……………………"
sed -i '/^\#/d' hosts.temp_1 # 去带#的行
echo "……………文件处理完成………………"
echo " "
echo "……………规范文件0.0.0.0改127……………………"
echo " "
echo "…sed -i “s/查找字段/替换字段/g” ​​grep 查找字段 -rl 路径​​"
sed -i "s/0.0.0.0/127.0.0.1/g" `grep 0.0.0.0 -rl hosts.temp_1`
echo "……………规范文件去除空格……………………"
sed -e 's/[[:space:]][[:space:]]*/ /g' hosts.temp_1 > hosts.temp_2

echo "……………文件处理完成………………"
echo " "
#手动加入的hosts
cat >>./hosts.temp_2 <<EOFS

127.0.0.1 arm.lczzjj.cn





EOFS
echo "……………正在去除重复文件………………"
sort hosts.temp_2 |uniq > hosts 
#去重
echo "……………文件去重完成………………"
echo " "
echo "……………正在删除临时文件………………"
rm -rf *.temp_1
rm -rf *.temp_2
echo "……………删除临时文件完成………………"

echo "                            "
echo "……………调整/system/etc权限………………"
mount -o rw,remount -t auto /
#mount -o remount,rw /system/etc
echo "……………权限处理完成………………"
echo "                            "
echo "……………正在复制文件……………………………"
rm -rf /system/etc/hosts
cp -af hosts /system/etc/hosts
echo "……………文件处已经复制到/system/etc/hosts………………"
echo "                            "
echo "……………正在设置权限……………………………"
cd /system/etc/
chmod 644 hosts
echo "                            "
echo "……………权限设置完成……………………………"
#	cd $(dirname $0)#脚本所在位置
cd $mydir
exit 0
EOF








VAR='xtz.sh'
cat > ${VAR} <<- 'EOF'
#小兔子
echo ""
echo " ══════════════════════════  "
echo "║　　　　◢▅▅◣　◢▅▅◣　　　　║  "
echo "║　　　　█◤◥█　█◤◥█　　　　║  "
echo "║　　　　▋　█　▋　█　　　　║  "
echo "║　　　　▋│ █　▋ │█　　　　║  "
echo "║　　　　▋│ █　▋ │█　　　　║  "
echo "║　　　　▋│ █　▋ │█　　　　║  "
echo "║　   ◢▆◣◢▆◣█　▊　█　　　　║  "
echo "║   　█◆██◆█◥█◤　 █　　　　║  "
echo "║　   ◥▆◤◥▆◤　　 　▊　　 　║  "
echo "║　　▊　　◢▇◣　◢▇◣  ▋　  　║  "
echo "║　　▋　　◤ ◥　◤ ◥　▊　  　║  "
echo "║　　▊　　　 　   　▊　  　║  "
echo "║　　▊　   　●　  　▊　　  ║  "
echo "║　　◥　　　　　　　█◢█◣   ║  "
echo "║　　　◥▇▆▅▄▄▄▅▆▇▇◤　╳ ▊   ║  "
echo "║　◢████　▊　  　▊　▊ ◢◤   ║  "
echo "║　▊　██ ●◥▅▅▅▅▅▅◤●██◤　   ║  "
echo "║　◥█◤　  　　⊙　　　◥◣　　║  "
echo "║　◢◤  　     ⊙       ◥◣   ║  "
echo "║　██▇▇▆▆▆▆▄▄▄▄▄▆▆▆▆▇▇██　 ║  "
echo "║　　　▊　▊　　　▊　▊　　  ║  "
echo "║　　　◥▄▄◤　　　◥▄▄◤　　  ║  "
echo "╚══════════════════════════╝  "
    exit 0
rm -rf myhosts
EOF
	
VAR='download.sh'
	#创建下载脚本
cat > ${VAR} <<- 'EOF'
echo "      "
echo "      "
echo "•••••••••••••••••••••••••••••••"
echo "••    正在下载hosts文件      ••"
echo "•••••••••••••••••••••••••••••••"
rm -rf myhosts2
#下载流程
mkdir -p myhosts
mydir=`pwd`
i=1
while read line
do
{
    if [ -n "$line" ]
    then
        cd $mydir
        url=$(echo "$line" | tr -d '\r')
        cd myhosts    
        a=$((i++)) 
       
        echo "••••••••••••••••••正在下载第 $((a)) 个文件••••••••••••••••••"
        
        wget -O $a.temp  `echo $url`
      
    fi
}
done < $1
EOF

VAR='url.info'
#更新地址配置
cat > ${VAR} <<- 'EOF'


https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts

https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt



https://cdn.jsdelivr.net/gh/VeleSila/yhosts/hosts

https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts

https://gitlab.com/rainmor/Adhosts-block/-/raw/master/hosts
https://raw.githubusercontent.com/rentianyu/Ad-set-hosts/master/hosts
EOF

	


#sh download.sh url.txt


echo " 请选择将要进行的操作 "
choices=('更新hosts' '还原系统hosts' '更新源地址后更新hosts' '结束脚本')
select choice in "${choices[@]}"; do
	[[ -n $choice ]] || {
		echo "输入有误请重新输入." >&2
		continue
	}
	case $choice in
	更新hosts)
		echo "更新hosts…………..."
		

	sh download.sh url.info
	sh yh.sh
	rm -rf download.sh  #删除
	rm -rf url.info
 sh xtz.sh
 rm -rf xtz.sh
rm -rf myhosts
rm -rf yh.sh
exit 0

		
		;;
	还原系统hosts)
	cd /system/etc/
		
		echo "•••••••••••••••••••••••••••••••"
echo "••        hosts还原          ••"
echo "•••••••••••••••••••••••••••••••"
echo "                            "
#这里用>替换已有内容，用>>追加写入
echo -e "127.0.0.1 localhost\n::1 localhost\n" > hosts
echo "……………调整/system/etc权限………………"
mount -o rw,remount -t auto /
#mount -o remount,rw /system/etc
echo "……………权限处理完成………………"
echo "                            "
echo "……………正在复制文件……………………………"
rm -rf /system/etc/hosts
cp -af hosts /system/etc/hosts
echo "……………文件处已经复制到/system/etc/hosts………………"
echo "                            "
echo "……………正在设置权限……………………………"
cd /system/etc/
chmod 644 hosts
echo "                           "
echo "……………权限设置完成……………………………"
#dirname $0获取当前脚本所在的绝对目录
#cd $(dirname $0)

cd $mydir
sh xtz.sh
rm -rf hosts
rm -rf myhosts
   
	rm -rf download.sh  #删除
	rm -rf url.info
	rm -rf xtz.sh
	rm -rf yh.sh
exit 0

		;;
	更新源地址后更新hosts)
	


	echo "•••••••••••••••••••••••••••••••"
	echo "••        源地址更新          ••"
	echo "•••••••••••••••••••••••••••••••"
	url="https://img.fengfan.win/blogimg/hostsurl.info"
	wget -O url.info $(echo $url)
	
	sh download.sh url.info
	sh yh.sh
	rm -rf download.sh  #删除
	rm -rf url.info
 sh xtz.sh
 rm -rf xtz.sh
rm -rf myhosts
rm -rf yh.sh
exit 0

	
	
	
	
	
		;;
	结束脚本)
		echo "结束脚本 "
	rm -rf myhosts
   
	rm -rf download.sh  #删除
	rm -rf url.info
	rm -rf xtz.sh
	rm -rf yh.sh
	
	
		exit 0
		;;
	tt) ;;
	esac
	break
done
rm -rf myhosts
   
	rm -rf download.sh  #删除
	rm -rf url.info
	rm -rf xtz.sh
	rm -rf yh.sh
	exit 0

	
exit 0











else
echo "•••••••••••••••••••••••••••••••"
echo "••    本机未安装BusyBox      ••"
echo "••   请安装BusyBox后使用     ••"
echo "•••••••••••••••••••••••••••••••"
    #sh xtz.sh
    exit 0
fi

exit 0