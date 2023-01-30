# 安装 alacritty zsh on my zsh

## install alacritty

sudo add-apt-repository ppa:aslatter/ppa
sudo apt update
sudo apt install alacritty
??设置alacritty为默认终端模拟器，配置（将alacritty.yml配置文件放在～/.config/alacritty/ 下）
双击安装字体

## install zsh
sudo apt install zsh

设置zsh为默认shell(需重启)
chsh -s /usr/bin/zsh

## install on my zsh
sh -c \
 "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

将zsh文件夹下文件放在对应位置


## 安装配置ranger
sudo apt install ranger

配置 将ranger文件夹里面的内容放至 ~/.config/ranger/ 下


## 安装配置nvim
sudo apt install neovim

配置 将nvim文件夹里面的内容放至~/.config/nvim/ 下

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

:PlugInstall
