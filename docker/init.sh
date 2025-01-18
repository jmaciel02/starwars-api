#!/bin/sh

# Criar diretórios necessários
mkdir -p /var/www/html/logs

# Configurar permissões
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
chmod -R 777 /var/www/html/logs

# Iniciar PHP-FPM em background
php-fpm -D

# Iniciar Nginx em foreground
nginx -g 'daemon off;' 
