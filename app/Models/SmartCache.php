<?php

declare(strict_types=1);

namespace App\Models;


class SmartCache
{
    private string $key;
    private array $data;
    private string $type;
    private \DateTime $expiresAt;
    private int $hits;
    private ?\DateTime $lastAccessedAt;
    private const DEFAULT_TTL = 3600; // 1 hora


    public function __construct(string $key, array $data, string $type, int $ttl = self::DEFAULT_TTL)
    {
        $this->key = $key;
        $this->data = $data;
        $this->type = $type;
        $this->expiresAt = new \DateTime();
        $this->expiresAt->modify('+' . $ttl . ' seconds');
        $this->hits = 0;
        $this->lastAccessedAt = null;
    }

    public function getKey(): string
    {
        return $this->key;
    }

    public function getData(): array
    {
        return $this->data;
    }

    public function getType(): string
    {
        return $this->type;
    }

    public function getExpiresAt(): \DateTime
    {
        return $this->expiresAt;
    }

    public function getHits(): int
    {
        return $this->hits;
    }

    public function incrementHits(): void
    {
        $this->hits++;
        $this->lastAccessedAt = new \DateTime();
    }

    public function isExpired(): bool
    {
        return $this->expiresAt < new \DateTime();
    }

    public function set(string $key, array $data, string $type, int $ttl = self::DEFAULT_TTL): bool
    {
        $this->key = $key;
        $this->data = $data;
        $this->type = $type;
        $this->expiresAt = new \DateTime();
        $this->expiresAt->modify('+' . $ttl . ' seconds');
        $this->hits = 0;
        $this->lastAccessedAt = null;
        return true;
    }

    public function cleanup(): void
    {
       
    }

 
} 
