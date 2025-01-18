<?php

declare(strict_types=1);

namespace App\Helpers;

use PDO;
use DateTime;
use PDOException;

class Logger
{
    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->createLogsTable();
    }

    private function createLogsTable(): void
    {
        $sql = "CREATE TABLE IF NOT EXISTS api_logs (
            id INT AUTO_INCREMENT PRIMARY KEY,
            endpoint VARCHAR(255) NOT NULL,
            method VARCHAR(10) NOT NULL,
            request_data TEXT,
            response_code INT,
            response_body TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )";

        try {
            $this->db->exec($sql);
        } catch (PDOException $e) {
            error_log("Error creating logs table: " . $e->getMessage());
        }
    }

    public function log(
        string $endpoint,
        string $method,
        ?string $requestData = null,
        ?int $responseCode = null,
        ?string $responseBody = null
    ): void {
        $sql = "INSERT INTO api_logs (endpoint, method, request_data, response_code, response_body)
                VALUES (:endpoint, :method, :request_data, :response_code, :response_body)";

        try {
            $stmt = $this->db->prepare($sql);
            $stmt->execute([
                ':endpoint' => $endpoint,
                ':method' => $method,
                ':request_data' => $requestData,
                ':response_code' => $responseCode,
                ':response_body' => $responseBody
            ]);
        } catch (PDOException $e) {
            error_log("Error logging API request: " . $e->getMessage());
        }
    }

    public function getRecentLogs(int $limit = 100): array
    {
        $sql = "SELECT * FROM api_logs ORDER BY created_at DESC LIMIT :limit";
        
        try {
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
            $stmt->execute();
            
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            error_log("Error fetching logs: " . $e->getMessage());
            return [];
        }
    }
} 
