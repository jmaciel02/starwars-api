<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Contracts\StatisticRepositoryInterface;
use App\Models\Statistic;
use App\Helpers\Database;
use PDO;

class StatisticRepository implements StatisticRepositoryInterface
{
    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function log(Statistic $statistic): void
    {
        error_log("[DEBUG] Registrando estatística: tipo = " . $statistic->getType() . ", dados = " . json_encode($statistic->getData()));
        
        $sql = "INSERT INTO statistics (type, details) VALUES (:type, :details)";
        $stmt = $this->db->prepare($sql);
        $success = $stmt->execute([
            ':type' => $statistic->getType(),
            ':details' => json_encode($statistic->getData())
        ]);

        if ($success) {
            error_log("[DEBUG] Estatística registrada com sucesso");
            
            // Verificar o registro
            $id = $this->db->lastInsertId();
            $sql = "SELECT * FROM statistics WHERE id = :id";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([':id' => $id]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            error_log("[DEBUG] Registro inserido: " . print_r($result, true));
        } else {
            error_log("[DEBUG] Erro ao registrar estatística");
            error_log("[DEBUG] Erro PDO: " . print_r($stmt->errorInfo(), true));
        }
    }

    public function getTotalApiCalls(): int
    {
        $sql = "SELECT COUNT(*) FROM statistics WHERE type = 'api_call'";
        $count = (int) $this->db->query($sql)->fetchColumn();
        error_log("[DEBUG] Total de chamadas API: " . $count);
        return $count;
    }

    public function getAverageResponseTime(): float
    {
        $sql = "SELECT AVG(CAST(JSON_UNQUOTE(JSON_EXTRACT(details, '$.response_time')) AS DECIMAL(10,2))) 
                FROM statistics 
                WHERE type = 'api_call'";
        $avg = (float) $this->db->query($sql)->fetchColumn() ?? 0.0;
        error_log("[DEBUG] Tempo médio de resposta: " . $avg);
        return $avg;
    }

    public function getCacheHits(): int
    {
        $sql = "SELECT COUNT(*) FROM statistics WHERE type = 'cache_hit'";
        $count = (int) $this->db->query($sql)->fetchColumn();
        error_log("[DEBUG] Total de cache hits: " . $count);
        return $count;
    }

    public function getCacheMisses(): int
    {
        $sql = "SELECT COUNT(*) FROM statistics WHERE type = 'cache_miss'";
        $count = (int) $this->db->query($sql)->fetchColumn();
        error_log("[DEBUG] Total de cache misses: " . $count);
        return $count;
    }

    public function getTotalErrors(): int
    {
        $sql = "SELECT COUNT(*) FROM statistics WHERE type = 'error'";
        $count = (int) $this->db->query($sql)->fetchColumn();
        error_log("[DEBUG] Total de erros: " . $count);
        return $count;
    }

    public function getCacheHitsByType(): array
    {
        error_log("[DEBUG] Buscando cache hits por tipo");
        
        $sql = "SELECT 
                    resource_type,
                    COUNT(*) as count 
                FROM (
                    SELECT 
                        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(details, '$.type')), 'unknown') as resource_type
                    FROM statistics 
                    WHERE type = 'cache_hit'
                ) as subquery
                GROUP BY resource_type";
        
        $result = $this->db->query($sql)->fetchAll(PDO::FETCH_KEY_PAIR);
        error_log("[DEBUG] Cache hits por tipo: " . print_r($result, true));
        return $result ?: [];
    }

    public function getCacheMissesByType(): array
    {
        error_log("[DEBUG] Buscando cache misses por tipo");
        
        $sql = "SELECT 
                    resource_type,
                    COUNT(*) as count 
                FROM (
                    SELECT 
                        COALESCE(JSON_UNQUOTE(JSON_EXTRACT(details, '$.type')), 'unknown') as resource_type
                    FROM statistics 
                    WHERE type = 'cache_miss'
                ) as subquery
                GROUP BY resource_type";
        
        $result = $this->db->query($sql)->fetchAll(PDO::FETCH_KEY_PAIR);
        error_log("[DEBUG] Cache misses por tipo: " . print_r($result, true));
        return $result ?: [];
    }

    public function getRecentErrors(int $limit = 100): array
    {
        $sql = "SELECT id, type, 
                JSON_UNQUOTE(JSON_EXTRACT(details, '$.message')) as message,
                details,
                created_at
                FROM statistics 
                WHERE type = 'error'
                ORDER BY created_at DESC 
                LIMIT :limit";
        
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->execute();
        
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        error_log("[DEBUG] Erros recentes: " . print_r($result, true));
        return $result;
    }

     /**
     * Obtém estatísticas relevantes dos logs da API
     */
    public function getApiLogsStats(): array
    {
        try {
            // Total de requisições
            $totalRequests = $this->db->query("
                SELECT COUNT(*) FROM api_logs
            ")->fetchColumn();

            // Requisições com sucesso (código 200)
            $successfulRequests = $this->db->query("
                SELECT COUNT(*) FROM api_logs 
                WHERE response_code = 200
            ")->fetchColumn();

            // Tempo médio de resposta (últimas 24h)
            $avgResponseTime = $this->getAverageResponseTime();

            // Top 5 endpoints mais acessados
            $stmt = $this->db->query("
                SELECT endpoint, COUNT(*) as count
                FROM api_logs
                GROUP BY endpoint
                ORDER BY count DESC
                LIMIT 5
            ");
            $topEndpoints = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // Últimos 5 erros
            $stmt = $this->db->query("
                SELECT endpoint, response_code, created_at
                FROM api_logs
                WHERE response_code >= 400
                ORDER BY created_at DESC
                LIMIT 5
            ");
            $recentErrors = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return [
                'total_requests' => $totalRequests,
                'successful_requests' => $successfulRequests,
                'success_rate' => $totalRequests > 0 
                    ? round(($successfulRequests / $totalRequests) * 100, 2) 
                    : 0,
                'avg_response_time' => $avgResponseTime,
                'top_endpoints' => $topEndpoints,
                'recent_errors' => $recentErrors
            ];
        } catch (\Exception $e) {
            error_log("[ERROR] Erro ao obter estatísticas de API logs: " . $e->getMessage());
            return [];
        }
    }
} 
