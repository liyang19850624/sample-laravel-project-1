FROM nginx:stable-alpine

WORKDIR /var/www/html

COPY ./app .
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80