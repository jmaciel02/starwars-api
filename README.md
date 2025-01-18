# Star Wars Catalog

Uma aplicação web para exibir informações sobre os filmes de Star Wars, utilizando a API SWAPI.

## Requisitos

- PHP 7.4
- MySQL 5.7
- Apache com mod_rewrite habilitado
- Docker e Docker Compose (opcional)

## Instalação com Docker (Recomendado)

1. Clone o repositório:
```bash
git clone https://seu-repositorio/star-wars-catalog.git
cd star-wars-catalog
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
git clone https://seu-repositorio/star-wars-catalog.git
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

## Estrutura do Projeto

```
.
├── app/
│   ├── Controllers/    # Controladores da aplicação
│   ├── Models/         # Modelos de dados
│   ├── Services/       # Serviços e lógica de negócio
│   ├── Repositories/   # Camada de acesso a dados
│   └── Helpers/        # Classes auxiliares
├── config/            # Arquivos de configuração
├── database/         # Schemas e migrations
├── docker/          # Arquivos de configuração Docker
├── public/           # Arquivos públicos (ponto de entrada)
│   ├── css/
│   ├── js/
│   └── index.php
├── resources/        # Views e assets
│   └── views/
├── routes/           # Definições de rotas
└── logs/            # Logs da aplicação

## Troubleshooting

### XAMPP - Page Not Found
1. Verifique se o mod_rewrite está habilitado:
   - Abra o XAMPP Control Panel
   - Apache -> Config -> httpd.conf
   - Procure por "mod_rewrite" e certifique-se que a linha não está comentada
   
2. Verifique as permissões do diretório:
   - Clique com o botão direito na pasta do projeto
   - Propriedades -> Segurança
   - Adicione permissões de leitura e execução para o usuário do Apache

3. Verifique o Virtual Host:
   - Confirme se o arquivo de Virtual Host foi configurado corretamente
   - Verifique se o arquivo hosts foi atualizado
   - Reinicie o Apache

### Docker - Problemas Comuns

1. Porta 8080 em uso:
```bash
# Altere a porta no docker-compose.yml
ports:
  - "8081:80"  # ou outra porta disponível
```

2. Erro de permissão:
```bash
# Execute dentro do container
docker-compose exec app chown -R www-data:www-data /var/www/html
```

3. Logs do container:
```bash
# Visualizar logs
docker-compose logs -f app
```

## Suporte

Para reportar bugs ou sugerir melhorias, abra uma issue no repositório do projeto. 
