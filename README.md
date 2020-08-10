# Emacs初学者配置文件

该Emacs配置文件是基于Purcell的Emacs配置文件基础上添加个人配置文件形成。[Purcell's emacs configuration](https://github.com/purcell/emacs.d).

## Emacs安装及配置

### 安装高版本的Emacs
1. 方法一：在Ubuntu LTS 14.04或以上，安装指令如下

    ``` shell
    sudo add-apt-repository ppa:kelleyk/emacs
    sudo apt update
    sudo apt install emacs26
    ```

2. 方法二：如果上面方法一不能正常安装，请从源代码编译安装。  
   请参考[Emacs编译安装](http://ubuntuhandbook.org/index.php/2014/10/emacs-24-4-released-install-in-ubuntu-14-04/)

### 快速安装Emacs初学者配置
* **下载emacs-starter配置文件并安装**

    ``` shell
    git clone https://github.com/linweiyang/emacs.starter
    cd emacs.starter
    ./install
    ```

<font color=#ff0000>NOTE:</font> 到此就已经安装完Emacs的文件，运行Emacs就可以直接使用。下面是安装一些个性配置。

## Emacs个性化配置

### 一、在Ubuntu下改为'Caps'键改为'Ctrl'键

- **Linux, 创建~/.Xmodmap文件:**

    ``` xmodmap
    remove Lock = Caps_Lock
    keysym Caps_Lock = Control_L
    add control = Control_L
    ```

    [方法一（推荐）]
    ``` shell
    sudo cp ~/.Xmodmap /etc/X11/xinit
    sudo vim /etc/X11/xinit/xinitrc
    ```
    复制下面内容到 xinitrc 中
    ``` conf
    usermodmap=$HOME/.Xmodmap
    sysmodmap=/etc/X11/xinit/.Xmodmap

    if [ -f $sysmomap ]; then
         xmodmap $sysmodmap
    fi

    if [ -f "$usermodmap" ]; then
        xmodmap "$usermodmap"
    fi 
    ```
    
    [方法二]
    在使用fcitx输入法框架（搜狗输入等）的Linux系统，在~/.xinputc中最后一行添加"xmodmap ~/.Xmodmap"，或用如下指令快速添加：
    ``` shell
    echo xmodmap ~/.Xmodmap >> ~/.xinputrc
    ```

* **macOS系统按照如下修改**
    
    **"System Preferences -> Keyboard -> Modifier Keys..."** 将Caps改为Ctrl。


### 二、安装google的C++语法检查工具 

* **Ubuntu下**

    ``` shell
    sudo apt-get install python-pip
    sudo pip install cpplint
    ```

* **macOS下**

    ``` shell
    pip install cpplint
    ```

### 三、Linux/Windows下安装Zeal工具（macOS下Dash在Linux的版本）

    安装Zeal工具并下载语言函数手册库：sudo apt-get install zeal
    使用方法：快捷键是 Ctrl+c D。

### 四、在Linux/macOS下，开发C/C++时用的rtags工具，该工具可以快速查找变量定义。（安装出问题的找我！）

    该工具对Clang和LLVM版本有要求，请大家安装最新版本。

* **Ubuntu下**

    ``` shell
    sudo apt-get install llvm-6.0-dev clang-6.0 libclang-6.0-dev openssl
    git clone --recursive https://github.com/Andersbakken/rtags.git
    cd rtags
    mkdir build
    cd build
    cmake ..
    make
    sudo make install
    ```
* **macOS下**

    ``` shell
    brew install llvm --with-libcxx --with-clang --without-assertions --with-rtti
    git clone --recursive https://github.com/Andersbakken/rtags.git
    cd rtags
    mkdir build
    cd build
    cmake ..
    make
    sudo make install
    ```
    如果由于Rtags更新比较快，而Emacs的Package更新比较慢，如果Emacs打开C/CPP文件，发现有如下错误时：
    ``` shell
    Debugger entered--Lisp error: (error "RTags: protocol version mismatch. This is usually caused by getting rtags.el from melpa and installing a new rtags build that modified the protocol. They need to be in sync.")
    ``` 
    说明rtags的程序版本和Emacs的库版本不对。
    请修改~/.emacs.d/epla-xxx（xxx为对应的Emacs版本号）下的rtags-yyy（yyy为rtags的时间版本）下的rtags.el文件
    ``` shell
    将74行的(defconst rtags-protocol-version 125)中的“125”改为"127"。
    ```
   rtags最新版本号，可以从rtags的CPP源代码查找出来。找不到版本号的，问我！

* **使用方法**

    在进行cmake时，用如下指令:
    ``` shell
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
    ```
    为了方便，可以在~/.bashrc或~/.zshrc的最后一行，添加cmake-rtags变量如下：
    ``` shell
    alias cmake-rtags='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
    ```
    添加完后，执行： 
    ``` shell
    source ~/.bashrc (用zsh的，请用~/.zshrc)
    ```
    这样就可以用"cmake-rtags .."命令代替"cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .."。

    对于C/C++文件，Ctrl+c r 等待三秒，右侧将出现所有的快捷键：
    ``` shell
    Ctrl+c r ,   当前变量参考
    Ctrl+c r .   当前变量定义
    Ctrl+c r /   当前变量所有参考
    ...
    ```
    

## 需要注意的事项

### Linux下安装搜狗输入法(fcitx)后，Emacs的 "Ctrl+Space" 快捷键不能切换输入法解决方法

* **Ubuntu下**
    在/etc/environment文件最后,添加如下
    ``` shell
    sudo echo LC_CTYPE="zh_CN.utf8" >> /etc/environment
    ```

    并执行如下指令

    ``` shell
    sudo locale-gen
    ```
    重启系统后即可用ctrl+space切换输入法了。

### Linux安装搜狗输入法(fcitx)后，和Emacs的"Ctrl+;"快捷键冲突的修改方法
    If your Ubuntu has installed fcitx, "Ctrl+;" shortcut will be set to "Trigger Key for Clipboard History List" by default, please disable it by following steps.

    1. $ fcitx-config-gtk3  
    2. In "Addon" -> "Clipboard" -> "Trigger Key for Clipboard History List", remove the shortcut.  

### 使用Markdown的用户，请安装markdown工具。

Emacs在markdown-mode下的预览快捷键为 C-c C-c p。

* **在Ubuntu下安装markdown指令**

    ``` shell
    sudo apt-get install markdown
    ```

* **在macOS下安装markdown指令**

    ``` shell
    brew install markdown
    ```



