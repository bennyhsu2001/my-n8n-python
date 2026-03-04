# 使用 n8n 官方映像檔
FROM docker.n8n.io/n8nio/n8n:latest

# 切換到 root 權限來安裝套件
USER root

# 更新系統並安裝 Python 3 和 pip (Debian 系統使用 apt)
RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*

# 安裝爬蟲需要的 Python 庫
# 注意：Debian 12+ 規定必須加上 --break-system-packages 才能在全域安裝
RUN pip3 install --break-system-packages requests pandas --target /usr/local/lib/python3.11/dist-packages

# 切換回 node 用戶
USER node
