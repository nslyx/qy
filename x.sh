#!/bin/bash

DIR=$(cd `dirname $0`;pwd)
TAR=~

# 补充 yum 源
yum install -y epel-release
# 安装基础功能
yum install -y git wget expect screen net-tools openssh-server rsync vim

t=`date "+%m%d%H"`
# 进入脚本目录
cd $DIR

# 设置 .vimrc
if [ -f '.vimrc' ]; then
    if [ -f "${TAR}/.vimrc" ]; then
        mv ${TAR}/.vimrc ${TAR}/.vimrc_bak_${t}
    fi
    cp -f .vimrc ${TAR}/.vimrc
fi

# 修改 .bashrc
if [ -f '.bashrc' ]; then
    if [ -f "${TAR}/.bashrc" ]; then
        mv ${TAR}/.bashrc ${TAR}/.bashrc_bak_${t}
    fi
    cp -f .bashrc ${TAR}/.bashrc
    source ${TAR}/.bashrc
fi
