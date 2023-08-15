#!/bin/bash	
#定义应用包目录
apkls1=/data/media/0/应用/
apkls2=/data/media/0/应用包/功能补全必装/
#去除空格
	for dir in `ls -1`				
			do
			cd $apkls1
			cd $dir      
			for file in `ls -1 | tr ' ' '#'`
    		do
            mv "`echo $file | sed 's/#/ /g'`" "`echo $file | sed 's/#//g'`"
            echo  $apkls1  
    done    
	done  &

echo "去除空格完毕"
echo ""
echo "即将开始安装"
for apklj in $(find $apkls1 -name "*.apk" -type f )
do
{
echo $apklj 
pm install -r $apklj   &
echo "极速安装中"
}   &
done 

	for dir in `ls -1`				
			do
			cd $apkls2
			cd $dir      
			for file in `ls -1 | tr ' ' '#'`
    		do
            mv "`echo $file | sed 's/#/ /g'`" "`echo $file | sed 's/#//g'`"
            echo  $apkls2  
    done    
	done  &

echo "去除空格完毕"
echo ""
echo "即将开始安装"
for apklj in $(find $apkls2 -name "*.apk" -type f )
do
{
echo $apklj 
pm install -r $apklj   &
echo "极速安装中"
}   &
done 
wait 


