<?php

declare(strict_types=1);

namespace App\Contracts;

use App\Models\Favorite;
interface FavoriteRepositoryInterface
{
    public function add(Favorite $favorite): bool;
    public function remove(int $filmId): bool;
    public function isFavorite(int $filmId): bool;
    public function getAllFavorites(): array;
}
