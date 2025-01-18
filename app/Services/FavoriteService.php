<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\Favorite;
use App\Repositories\FavoriteRepository;

class FavoriteService
{
    private FavoriteRepository $repository;

    public function __construct(FavoriteRepository $repository)
    {
        $this->repository = $repository;
    }

    public function addFavorite(int $filmId, string $filmTitle): bool
    {
        $favorite = new Favorite($filmId, $filmTitle);
        return $this->repository->add($favorite);
    }
    public function removeFavorite(int $filmId): bool
    {
        return $this->repository->remove($filmId);
    }

    public function isFavorite(int $filmId): bool
    {
        return $this->repository->isFavorite($filmId);
    }

    public function getAllFavorites(): array
    {
        return $this->repository->getAllFavorites();
    }
}
