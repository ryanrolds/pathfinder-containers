#!/usr/bin/env bash
set -e
crontab /var/crontab.txt
envsubst '$DOMAIN' </etc/nginx/templateSite.conf >/etc/nginx/sites_enabled/site.conf
envsubst '$PATHFINDER_SOCKET_HOST' </etc/nginx/templateNginx.conf >/etc/nginx/nginx.conf
envsubst </etc/php7/php-fpm.d/zzz_custom.conf.temp >/etc/php7/php-fpm.d/zzz_custom.conf
envsubst </etc/zzz_custom.ini >/etc/php7/conf.d/zzz_custom.ini
htpasswd -c -b -B  /etc/nginx/.setup_pass pf "$APP_PASSWORD"
exec "$@"
