# 第一階段：找一個有 Python 的環境把套件裝好
FROM python:3.11-slim-bookworm AS python-build
RUN pip install --no-cache-dir requests pandas

# 第二階段：回到 n8n 環境
FROM docker.n8n.io/n8nio/n8n:latest

# 從第一階段把 Python 的執行檔和套件直接複製過來
COPY --from=python-build /usr/local /usr/local

USER root
# 確保 python3 軟連結在多個常見路徑都存在
RUN ln -s /usr/local/bin/python3 /usr/bin/python3 || true
RUN ln -s /usr/local/bin/python3 /usr/bin/python || true

# 關鍵：給予執行權限
RUN chmod +x /usr/local/bin/python3

USER node
