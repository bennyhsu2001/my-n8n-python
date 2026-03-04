# 第一階段：找一個有 Python 的環境把套件裝好
FROM python:3.11-slim-bookworm AS python-build
RUN pip install --no-cache-dir requests pandas

# 第二階段：回到 n8n 環境
FROM docker.n8n.io/n8nio/n8n:latest

USER root

# 從第一階段把 Python 的執行檔和套件直接複製過來
COPY --from=python-build /usr/local /usr/local

# 建立軟連結，確保系統找不到 python3 時能指向正確位置
RUN ln -s /usr/local/bin/python3 /usr/bin/python3 || true

USER node
