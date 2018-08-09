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

### 在Ubuntu下改为'Caps'键改为'Ctrl'键

- **Linux, 创建~/.Xmodmap文件:**

    ``` xmodmap
    remove Lock = Caps_Lock
    keysym Caps_Lock = Control_L
    add control = Control_L
    ```

    在使用fcitx输入法框架（搜狗输入等）的Linux系统，在~/.xinputc中最后一行添加"xmodmap ~/.Xmodmap"。

* **macOS系统按照如下修改**
    
    **"System Preferences -> Keyboard -> Modifier Keys..."** to change Caps to beb Ctrl.


### 安装google的C++语法检查工具 

* **Ubuntu下**

    ``` shell
    sudo apt-get install python-pip
    sudo pip install cpplint
    ```

* **macOS下**

    ``` shell
    pip install cpplint
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



