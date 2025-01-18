<?php

declare(strict_types=1);

namespace App\Services;

use App\Contracts\StatisticRepositoryInterface;
use App\Models\Statistic;

class StatisticService
{
    private StatisticRepositoryInterface $repository;

    public function __construct(StatisticRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

    public function log(string $type, array $data = []): void
    {
        $statistic = new Statistic($type, $data);
        $this->repository->log($statistic);
    }

    public function getTotalApiCalls(): int
    {
        return $this->repository->getTotalApiCalls();
    }
    public function getTotalErrors(): int
    {
        return $this->repository->getTotalErrors();
    }

    public function getCacheHitsByType(): array
    {
        return $this->repository->getCacheHitsByType();
    }

    public function getCacheMissesByType(): array
    {
        return $this->repository->getCacheMissesByType();
    }
    
    public function getCacheHitRatio(): float
    {
        $hits = $this->getCacheHits();
        $misses = $this->getCacheMisses();
        $total = $hits + $misses;
        
        return $total > 0 ? $hits / $total : 0.0;
    }

    public function getAverageResponseTime(): float
    {
        return $this->repository->getAverageResponseTime();
    }

    public function getCacheHits(): int
    {
        return $this->repository->getCacheHits();
    }
    public function getCacheMisses(): int
    {
        return $this->repository->getCacheMisses();
    }

    public function getCacheStats(): array
    {
        $hits = $this->repository->getCacheHits();
        $misses = $this->repository->getCacheMisses();
        $total = $hits + $misses;
        
        return [
            'hits' => $hits,
            'misses' => $misses,
            'ratio' => $total > 0 ? $hits / $total : 0.0,
            'hits_by_type' => $this->repository->getCacheHitsByType(),
            'misses_by_type' => $this->repository->getCacheMissesByType()
        ];
    }

    public function getRecentErrors(int $limit = 100): array
    {
        return $this->repository->getRecentErrors($limit);
    }

    public function getApiLogsStats(): array
    {
        return $this->repository->getApiLogsStats();
    }

    public function getApiStats(): array
    {
        return [
            'total_calls' => $this->getTotalApiCalls(),
            'avg_response_time' => $this->getAverageResponseTime(),
            'total_errors' => $this->repository->getTotalErrors(),
            'recent_errors' => $this->repository->getRecentErrors(),
            'api_logs' => $this->repository->getApiLogsStats()
        ];
    }
}
