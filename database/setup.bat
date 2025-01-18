@echo off
echo Executando setup inicial do banco de dados...

REM Executar setup.sql
mysql -u root -p star_wars_db -e "source setup.sql"

echo.
echo Executando migrações...
php migrate.php

echo.
echo Setup completo!
pause 
