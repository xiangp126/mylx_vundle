#!/bin/bash
# Copyright by Peng, 2017. xiangp126@sjtu.edu.cn.
# sudo ln -s /bin/bash /bin/sh, make sure sh linked to bash.
# > ll /bin/sh lrwxrwxrwx 1 root root 9 Dec  7 01:00 /bin/sh -> /bin/bash*

# basic parameters set.
baseDir=haha
bkDir=.vim
bkPostfix=old
# absolute file path.
abPath=${baseDir}/${bkDir}

cat << _EOF
------------------------------------------------------
Backup Original Files First ...
------------------------------------------------------
_EOF
echo mv ${abPath} ${abPath}.old
mv ${abPath} ${abPath}.old 2>/dev/null

echo sh autoHandle.sh backup
sh autoHandle.sh backup

echo git clone https://github.com/VundleVim/Vundle.vim.git ${abPath}/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ${abPath}/bundle/Vundle.vim

echo Replacing Current ${abPath}/.vimrc with standard version ...
cp ./confirm/_.vimrc ${baseDir}/.vimrc

cat << _EOF
------------------------------------------------------
Please open a vim and excute command
    :source ${abPath}/.vimrc
    :PluginInstall

Brief help
    :PluginList       - lists configured plugins
    :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    :PluginSearch foo - searches for foo; append `!` to refresh local cache
    :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
_EOF
