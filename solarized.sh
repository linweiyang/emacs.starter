#!/bin/bash
# 修改为solarized的配置颜色,比较适合长时间工作
sed 's/tomorrow-bright/solarized-dark/g;s/tomorrow-day/solarized-light/g;' ~/.emacs.d/lisp/init-themes.el > init-themes.el
mv init-themes.el ~/.emacs.d/lisp/init-themes.el
