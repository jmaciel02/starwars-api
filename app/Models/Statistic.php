<?php

declare(strict_types=1);

namespace App\Models;


class Statistic
{
    private string $type;
    private array $data;
    private \DateTime $createdAt;

    public function __construct(string $type, array $data)
    {
        $this->type = $type;
        $this->data = $data;
        $this->createdAt = new \DateTime();
    }

    public function getType(): string
    {
        return $this->type;
    }

    public function getData(): array
    {
        return $this->data;
    }

    public function getCreatedAt(): \DateTime
    {
        return $this->createdAt;
    }

} 
