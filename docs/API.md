# Documentação da API

## Endpoints Disponíveis

### 1. Listar Filmes
```
GET /films
```
Retorna a lista de todos os filmes ordenados por data de lançamento.

### 2. Detalhes do Filme
```
GET /films/{id}
```
Retorna os detalhes completos de um filme específico.

**Parâmetros:**
- `id`: ID do episódio do filme (1-6)

**Exemplo de Resposta:**
```json
{
    "title": "A New Hope",
    "episode_id": 4,
    "opening_crawl": "...",
    "director": "George Lucas",
    "producer": "Gary Kurtz, Rick McCallum",
    "release_date": "1977-05-25",
    "characters": [...],
    "age": {
        "years": 46,
        "months": 7,
        "days": 15
    }
}
```

### 3. Estatísticas
```
GET /stats
```
Retorna estatísticas de uso da API.

### 4. Status do Cache
```
GET /cache/status
```
Retorna informações sobre o cache do sistema.

## Códigos de Erro
- 200: Sucesso
- 404: Recurso não encontrado
- 500: Erro interno do servidor

## Headers
```
Content-Type: application/json
```

## Rate Limiting
- 100 requisições por minuto por IP
- Headers de resposta incluem X-RateLimit-Limit e X-RateLimit-Remaining
