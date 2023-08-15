
#!/bin/bash

##hosts下载地址
hosts_list=(
https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt
https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts
https://gitlab.com/rainmor/Adhosts-block/-/raw/master/hosts
https://raw.githubusercontent.com/rentianyu/Ad-set-hosts/master/hosts
)

#白名单
whitelist=(

)

# 黑名单
blacklist=(
lczzjj.cn
)


#定义最后的文件名
output_file="hosts"

# 拼接所有hosts文件并去重
rm -f ${output_file}
touch ${output_file}

for url in ${hosts_list[@]}
do
# 下载文件并追加到输出文件中
printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo ""
echo "正在下载${url}"
curl -# -L ${url} | awk '{sub(/^\xef\xbb\xbf/,"");print}' >> ${output_file}
done

printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo "去除白名单文件中"

# 加入白名单
for domain in ${whitelist[@]}
do
awk -v domain=${domain} '$2 != domain' ${output_file} > ${output_file}.tmp
mv ${output_file}.tmp ${output_file}
done

echo "白名单处理完成"
printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo "黑名单处理中"

for i in "${!blacklist[@]}"; do
blacklist[$i]="127.0.0.1 ${blacklist[$i]}"
done

sed -i "1s/^/$(printf '%s
' "${blacklist[@]}" | sed 's/[&/\]/\\&/g' | paste -sd '\n' -)\n/" "${output_file}"
echo "黑名单处理完成"

printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo "规范化hosts文件中"
printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo "去除Windows换行符"
# 规范化hosts文件
awk '{sub(/\r$/,"");print}' ${output_file} > ${output_file}.tmp # 去除Windows换行符
mv ${output_file}.tmp ${output_file}
echo "处理完成"
printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo "去除注释和空行"
awk '!/^#/ && NF' ${output_file} > ${output_file}.tmp # 去除注释和空行
mv ${output_file}.tmp ${output_file}
echo "完成"
printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo "改0.0.0.0为127.0. .1"
awk '{sub(/0\.0\.0\.0/,"127.0.0.1");print}' ${output_file} > ${output_file}.tmp # 将0.0.0.0改为127.0.0.1
mv ${output_file}.tmp ${output_file}
echo "完成"
printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo "改空格为tab"
awk '{$1=$1;print}' FS="[[:space:]]+" OFS="\t" ${output_file} > ${output_file}.tmp # 将多空格改为一个tab
mv ${output_file}.tmp ${output_file}
echo "完成"
printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo "去重中可能比较慢"
sort -u ${output_file} -o ${output_file} # 去重
echo "完成"
printf '-%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线
echo ""
echo "规范化hosts文件完成"
printf '#%.0s' $(seq 1 "${COLUMNS:-$(tput cols)}") # 划线

if cp -f hosts /system/etc/hosts; then
echo "正在设置hosts文件权限……"
chmod 0644 /system/etc/hosts
echo "hosts文件权限设置完成！"
echo "更新hosts文件完成！"
rm -f hosts
else
echo "更新hosts文件失败！"
echo "请手动将hosts复制到/system/etc目录"
fi 