# Catálogo de Filmes Star Wars

## Visão Geral
Este projeto é um catálogo de filmes Star Wars que consome a SWAPI (Star Wars API) para exibir informações sobre os filmes da saga. O projeto foi desenvolvido seguindo as melhores práticas de programação, padrões de projeto e princípios SOLID.

## Tecnologias Utilizadas

### Backend
- PHP 7.4+
- MySQL 5.7+
- PDO para conexão com banco de dados
- Composer para autoload de classes

### Frontend
- HTML5
- CSS3 (Bootstrap 5)
- JavaScript (jQuery)
- Font Awesome para ícones

### APIs e Serviços
- SWAPI (Star Wars API)
- cURL para requisições HTTP

## Arquitetura do Projeto

### Padrões de Projeto Implementados
1. **MVC (Model-View-Controller)**
   - Separação clara entre lógica de negócios, apresentação e controle
   - Controllers em `app/Controllers`
   - Views em `resources/views`
   - Models em `app/Models`

2. **Repository Pattern**
   - Abstração da camada de dados
   - Repositories em `app/Repositories`
   - Separação entre lógica de negócios e acesso a dados

3. **Singleton Pattern**
   - Utilizado na conexão com banco de dados
   - Garante uma única instância de conexão

### Princípios SOLID Aplicados
1. **Single Responsibility Principle**
   - Cada classe tem uma única responsabilidade
   - Controllers focados em coordenar ações
   - Repositories focados em acesso a dados

2. **Open/Closed Principle**
   - Classes extensíveis sem modificação
   - Uso de interfaces e abstrações

3. **Interface Segregation**
   - Interfaces específicas para cada contexto
   - Evita dependências desnecessárias

4. **Dependency Inversion**
   - Dependência de abstrações
   - Injeção de dependências nos construtores

## Funcionalidades

### 1. Catálogo de Filmes
- Listagem de todos os filmes
- Detalhes de cada filme
- Informações sobre personagens

### 2. Sistema de Favoritos
- Marcar/Desmarcar filmes como favoritos
- Persistência em banco de dados
- Interface interativa

### 3. Cache Inteligente
- Cache de requisições à API
- Melhoria de performance
- Redução de chamadas à API

### 4. Sistema de Estatísticas
- Monitoramento de chamadas à API
- Performance do cache
- Log de erros

## Estrutura de Diretórios

```
project/
├── app/
│   ├── Controllers/    # Controladores da aplicação
│   ├── Models/         # Models e entidades
│   ├── Repositories/   # Camada de acesso a dados
│   ├── Helpers/        # Classes utilitárias
│   └── Services/       # Serviços da aplicação
├── config/             # Arquivos de configuração
├── database/          
│   ├── migrations/     # Scripts de migração
│   └── setup.sql      # Script inicial do banco
├── public/            
│   ├── css/           # Arquivos CSS
│   ├── js/            # Arquivos JavaScript
│   └── index.php      # Ponto de entrada
├── resources/
│   └── views/         # Templates e views
├── routes/            # Definição de rotas
├── logs/              # Logs da aplicação
└── vendor/            # Dependências
```

## Boas Práticas Implementadas

### 1. Segurança
- Validação de entrada de dados
- Prevenção contra SQL Injection
- Sanitização de saída
- Tratamento de erros

### 2. Performance
- Sistema de cache
- Otimização de queries
- Lazy loading de recursos
- Minimização de requisições

### 3. Manutenibilidade
- Código bem documentado
- Nomenclatura clara
- Separação de responsabilidades
- Logs detalhados

### 4. Escalabilidade
- Arquitetura modular
- Baixo acoplamento
- Alta coesão
- Facilidade de extensão

## Ambiente de Desenvolvimento

### Requisitos
- PHP 7.4 ou superior
- MySQL 5.7 ou superior
- Composer
- Git

### Configuração
1. Clone o repositório
2. Execute `composer install`
3. Configure o banco de dados
4. Execute as migrações
5. Configure o servidor web

## Ambiente de Produção

### Requisitos Mínimos
- Servidor web (Apache/Nginx)
- PHP 7.4+
- MySQL 5.7+
- 512MB RAM
- SSL recomendado

### Deployment
1. Clone o repositório
2. Configure o servidor web
3. Execute setup.sql
4. Configure permissões
5. Teste a aplicação

## Monitoramento e Logs

### Tipos de Logs
1. **Acesso à API**
   - Tempo de resposta
   - Status code
   - Endpoints acessados

2. **Cache**
   - Hit rate
   - Miss rate
   - Invalidações

3. **Erros**
   - Stacktrace
   - Contexto
   - Timestamp

## Considerações de Nível Júnior vs. Pleno

### Aspectos Positivos (Nível Pleno)
- Uso de padrões de projeto
- Implementação de SOLID
- Sistema de cache
- Tratamento de erros
- Documentação completa
- Logs e monitoramento

### Pontos de Melhoria
- Testes automatizados
- CI/CD
- Cache distribuído
- Containerização completa
- API RESTful própria

## Suporte e Manutenção

### Contato
- Email: jesse.maciel02@gmail.com
- GitHub: [\[jesse-maciel\]](https://github.com/jmaciel02)

### Contribuição
1. Fork o projeto
2. Crie uma branch
3. Faça suas alterações
4. Envie um pull request

## Licença
MIT License 
