#!/bin/bash

如果是armbian系统，删除armbian源
cd /etc/apt/sources.list.d/
cp armbian.list armbian.list.bak
rm armbian.list

添加moOde-player源
wget https://dl.cloudsmith.io/public/moodeaudio/m8y/setup.deb.sh
chmod +x setup.deb.sh
./setup.deb.sh
rm setup.deb.sh

# 添加upmpdcli源
# 添加秘钥
cd /usr/share/keyrings
wget https://www.lesbonscomptes.com/pages/lesbonscomptes.gpg

# 添加raspberrypi源
cd /usr/share/keyrings
wget https://archive.raspberrypi.org/debian/raspberrypi.gpg.key
# 添加源列表
cd /etc/apt/sources.list.d
wget -r -np -nH https://github.com/hy5528/build-Openwrt-Armbian/tree/main/sources

# 更新软件包
apt update
sudo apt-get install -y libbluetooth-dev
# 安装moode 9.4.0
wget https://dl.cloudsmith.io/public/moodeaudio/m8y/deb/raspbian/pool/bookworm/main/m/mo/moode-player_9.4.2-1moode1/moode-player_9.4.2-1moode1_all.deb
sudo dpkg -i ./moode-player_9.4.2-1moode1_all.deb
sudo apt --fix-broken install -y



# 清理缓存
apt autoremove -y && apt autoclean && apt remove -y && apt clean

