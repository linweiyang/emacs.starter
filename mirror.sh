#!/bin/bash
os=`uname -a`
macOS="Darwin"

elpa="elpa.gnu.org\/packages"
tuna_elpa="mirrors.tuna.tsinghua.edu.cn\/elpa\/gnu"

melpa="melpa.org\/packages"
tuna_melpa="mirrors.tuna.tsinghua.edu.cn\/elpa\/melpa"

orgmode="orgmode.org\/elpa"
tuna_orgmode="mirrors.tuna.tsinghua.edu.cn\/elpa\/org"

# 修改为国内的镜像，加快下载emacs库的速度
if [[ $os =~ $macOS ]];then
    echo $macOS
    sed -i "" "s/$elpa/$tuna_elpa/g;s/$melpa/$tuna_melpa/g;s/$orgmode/$tuna_orgmode/g" `grep -rlE "$elpa|$melpa|orgmode" ~/.emacs.d`
#   sed -i "" 's/\/\/elpa.gnu.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/gnu/g;s/\/\/melpa.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/melpa/g;s/\/\/orgmode.org\/elpa/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/org/g' `grep -rlE "$elpa_packages|$melpa_packages|$orgmode" ~/.emacs.d`
 
    grep -rlE "$elpa|$melpa|$orgmode" ~/.emacs.d

else
    echo $os
    sed -i "s/$elpa/$tuna_elpa/g;s/$melpa/$tuna_melpa/g;s/$orgmode/$tuna_orgmode/g" `grep -rlE "$elpa|$melpa|orgmode" ~/.emacs.d`
#    sed -i 's/\/\/elpa.gnu.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/gnu/g;s/\/\/melpa.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/melpa/g;s/\/\/orgmode.org\/elpa/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/org/g' `grep -rlE "$elpa_packages|$melpa_packages|$orgmode" ~/.emacs.d`
    grep -rlE "$elpa|$melpa|$orgmode" ~/.emacs.d
fi
