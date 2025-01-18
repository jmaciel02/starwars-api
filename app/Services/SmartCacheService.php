<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\SmartCache;
use App\Contracts\SmartCacheRepositoryInterface;
use App\Repositories\SmartCacheRepository;

class SmartCacheService
{
    private SmartCacheRepository $repository;

    public function __construct(SmartCacheRepository $repository)
    {
        $this->repository = $repository;
    }

    public function get(string $key): mixed
    {
        return $this->repository->get($key);
    }

    public function set(string $key, array $data, string $type, int $ttl): bool
    {
        return $this->repository->set($key, $data, $type, $ttl);
    }

    public function cleanup(): void
    {
        $this->repository->cleanup();
    }

    public function getStats(): array
    {
        return $this->repository->getStats();
    }
}
