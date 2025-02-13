FROM nginx:1.21.6-alpine

WORKDIR /var/www/html

RUN rm -rf /etc/nginx/conf.d/default.conf

RUN addgroup -S nginxgroup && adduser -S nginxuser -G nginxgroup \
    && chown -R nginxuser:nginxgroup /var/cache/nginx /var/run /var/log/nginx /var/www/html \
    && chmod -R 775 /var/cache/nginx /var/run /var/log/nginx /var/www/html

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/html/index.html

USER nginxuser

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

