FROM docker.n8n.io/n8nio/n8n:latest
USER root
RUN apk add --update --no-cache python3 py3-pip
RUN pip3 install --break-system-packages requests pandas
USER node
