# docker 打包命令如下
# docker build -t otusvmap/web:dev .

FROM nginx:1.13.3-alpine
COPY /public /usr/share/nginx/html