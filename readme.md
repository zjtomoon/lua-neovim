# 安装

## 下载和安装neovim0.6.0

```bash
# linux
wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim-linux64.tar.gz
# macos
wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim-macos.tar.gz

tar -zxvf nvim-linux64.tar.gz -C ~/software
```

## 安装packer.nvim包管理工具

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


#cnpmjs.org
    git clone --depth 1 https://gitclone.com/github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## 安装个人配置

```bash
cd lua-neovim
mkdir -p ~/.config/nvim
cp ./* -r ~/.config/nvim
```

## 启动neovim

```bash
nvim
#安装插件
:PackerSync
```
