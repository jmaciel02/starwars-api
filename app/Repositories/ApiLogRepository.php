<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Helpers\Database;
use PDO;

class ApiLogRepository
{
    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function log(
        string $endpoint,
        string $method,
        ?array $requestData = null,
        ?int $responseCode = null,
        ?string $responseBody = null
    ): void {
        try {
            $sql = "INSERT INTO api_logs (endpoint, method, request_data, response_code, response_body) 
                    VALUES (:endpoint, :method, :request_data, :response_code, :response_body)";
            
            $stmt = $this->db->prepare($sql);
            $success = $stmt->execute([
                ':endpoint' => $endpoint,
                ':method' => $method,
                ':request_data' => $requestData ? json_encode($requestData) : null,
                ':response_code' => $responseCode,
                ':response_body' => $responseBody
            ]);

            if (!$success) {
                error_log("[ERROR] Falha ao registrar log da API: " . print_r($stmt->errorInfo(), true));
            }
        } catch (\Exception $e) {
            error_log("[ERROR] Erro ao registrar log da API: " . $e->getMessage());
        }
    }
}
