#!/bin/bash
php-fpm7.0 -D
rm -f /var/log/nginx/*
ln -s /dev/stdout /var/log/nginx/access.log
ln -s /dev/stderr /var/log/nginx/error.log
ln -s /dev/stdout /var/log/nginx/eqdkp-access.log
ln -s /dev/stderr /var/log/nginx/eqdkp-error.log
nginx
while true; do
  sleep 100
done