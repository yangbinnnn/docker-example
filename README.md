# docker-example

- 多阶段编译
- trap 捕获SIGTERM 信息

> `docker stop xxx` 会向容器内`PID=1` 的进程
发送`SIGTERM` 信息，如果响应超时会`SIGKILL`，
为了保证容器内的进程安全退出，最好在entrypoint
中捕获`SIGTERM` 并执行相关保护数据安全的操作，
否则可能导致容器内进程数据丢失，尤其是数据库等应用。

```
# docker build -t hello-trap:0.0.1 .
# docker run --name hello-trap -p 8000:8000 hello-trap:0.0.1
# docker stop hello-trap
```
