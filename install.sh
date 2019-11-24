#!/bin/bash
os=`uname -a`
macOS="Darwin"

VERSION=`(emacs --version | awk -F ' ' 'NR==1 {print $3}' | cut -b 1-4)`
echo $VERSION


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


function comment_macos() {
    sed -i "" "/$1/s/^/;;/" $2
}

function comment_linux() {
    sed -i "/$1/s/^/;;/" $2
}

# 低版本下，去掉不能用的库
if [ $(echo "$VERSION < 25.1" | bc) -eq 1 ]; then
    if [[ $os =~ $macOS ]]; then
        comment_macos "haskell" ~/.emacs.d/init.el
        comment_macos "plantuml" ~/.emacs.d/lisp/init-local.el
        comment_macos "cuda" ~/.emacs.d/lisp/init-local.el
#        sed -i "" '/cuda/s/^/;;/' ~/.emacs.d/lisp/init-local.el
    else
       comment_linux "haskell" ~/.emacs.d/init.el
       comment_linux "plantuml" ~/.emacs.d/lisp/init-local.el
       comment_linux "cuda" ~/.emacs.d/lisp/init-local.el
#       sed -i '/cuda/s/^/;;/' ~/.emacs.d/lisp/init-local.el
    fi
fi

# emacs 26.2及之前版本的gpg过期
./update_gpg.sh

# 修改为国内的镜像，提升数据
./mirror.sh

read -r -p "是否使用Solarized Dark背景? [Y/n] " input
case $input in
    ([yY][eE][sS]|[yY])
        ./solarized.sh
	;;
esac

# 下载emacs库
cd ~/.emacs.d/
./test-startup.sh


