<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Services\StatisticService;
use App\Repositories\StatisticRepository;



class StatisticController
{
    private StatisticService $statisticService;

    public function __construct()
    {
        $repository = new StatisticRepository();
        $this->statisticService = new StatisticService($repository);
    }

    public function index(): void
    {
        $stats = [
            'total_requests' => $this->statisticService->getTotalApiCalls(),
            'avg_response_time' => $this->statisticService->getAverageResponseTime(),
            'cache_hits' => $this->statisticService->getCacheHits(),
            'cache_misses' => $this->statisticService->getCacheMisses(),
            'total_errors' => $this->statisticService->getTotalErrors(),
            'api_logs_stats' => $this->statisticService->getApiLogsStats()
        ];

        $this->render('stats/index', ['stats' => $stats]);
    }

    public function cache(): void
    {
        $cacheStats = [
            'hits' => $this->statisticService->getCacheHitsByType(),
            'misses' => $this->statisticService->getCacheMissesByType(),
            'ratio' => $this->statisticService->getCacheHitRatio()
        ];

        $this->render('stats/cache', ['stats' => $cacheStats]);
    }

    public function errors(): void
    {
        $errors = $this->statisticService->getRecentErrors();
        $this->render('stats/errors', ['errors' => $errors]);
    }

    private function render(string $view, array $data = []): void
    {
        extract($data);
        require __DIR__ . "/../../resources/views/{$view}.php";
    }
} 
