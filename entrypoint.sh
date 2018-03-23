#!/usr/bin/env bash
APP=app

# 启动程序并获取进程号
chmod +x ${APP}
./${APP} &
pid=${!}

function safeShutdown {
    echo "do something..."
    kill -9 ${pid}
    echo "shutdown..."
    exit 0
}

# 使用trap 捕获信号
trap safeShutdown SIGTERM
trap safeShutdown SIGINT

# 保持容器运行
while true; do :; done

