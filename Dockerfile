FROM python:3.12-slim
# Cloady 构建入口：Cloady 默认从仓库根目录构建，按顺序先找 compose、再找 Dockerfile（见 cloady.com/docs/concepts）。
# 小服务源码在 cloady/ 目录，构建上下文是仓库根目录，所以 COPY 用 cloady/app.py。
# 之前的问题：根目录没有 Dockerfile，Cloady 用 railpack 自动检测，跑成了静态主页。
WORKDIR /app
COPY cloady/app.py .
ENV PORT=8080
EXPOSE 8080
CMD ["python3", "app.py"]
