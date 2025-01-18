# Configuração do Ambiente XAMPP

## Requisitos
- XAMPP com PHP 7.4 ou superior
- MySQL 5.7 ou superior
- Módulos PHP necessários:
  - PDO
  - PDO_MySQL
  - JSON
  - cURL

## Passos para Configuração

1. **Copiar os Arquivos**
   - Clone este repositório para `C:\xampp\htdocs\star-wars-catalog`
   - Ou crie um Virtual Host apontando para o diretório do projeto

2. **Configurar Virtual Host**
   - Abra `C:\xampp\apache\conf\extra\httpd-vhosts.conf`
   - Adicione:
   ```apache
   <VirtualHost *:80>
       DocumentRoot "C:/xampp/htdocs/star-wars-catalog/public"
       ServerName star-wars.local
       <Directory "C:/xampp/htdocs/star-wars-catalog/public">
           Options Indexes FollowSymLinks MultiViews
           AllowOverride All
           Require all granted
       </Directory>
   </VirtualHost>
   ```

3. **Configurar Hosts**
   - Abra `C:\Windows\System32\drivers\etc\hosts` como administrador
   - Adicione: `127.0.0.1 star-wars.local`

4. **Configurar Banco de Dados**
   - Abra o phpMyAdmin (http://localhost/phpmyadmin)
   - Crie um banco de dados chamado `star_wars_db`
   - Execute os scripts em `database/setup.sql`

5. **Verificar Permissões**
   - Certifique-se que o diretório `logs` tem permissão de escrita
   - No Windows: Clique com botão direito > Propriedades > Segurança
   - Adicione permissão de escrita para o usuário IUSR

6. **Testar a Instalação**
   - Acesse http://star-wars.local
   - Você deve ver a página inicial do catálogo
   - Verifique se consegue favoritar filmes
   - Verifique se consegue acessar as estatísticas

## Solução de Problemas

### Erro 404
- Verifique se o mod_rewrite está habilitado
- Verifique se o .htaccess está presente no diretório public
- Verifique as permissões do diretório

### Erro de Banco de Dados
- Verifique se o MySQL está rodando
- Verifique as credenciais em `config/database.php`
- Verifique se o banco de dados foi criado

### Erro de Permissão
- Verifique se o diretório logs tem permissão de escrita
- Verifique se o usuário do Apache tem acesso ao diretório

## Suporte
Em caso de dúvidas, consulte a documentação completa do projeto ou abra uma issue no repositório. 
