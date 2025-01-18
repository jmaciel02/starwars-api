<?php

declare(strict_types=1);

namespace App\Contracts;

use App\Models\Statistic;
interface StatisticRepositoryInterface
{
    public function log(Statistic $statistic): void;
    public function getTotalApiCalls(): int;
    public function getAverageResponseTime(): float;
    public function getCacheHits(): int;
    public function getCacheMisses(): int;
    public function getTotalErrors(): int;
    public function getCacheHitsByType(): array;
    public function getCacheMissesByType(): array;
    public function getRecentErrors(int $limit = 100): array;
    public function getApiLogsStats(): array;
}
