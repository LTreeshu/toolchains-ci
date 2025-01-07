#!/bin/bash
XUANTIE_900_GCC="Xuantie-900-gcc-elf-newlib-x86_64-V2.8.1-20240115.tar.gz"
RISCV64_MUSLEABI_GCC="riscv64-linux-musleabi_for_x86_64-pc-linux-gnu_latest.tar.bz2"
XUANTIE_900_GCC_DOWNLOAD_PATH="https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1705395512373/Xuantie-900-gcc-elf-newlib-x86_64-V2.8.1-20240115.tar.gz"
RISCV64_MUSLEABI_GCC_DOWNLOAD_PATH="https://github.com/RT-Thread/toolchains-ci/releases/download/v1.7/riscv64-linux-musleabi_for_x86_64-pc-linux-gnu_latest.tar.bz2"

sudo apt-get update -y
sudo apt-get install -y curl git vim net-tools scons wget

git clone https://gitlink.org.cn/ltree/toolchains-ci.git

if [ -f "toolchains-ci/$XUANTIE_900_GCC" ];then
    echo "文件存在"
    sudo tar -zxvf toolchains-ci/$XUANTIE_900_GCC -C /opt
else
	wget $XUANTIE_900_GCC_DOWNLOAD_PATH
	if [ -f "$XUANTIE_900_GCC" ];then
    	sudo tar -zxvf $XUANTIE_900_GCC -C /opt
    else
    	echo "文件下载失败"
    fi
fi


if [ -f "toolchains-ci/$RISCV64_MUSLEABI_GCC" ];then
    echo "文件存在"
    sudo tar -xvf toolchains-ci/$RISCV64_MUSLEABI_GCC -C /opt
else
	wget $RISCV64_MUSLEABI_GCC_DOWNLOAD_PATH
	if [ -f "$RISCV64_MUSLEABI_GCC" ];then
    	sudo tar -xvf $RISCV64_MUSLEABI_GCC -C /opt
    else
    	echo "文件下载失败"
    fi
fi


