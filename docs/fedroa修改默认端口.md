# fedora修改默认端口

## 第一步：备份当前ssh设置

```bash
date_format=`date +%Y_%m_%d:%H:%M:%S`
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$date_format
# 确认
$ ls /etc/ssh/sshd_config*
/etc/ssh/sshd_config  /etc/ssh/sshd_config_2019_09_05:21:40:10
```

## 第二步:修改ssh服务端口

```bash
# 推荐在/etc/ssh/sshd_config.d/下新建配置文件
su
vim /etc/ssh/sshd_config.d/sshd_config.conf
#添加
Port=2222
```

## 第三步:在selinux允许新的ssh端口

```bash
$ semanage port -l | grep ssh
# 结果
ssh_port_t                     tcp      22
# 添加新端口到selinux
sudo semanage port -a -t ssh_port_t -p tcp 2222
# 结果
$ semanage port -l | grep ssh
ssh_port_t                     tcp      2222, 22
```

## 第四步：在防火墙上开启新的ssh端口(关键步骤)

```bash
sudo firewall-cmd --add-port=2222/tcp --permanent

sudo firewall-cmd --reload
```

+ 安装防火墙

```bash
sudo yum -y install firewalld
sudo systemctl enable --now firewalld
sudo firewall-cmd --add-port=33000/tcp --permanent
sudo firewall-cmd --reload
```

## 第五步：重启sshd服务

```bash
sudo systemctl restart sshd
```


