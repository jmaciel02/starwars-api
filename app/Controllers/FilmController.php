<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Services\StarWarsApiClient;
use App\Repositories\StatisticRepository;
use App\Repositories\SmartCacheRepository;
use App\Repositories\ApiLogRepository;
use RuntimeException;

class FilmController
{
    private StarWarsApiClient $apiClient;

    public function __construct()
    {
        $statisticRepository = new StatisticRepository();
        $cacheRepository = new SmartCacheRepository($statisticRepository);
        $apiLogRepository = new ApiLogRepository();
    
        $this->apiClient = new StarWarsApiClient(
            $cacheRepository,
            $statisticRepository,
            $apiLogRepository
        );
    }

    public function index(): void
    {
        try {
            $response = $this->apiClient->getAllFilms();
            $films = $response['results'] ?? [];

            if (empty($films)) {
                throw new RuntimeException('Nenhum filme encontrado');
            }

            // Ordenar filmes por data de lançamento
            usort($films, function ($a, $b) {
                return strtotime($a['release_date']) - strtotime($b['release_date']);
            });

            $this->render('films/index', ['films' => $films]);
        } catch (RuntimeException $e) {
            error_log("Erro na página inicial: " . $e->getMessage());
            $this->render('error', ['message' => $e->getMessage()]);
        }
    }

    public function show(int $id): void
    {
        try {
            $film = $this->apiClient->getFilm($id);
            $characters = [];

            // Buscar informações dos personagens
            foreach (array_slice($film['characters'], 0, 5) as $characterUrl) {
                try {
                    $characters[] = $this->apiClient->getCharacter($characterUrl);
                } catch (RuntimeException $e) {
                    error_log("Erro ao buscar personagem {$characterUrl}: " . $e->getMessage());
                    continue;
                }
            }

            $age = $this->apiClient->calculateMovieAge($film['release_date']);

            $data = [
                'film' => $film,
                'characters' => $characters,
                'age' => $age
            ];

            $this->render('films/show', $data);
        } catch (RuntimeException $e) {
            error_log("Erro ao exibir filme {$id}: " . $e->getMessage());
            $this->render('error', ['message' => $e->getMessage()]);
        }
    }

    private function render(string $view, array $data = []): void
    {
        try {
            extract($data);
            
            $viewPath = __DIR__ . "/../../resources/views/{$view}.php";
            
            if (!file_exists($viewPath)) {
                throw new RuntimeException("View não encontrada: {$view}");
            }

            // Iniciar output buffering
            ob_start();
            require $viewPath;
            $content = ob_get_clean();

            // Renderizar o layout com o conteúdo
            require __DIR__ . "/../../resources/views/layout.php";
        } catch (RuntimeException $e) {
            error_log("Erro ao renderizar view {$view}: " . $e->getMessage());
            http_response_code(500);
            echo "Erro ao renderizar a página: " . $e->getMessage();
        }
    }
} 
