<?php

declare(strict_types=1);

namespace App\Contracts;

use App\Models\SmartCache;
interface SmartCacheRepositoryInterface
{
    public function get(string $key): ?SmartCache;
    public function set(string $key, array $data, string $type, int $ttl): bool;
    public function cleanup(): void;
    public function getStats(): array;
}
