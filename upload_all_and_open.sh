#!/bin/bash

function upload(){
	echo "> 正在上传: ${FILENAME}"
	url=`curl -s -F "name=@${FILENAME}" https://img.vim-cn.com/ 2>&1`
	printf "\033[32m${FILENAME}\033[0m 已上传至: \033[32m${url}\033[0m\n" && open $url
}

function start(){
	# 遍历每一个podspec文件
	echo "> 开始上传..."
	for FILENAME in *.{png,jpg,ico,gif,ico,svg,tiff,webp,pdf,mp3,mp4,zip}
	do
		if [ -r "$FILENAME" ];then 
	 		upload &
	    fi 
	done
	wait
	echo "> 全部上传完毕！"
}

start
