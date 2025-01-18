@echo off
echo Executando setup inicial do banco de dados no Docker...

REM Executar setup.sql no container do MySQL
docker-compose exec db mysql -u root -proot star_wars_db -e "source /docker-entrypoint-initdb.d/setup.sql"

echo.
echo Executando migrações...
docker-compose exec app php /var/www/html/database/migrate.php

echo.
echo Setup completo!
pause 
