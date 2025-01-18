<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Helpers\Database;
use App\Models\Statistic;
use App\Models\SmartCache;
use App\Contracts\SmartCacheRepositoryInterface;

use PDO;
use DateTime;

class SmartCacheRepository implements SmartCacheRepositoryInterface
{
    private PDO $db;
    private StatisticRepository $statisticRepository;
 

    public function __construct(StatisticRepository $statisticRepository)
    {
        $this->db = Database::getInstance();
        $this->statisticRepository = $statisticRepository;
    }

    public function get(string $key): ?SmartCache
    {
        try {
            error_log("[DEBUG] Buscando no cache: key = {$key}");
            
            // Buscamos o item no cache
            $sql = "SELECT id, cache_value, cache_type, hits 
                    FROM smart_cache 
                    WHERE cache_key = :key 
                    AND expires_at > UTC_TIMESTAMP()";
            
            $stmt = $this->db->prepare($sql);
            $stmt->execute([':key' => $key]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            // Log the raw result for debugging
            error_log("[DEBUG] Raw cache result: " . print_r($result, true));

            if ($result && isset($result['cache_value']) && $result['cache_value'] !== '') {
                $data = json_decode($result['cache_value'], true);
                
                if ($data !== null) {
                    try {

                        $cache = new SmartCache(
                            $key,
                            $data,
                            $result['cache_type']
                        );
                        // Atualizar hits diretamente sem transação primeiro
                        $updateSql = "UPDATE smart_cache 
                                    SET hits = hits + 1,
                                        last_accessed = UTC_TIMESTAMP() 
                                    WHERE id = :id";
                        
                        $updateStmt = $this->db->prepare($updateSql);
                        $updateSuccess = $updateStmt->execute([':id' => $result['id']]);
                        
                        if ($updateSuccess) {
                            error_log("[DEBUG] Cache hit atualizado: key = {$key}, novo total = " . ($result['hits'] + 1));
                            
                            // Registrar estatística separadamente log do cache hit
                            $this->logCacheHit($key, $result['cache_type'], $result['hits'] + 1);
                           /* $this->statisticRepository->log('cache_hit', [
                                'key' => $key,
                                'type' => $result['cache_type'],
                                'hits' => $result['hits'] + 1
                            ]);*/

                            
                            error_log("[DEBUG] Cache hit registrado com sucesso");
                            return $cache;
                        } else {
                            error_log("[ERROR] Falha ao atualizar hits: " . print_r($updateStmt->errorInfo(), true));
                        }
                    } catch (\Exception $e) {
                        error_log("[ERROR] Erro ao processar hit: " . $e->getMessage());
                        error_log("[ERROR] Stack trace: " . $e->getTraceAsString());
                        // Retornamos os dados mesmo se falhar o registro do hit
                        return $data;
                    }
                } else {
                    error_log("[ERROR] Falha ao decodificar JSON do cache para key = {$key}");
                }
            }

            // Se chegamos aqui, é um cache miss log do cache miss
            error_log("[DEBUG] Cache miss: key = {$key}");
            $this->logCacheMiss($key, $result['cache_type'] ?? null);
            /*$this->statistic->log('cache_miss', [
                'key' => $key,
                'type' => $result['cache_type'] ?? 'unknown'
            ]);*/

            return null;
        } catch (\Exception $e) {
            error_log("[ERROR] Erro ao obter do cache: " . $e->getMessage());
            error_log("[ERROR] Stack trace: " . $e->getTraceAsString());
            return null;
        }
    }

    public function set(string $key, array $data, string $type, int $ttl): bool
    {
        try {
            error_log("[DEBUG] Salvando no cache: key = {$key}, type = {$type}");
            
            $expiresAt = new DateTime("now", new \DateTimeZone('UTC'));
            $expiresAt->modify("+{$ttl} seconds");

            // Primeiro verificamos se o item já existe
            $sql = "SELECT id FROM smart_cache WHERE cache_key = :key";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([':key' => $key]);
            $exists = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($exists) {
                // Update
                $sql = "UPDATE smart_cache 
                        SET cache_value = :value,
                            cache_type = :type,
                            expires_at = :expires_at,
                            last_accessed = NULL
                        WHERE cache_key = :key";
            } else {
                // Insert
                $sql = "INSERT INTO smart_cache 
                        (cache_key, cache_value, cache_type, expires_at, hits, last_accessed) 
                        VALUES (:key, :value, :type, :expires_at, 0, NULL)";
            }

            $stmt = $this->db->prepare($sql);
            $success = $stmt->execute([
                ':key' => $key,
                ':value' => json_encode($data),
                ':type' => $type,
                ':expires_at' => $expiresAt->format('Y-m-d H:i:s')
            ]);

            if ($success) {
                error_log("[DEBUG] Salvo com sucesso no cache: key = {$key}, type = {$type}");
            } else {
                error_log("[ERROR] Falha ao salvar no cache: key = {$key}, type = {$type}");
                error_log("[ERROR] Erro PDO: " . print_r($stmt->errorInfo(), true));
            }

            return $success;
        } catch (\Exception $e) {
            error_log("[ERROR] Erro ao salvar no cache: " . $e->getMessage());
            error_log("[ERROR] Stack trace: " . $e->getTraceAsString());
            return false;
        }
    }

    private function logCacheHit(string $key, string $type, int $hits): void
    {
        $statistic = new Statistic('cache_hit', [
            'key' => $key,
            'type' => $type,
            'hits' => $hits
        ]);
        $this->statisticRepository->log($statistic);
    }

    private function logCacheMiss(string $key, ?string $type): void
    {
        $statistic = new Statistic('cache_miss', ['key' => $key, 'type' => $type ?? 'unknown']);
        $this->statisticRepository->log($statistic);
    }

    public function cleanup(): void
    {
        try {
            $sql = "DELETE FROM smart_cache WHERE expires_at <= UTC_TIMESTAMP()";
            $this->db->exec($sql);
        } catch (\Exception $e) {
            error_log("[ERROR] Erro ao limpar cache: " . $e->getMessage());
        }
    }

    public function getStats(): array
    {
        try {
            $sql = "SELECT cache_type, 
                           COUNT(*) as total_entries,
                           SUM(hits) as total_hits,
                           AVG(hits) as avg_hits,
                           MAX(hits) as max_hits
                    FROM smart_cache
                    GROUP BY cache_type";
            
            return $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        } catch (\Exception $e) {
            error_log("[ERROR] Erro ao obter estatísticas: " . $e->getMessage());
            return [];
        }
    }
}
