<?php

declare(strict_types=1);

namespace App\Models;

class Favorite
{
    private int $filmId;
    private string $filmTitle;
    private \DateTime $createdAt;

    public function __construct(int $filmId, string $filmTitle)
    {
        $this->filmId = $filmId;
        $this->filmTitle = $filmTitle;
        $this->createdAt = new \DateTime();
    }

    public function getFilmId(): int
    {
        return $this->filmId;
    }

    public function getFilmTitle(): string
    {
        return $this->filmTitle;
    }

    public function getCreatedAt(): \DateTime
    {
        return $this->createdAt;
    }
} 
