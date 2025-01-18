<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Models\Favorite;
use App\Contracts\FavoriteRepositoryInterface;
use App\Helpers\Database;
use PDO;
use PDOException;

class FavoriteRepository implements FavoriteRepositoryInterface
{
    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function add(Favorite $favorite): bool
    {
        try {
            $stmt = $this->db->prepare("INSERT INTO favorites (film_id, film_title) VALUES (?, ?)");
            return $stmt->execute([$favorite->getFilmId(), $favorite->getFilmTitle()]);
        } catch (PDOException $e) {
            // Log do erro real
            error_log("Erro ao adicionar favorito: " . $e->getMessage());
            return false;
        }
    }

    public function remove(int $filmId): bool
    {
        try {
            $stmt = $this->db->prepare("DELETE FROM favorites WHERE film_id = ?");
            return $stmt->execute([$filmId]);
        } catch (PDOException $e) {
            error_log("Erro ao remover favorito: " . $e->getMessage());
            return false;
        }
    }

    public function isFavorite(int $filmId): bool
    {
        try {
            $stmt = $this->db->prepare("SELECT COUNT(*) FROM favorites WHERE film_id = ?");
            $stmt->execute([$filmId]);
            return (bool) $stmt->fetchColumn();
        } catch (PDOException $e) {
            error_log("Erro ao verificar favorito: " . $e->getMessage());
            return false;
        }
    }

    public function getAllFavorites(): array
    {
        try {
            return $this->db->query("SELECT * FROM favorites ORDER BY created_at DESC")->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            error_log("Erro ao listar favoritos: " . $e->getMessage());
            return [];
        }
    }
} 
