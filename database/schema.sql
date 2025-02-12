-- Criar banco de dados se não existir
CREATE DATABASE IF NOT EXISTS star_wars_db;
USE star_wars_db;

-- Tabela de logs da API
CREATE TABLE IF NOT EXISTS api_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    endpoint VARCHAR(255) NOT NULL COMMENT 'Endpoint acessado',
    method VARCHAR(10) NOT NULL COMMENT 'Método HTTP',
    request_data TEXT NULL COMMENT 'Dados da requisição',
    response_code INT NULL COMMENT 'Código de resposta HTTP',
    response_body TEXT NULL COMMENT 'Corpo da resposta',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora do registro',
    INDEX idx_endpoint (endpoint),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de favoritos
CREATE TABLE IF NOT EXISTS favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT NOT NULL,
    film_title VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_film_id (film_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de cache inteligente
CREATE TABLE IF NOT EXISTS smart_cache (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cache_key VARCHAR(255) NOT NULL,
    cache_value TEXT NOT NULL,
    cache_type VARCHAR(50) NOT NULL,
    expires_at TIMESTAMP NOT NULL,
    hits INT DEFAULT 0,
    last_accessed TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_cache_key (cache_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de estatísticas
CREATE TABLE IF NOT EXISTS statistics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL COMMENT 'Tipo do evento (api_call, cache_hit, cache_miss, error)',
    details JSON COMMENT 'Detalhes do evento em formato JSON',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_statistics_type (type),
    INDEX idx_statistics_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
