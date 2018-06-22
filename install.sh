#!/bin/bash

# 删除文件
if [ ! -d "~/.emacs.d" ];then
    rm -rf ~/.emacs.d
    echo "remove ~/.emacs.d"
fi

# 下载purcell的emacs配置文件
git clone https://github.com/purcell/emacs.d ~/.emacs.d

# 安装emacs的配置文件
cp src/init-local.el ~/.emacs.d/lisp/
cp -r src/wylin-emacs ~/.emacs.d/lisp/

# 修改为国内的镜像，提升数据
sed 's/\/\/elpa.gnu.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/gnu/g;s/\/\/melpa.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/melpa/g;s/\/\/orgmode.org\/elpa/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/org/g' ~/.emacs.d/lisp/init-elpa.el > init-elpa.el
mv init-elpa.el ~/.emacs.d/lisp/init-elpa.el
cd ~/.emacs.d/
./test-startup.sh


