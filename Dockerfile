FROM php:7.4-fpm

# Instalar dependências
RUN apt-get update && apt-get install -y \
    nginx \
    libzip-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-install pdo pdo_mysql zip

# Configurar o PHP
COPY docker/php.ini /usr/local/etc/php/conf.d/custom.ini

# Configurar o Nginx
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default

# Criar diretório de logs
RUN mkdir -p /var/www/html/logs

# Copiar arquivos do projeto
COPY . /var/www/html/

# Configurar permissões
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/logs

# Copiar script de inicialização
COPY docker/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/local/bin/init.sh"] 
