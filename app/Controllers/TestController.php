<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Services\StarWarsApiClient;
use App\Repositories\StatisticRepository;
use App\Repositories\SmartCacheRepository;
use App\Repositories\ApiLogRepository;
use App\Helpers\Database;

class TestController
{
    private StarWarsApiClient $apiClient;
    private StatisticRepository $statisticRepository;
    private SmartCacheRepository $cacheRepository;
    private ApiLogRepository $apiLogRepository;

    public function __construct()
    {
        $this->statisticRepository = new StatisticRepository();
        $this->cacheRepository = new SmartCacheRepository($this->statisticRepository);
        $this->apiLogRepository = new ApiLogRepository();
    
        $this->apiClient = new StarWarsApiClient(
            $this->cacheRepository,
            $this->statisticRepository,
            $this->apiLogRepository
        );
    }

    public function testCache(): void
    {
        $output = [];
        $db = Database::getInstance();

        // Limpar tabelas
        $db->exec("TRUNCATE TABLE smart_cache");
        $db->exec("TRUNCATE TABLE statistics");
        $db->exec("TRUNCATE TABLE api_logs");
        $output[] = "Tabelas limpas.";

        // Teste 1: Primeira chamada
        $output[] = "\nTeste 1: Primeira chamada para filme 1";
        $film = $this->apiClient->getFilm(1);
        $output[] = "Cache misses: " . $this->statisticRepository->getCacheMisses();
        $output[] = "Cache hits: " . $this->statisticRepository->getCacheHits();

        // Teste 2: Segunda chamada
        $output[] = "\nTeste 2: Segunda chamada para filme 1";
        $film = $this->apiClient->getFilm(1);
        $output[] = "Cache misses: " . $this->statisticRepository->getCacheMisses();
        $output[] = "Cache hits: " . $this->statisticRepository->getCacheHits();

        // Teste 3: Verificar cache
        $sql = "SELECT * FROM smart_cache WHERE cache_key = 'film_1'";
        $result = $db->query($sql)->fetch(\PDO::FETCH_ASSOC);
        $output[] = "\nDados no cache:";
        $output[] = print_r($result, true);

        // Teste 4: Verificar estatísticas
        $sql = "SELECT * FROM statistics ORDER BY created_at DESC LIMIT 5";
        $result = $db->query($sql)->fetchAll(\PDO::FETCH_ASSOC);
        $output[] = "\nÚltimas estatísticas:";
        $output[] = print_r($result, true);

        // Renderizar resultados
        $this->render($output);
    }

    private function render(array $output): void
    {
        header('Content-Type: text/plain');
        echo implode("\n", $output);
    }
} 
