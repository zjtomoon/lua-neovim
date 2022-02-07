# vim-plug/packer.nvim插件管理器加速

## 方法一：修改文件使用国内镜像

```bash
# 修改原来的 https://github.com/    
https://github.com.cnpmjs.org/    
https://gitcode.net/mirrors/
```

## 方法二：修改~/.gitconfig

```bash
[url "git@git.zhlh6.cn:"]      insteadof=git@github.com:[url "https://github.com.cnpmjs.org/"]      insteadof=https://github.com/
```

## 方法三：使用fastgithub后台服务

```bash
mkdir download # ~/downloadcd ~/download
wget https://github.com/zjtomoon/vim-config/releases/download/v1.0.0/linux-x64.zipunzip linux-x64.zip
#macos
wget https://github.com/zjtomoon/vim-config/releases/download/v1.0.0/osx-x64.zip
#windows
wget https://github.com/zjtomoon/vim-config/releases/download/v1.0.0/win10-x64.zip
mv linux-x64 ~/software
```

- 安装教程
  
  > 执行`./FastGithub`
  > 
  > 手工添加127.0.0.1做为/etc/resolv.conf的第一条记录
  > 
  > 手工安装CACert/FastGithub.cer到受信任的根证书颁发机构

- 安装CA证书

```bash
cd CACert/
# ubuntu
sudo cp FastGithub.cer /usr/local/share/ca-certificates/sudo update-ca-certificates
# centos
sudo cp FastGithub.cer /etc/pki/ca-trust/source/anchors/sudo update-ca-trust
#如果没有该命令
yum install ca-certificates
update-ca-trust force-enable
```

- ssh占用22端口的问题

```bash
sudo vim /etc/ssh/sshd_config#port 22 port 2222
```

- udp 53端口占用的问题

```bash
sudo vim /etc/services
# 删除53端口并重启服务
sudo systemctl restart network-manager.service
#查看53端口进程
sudo lsof -i:53
# 关键步骤 
sudo systemctl disable systemd-resolved.service 
sudo systemctl stop systemd-resolved.service
```

- 遇到SSL certificate problem

```bash
git config --global http.sslverify false
```

- 启动

```bash
sudo ./FastGithub start
```

- Couldn’t find a valid ICU package installed on the system错误

```bash
# centos
sudo yum install libicu libicu-devel libunwind
#ubuntusudo apt-get install libicu-dev
```
