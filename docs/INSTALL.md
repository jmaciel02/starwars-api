## Requisitos

- PHP 7.4
- MySQL 5.7
- Apache com mod_rewrite habilitado
- Docker e Docker Compose (opcional)

## Instalação com Docker (Recomendado)

1. Clone o repositório:
```bash
https://github.com/jmaciel02/starwars-api.git
cd starwars-api
```

2. Inicie os containers:
```bash
docker-compose up -d
```

3. Acesse a aplicação em:
```
http://localhost:8080
```

## Instalação com XAMPP

1. Clone o repositório na pasta htdocs do XAMPP:
```bash
cd C:\xampp\htdocs
git clone https://github.com/jmaciel02/starwars-api.git
cd starwars-api
```

2. Configure o Virtual Host:
- Copie o conteúdo do arquivo `xampp-vhost.conf` para `C:\xampp\apache\conf\extra\httpd-vhosts.conf`
- Adicione a seguinte linha ao arquivo `C:\Windows\System32\drivers\etc\hosts`:
```
127.0.0.1 star-wars.local
```

3. Crie o banco de dados:
- Abra o phpMyAdmin (http://localhost/phpmyadmin)
- Crie um novo banco de dados chamado `star_wars_db`
- Importe o arquivo `database/schema.sql`

4. Configure o banco de dados:
- Edite o arquivo `config/database.php` com suas credenciais

5. Reinicie o Apache no XAMPP

6. Acesse a aplicação em:
```
http://star-wars.local
```
