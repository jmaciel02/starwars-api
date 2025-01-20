# Catálogo de Filmes Star Wars

## Visão Geral
Este projeto é um catálogo de filmes Star Wars que consome a SWAPI (Star Wars API) para exibir informações sobre os filmes da saga. O projeto foi desenvolvido seguindo as melhores práticas de programação, padrões de projeto e princípios SOLID.

## Tecnologias Utilizadas

### Backend
- PHP 7.4+
- MySQL 5.7+
- PDO para conexão com banco de dados


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
│   ├── Contracts/       # Contratos de interfaces
│   ├── Controllers/     # Controladores da aplicação 
│   ├── Helpers/         # Classes auxiliares
│   ├── Models/          # Modelos de dados
│   ├── Repositories/    # Camada de acesso a dados
│   └── Services/        # Serviços e lógica de negócio
├── config/              # Arquivos de configuração
├── database/            # Arquivos de configuração do banco de dados
│   ├── schema.sql       # Esquema do banco de dados
│   ├── setup.sh         # Script de instalação Linux/Mac
│   ├── setup-docker.bat # Script de instalação Windows   
│   └── setup.bat        # Script de instalação Windows
├── docker/              # Arquivos de configuração Docker   
├── docs/                # Documentação do projeto
│   ├── INSTALL.md       # Instruções de instalação
│   ├── API.md           # Documentação da API
│   └── FEATURES.md      # Melhorias implementadas
│   └── README.md        # Visão geral e guia rápido
├── logs/                # Logs da aplicação
├── public/              # Arquivos públicos (ponto de entrada)
│   ├── css/
│   ├── js/
│   └── index.php
├── resources/           # Views e assets
│   └── views/
├── routes/              # Definições de rotas
├── tests/               # Testes da aplicação
├── xampp/               # Instruções de configuração XAMPP
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
- Git

## Instalação Rápida

1. Clone o repositório
```bash
git clone https://github.com/jmaciel02/starwars-api.git
cd starwars-api
```

2. Configure o banco de dados
- Importe `database/schema.sql`
- Configure `config/database.php`

3. Configure o servidor web
- Apache: Configure o VirtualHost
- PHP built-in: `php -S localhost:8000 -t public`

4. Acesse a aplicação
```
http://localhost:8000
```

## Exemplos de Uso

### Listar Filmes
```bash
curl http://localhost:8000/films
```

### Ver Detalhes do Filme
```bash
curl http://localhost:8000/films/1
```

### Ver Estatísticas
```bash
curl http://localhost:8000/stats
```


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
