#!/bin/bash
# 更新软件包
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
# 安装 Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin
sudo systemctl start docker

sudo curl -L "https://ghfast.top/https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-linux-armv7" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# 清理缓存
apt autoremove -y && apt autoclean && apt remove -y && apt clean
