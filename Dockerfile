FROM ubuntu:24.04

LABEL maintainer="dwtygroup7"

ENV TZ=Asia/Brunei

RUN apt-get update && \
    apt-get install -y php8.3 php8.3-fpm php8.3-cli php8.3-mysql php8.3-mbstring php8.3-xml php8.3-curl \
    nginx curl git unzip composer supervisor && \
    apt-get clean

WORKDIR /var/www/html

COPY . .

COPY ./nginx/default /etc/nginx/sites-available/default
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
