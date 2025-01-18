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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Logs de requisições à API';

-- Tabela de cache (opcional, para otimização)
CREATE TABLE IF NOT EXISTS api_cache (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cache_key VARCHAR(255) NOT NULL COMMENT 'Chave única do cache',
    cache_value TEXT NOT NULL COMMENT 'Valor em cache',
    expires_at TIMESTAMP NOT NULL COMMENT 'Data de expiração',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação',
    UNIQUE KEY unique_cache_key (cache_key),
    INDEX idx_expires_at (expires_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Cache de respostas da API'; 
