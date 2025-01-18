#!/bin/bash
docker-compose exec db mysql -u root -proot < database/setup.sql 
