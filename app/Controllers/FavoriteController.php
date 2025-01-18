<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\FavoriteRepository;
use App\Services\FavoriteService;

class FavoriteController
{
    private FavoriteService $favoriteService;

    public function __construct()
    {   
        $repository = new FavoriteRepository();
        $this->favoriteService = new FavoriteService($repository);
    }

    public function toggle(): void
    {
        try {
            // Validar entrada
            $filmId = filter_input(INPUT_POST, 'film_id', FILTER_VALIDATE_INT);
            $filmTitle = filter_input(INPUT_POST, 'film_title', FILTER_SANITIZE_STRING);

            if (!$filmId || !$filmTitle) {
                $this->jsonResponse(['success' => false, 'message' => 'Dados inválidos'], 400);
                return;
            }

            // Verificar se já é favorito
            if ($this->favoriteService->isFavorite($filmId)) {
                // Remover dos favoritos
                $success = $this->favoriteService->removeFavorite($filmId);
                $this->jsonResponse([
                    'success' => $success,
                    'is_favorite' => false,
                    'message' => $success ? 'Filme removido dos favoritos' : 'Erro ao remover dos favoritos'
                ]);
            } else {
                // Adicionar aos favoritos
                $success = $this->favoriteService->addFavorite($filmId, $filmTitle);
                $this->jsonResponse([
                    'success' => $success,
                    'is_favorite' => true,
                    'message' => $success ? 'Filme adicionado aos favoritos' : 'Erro ao adicionar aos favoritos'
                ]);
            }
        } catch (\Exception $e) {
            error_log("Erro no toggle de favoritos: " . $e->getMessage());
            $this->jsonResponse([
                'success' => false,
                'message' => 'Erro ao processar sua solicitação'
            ], 500);
        }
    }

    public function isFavorite(int $filmId): bool
    {
        return $this->favoriteService->isFavorite($filmId);
    }

    private function jsonResponse(array $data, int $statusCode = 200): void
    {
        http_response_code($statusCode);
        header('Content-Type: application/json');
        echo json_encode($data);
        exit;
    }
} 
