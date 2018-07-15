#!/bin/bash
# 修改为国内的镜像，加快下载emacs库的速度
sed 's/\/\/elpa.gnu.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/gnu/g;s/\/\/melpa.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/melpa/g;s/\/\/orgmode.org\/elpa/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/org/g' ~/.emacs.d/lisp/init-elpa.el > init-elpa.el
mv init-elpa.el ~/.emacs.d/lisp/init-elpa.el



