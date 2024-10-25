FROM registry.cn-beijing.aliyuncs.com/gldsg-lpd/databox-videobox-web-base:heima as builder
WORKDIR /root/dist/

COPY . .
RUN npm install
RUN npm run build
RUN ls -l dist/

FROM dockerpull.com/nginx:latest as prod
RUN mkdir -p /databox/admin/
COPY --from=builder /root/dist/dist /databox/admin/
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
